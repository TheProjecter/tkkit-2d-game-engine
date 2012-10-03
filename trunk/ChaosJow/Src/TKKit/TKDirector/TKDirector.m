//
//  TKDirector.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import "TKDirector.h"
#import "TKSegue.h"
#import "TKSceneController.h"
#import "TKRenderManager.h"
#import "TKAnimationManager.h"
#import "TKUtility.h"
#import "TKNode.h"

#pragma mark - private declaration
@interface TKDirector()
{
    BOOL controllerHasBeenChanged;
}
@end

@implementation TKDirector

@synthesize sceneController;
@synthesize viewController;
@synthesize renderManager;
@synthesize animationManager;
@synthesize audioManager;

static TKDirector* pInstance;
+ (TKDirector*)mainDirector
{
    return pInstance;
}

#pragma mark - init
- (id)initWithViewController:(UIViewController*)mainViewController
{
    if (self = [super init])
    {
        pInstance = self;
        
        segueArray = [[NSMutableArray alloc] init];
        controllerHasBeenChanged = NO;
        
        viewController = mainViewController;
        renderManager = [[TKRenderManager alloc] initWithDirector:self];
        animationManager = [[TKAnimationManager alloc] init];
        
        [self loadGameResource];
        [self startPlay];
    }
    return self;
}

#pragma mark - ready
- (void)loadGameResource
{
}
- (void)startPlay
{
}

#pragma mark - segue
- (void)addSegue:(TKSegue*)segue
{
    [segueArray addObject:segue];
}
- (void)deleteSegue:(TKSegue*)segue
{
    [segueArray removeObject:segue];
}
- (void)deleteSegueWithIdentifier:(NSString*)identifier
{
    TKSegue* segue;
    for(segue in segueArray)
    {
        if ([segue.identifier compare:identifier] == NSOrderedSame)
        {
            [segueArray removeObject:segue];
        }
    }
}
- (void)performSegueWithIdentifier:(NSString*)identifier
{
    TKSegue* segue;
    for(segue in segueArray)
    {
        if ([segue.identifier compare:identifier] == NSOrderedSame)
        {
            [segue perform];
            return ;
        }
    }
}
- (void)performSegueWithIdentifier:(NSString*)identifier delay:(NSTimeInterval)delay
{
    [NSTimer scheduledTimerWithTimeInterval:delay target:self selector:@selector(timerFirePerformSegue:) userInfo:identifier repeats:NO];    
}

- (void)timerFirePerformSegue:(NSTimer*)theTimer
{
    [self performSegueWithIdentifier:theTimer.userInfo];
    [theTimer invalidate];
}

#pragma mark - control game
- (void)update:(NSTimeInterval)timeSinceLastUpdate
{   
    [animationManager update:timeSinceLastUpdate];
    [sceneController update:timeSinceLastUpdate];
    
    while (controllerHasBeenChanged)
    {
        controllerHasBeenChanged = NO;
        [sceneController update:timeSinceLastUpdate];
    }
    
    [renderManager update:timeSinceLastUpdate];
}
- (void)render
{
    glClear(GL_COLOR_BUFFER_BIT);
    [sceneController render];
    [renderManager render];
}

#pragma mark - property
- (void)setCurrentSceneController:(TKSceneController *)newCurrentSceneController
{
    controllerHasBeenChanged = YES;
    sceneController = newCurrentSceneController;
}

#pragma mark - tools
-(NSSet*)TKTouchSetFromUITouchSet:(NSSet*) uiSet
{
    NSMutableArray* touchArray = [[NSMutableArray alloc] init];
    
    UITouch* uiTouch = nil;
    TKTouch* tkTouch = nil;
    
    for(uiTouch in uiSet)
    {
        tkTouch = [[TKTouch alloc] init];
        
        tkTouch.point = [uiTouch locationInView:viewController.view];
        tkTouch.node = [sceneController.root hitTest:tkTouch.point];
        
        [touchArray addObject:tkTouch];
    }
    
    NSSet* tkSet = [[NSSet alloc] initWithArray:touchArray];
    return tkSet;
}
-(TKEvent*)TKEventFromUIEvent:(UIEvent*)uiEvent
{
    NSSet* uiSet = [uiEvent allTouches];
    NSSet* tkSet = [self TKTouchSetFromUITouchSet:uiSet];
    
    TKEvent* tkEvent = [[TKEvent alloc] init];
    tkEvent.touchSet = tkSet;
    
    return tkEvent;
}

#pragma mark - touches
static TKNode* activeNode;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet* tkTouchSet = [self TKTouchSetFromUITouchSet:touches];
    TKEvent* tkEvent = [self TKEventFromUIEvent:event];
    
    TKTouch* touch = [tkTouchSet anyObject];
    activeNode = touch.node;
    
    [activeNode touchesBegan:tkTouchSet withEvent:tkEvent];
    [sceneController touchesBegan:tkTouchSet withEvent:tkEvent];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet* tkTouchSet = [self TKTouchSetFromUITouchSet:touches];
    TKEvent* tkEvent = [self TKEventFromUIEvent:event];
    
    TKTouch* touch = [tkTouchSet anyObject];
    
    if (touch.node != activeNode)
    {
        [activeNode touchesMovedOut:touches withEvent:tkEvent];
        activeNode = touch.node;   
        [activeNode touchesMovedIn:touches withEvent:tkEvent];
    }
    
    [activeNode touchesMoved:tkTouchSet withEvent:tkEvent];
    [sceneController touchesMoved:tkTouchSet withEvent:tkEvent];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet* tkTouchSet = [self TKTouchSetFromUITouchSet:touches];
    TKEvent* tkEvent = [self TKEventFromUIEvent:event];    
    
    [activeNode touchesCancelled:tkTouchSet withEvent:tkEvent];
    [sceneController touchesCancelled:tkTouchSet withEvent:tkEvent];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet* tkTouchSet = [self TKTouchSetFromUITouchSet:touches];
    TKEvent* tkEvent = [self TKEventFromUIEvent:event];
    
    [activeNode touchesEnded:tkTouchSet withEvent:tkEvent];
    [sceneController touchesEnded:tkTouchSet withEvent:tkEvent];
}
@end
