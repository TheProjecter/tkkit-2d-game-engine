//
//  TKSegue.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import "TKSegue.h"
#import "TKDirector.h"
#import "TKBasicAnimationEffect.h"
#import "TKSceneController.h"
#import "TKNode.h"

@implementation TKSegue

@synthesize director;
@synthesize identifier;
@synthesize easeOutDuration;
@synthesize easeOutDelay;
@synthesize easeInDuration;
@synthesize easeInDelay;

- (id)initWithIdentifier:(NSString*)newIdentifier withDirector:(TKDirector*)newDirector withDestination:(NSString*)dstName
{
    if (self = [super init])
    {
        identifier = newIdentifier;
        director = newDirector;
        dstControllerName = dstName;
        easeOutDuration = 3.0;
        easeOutDelay = 0.0;
        easeInDuration = 3.0;
        easeInDelay = 0.0;
    }
    return self;
}

- (void)perform
{
    srcController = director.sceneController;
    
    TKAnimation* animation = [[TKAnimation alloc] init];
    animation.identifier = @"AnimationEaseIn";
    animation.delay = easeOutDelay;
    animation.duration = easeOutDuration;
    animation.delegate = self;
    
    TKBasicAnimationEffect* basicEffect = [[TKBasicAnimationEffect alloc] init];    
    basicEffect.keyPath = kTKKeyPath_Alpha;
    basicEffect.fromValue = [NSNumber numberWithFloat:1.0];
    basicEffect.toValue = [NSNumber numberWithFloat:0.0];
    
    [animation addEffect:basicEffect];
    [srcController.root addAnimation:animation immediatePerform:YES needStore:NO];
}

#pragma mark - TKAnimationDelegate
- (void)animationDidEnd:(NSString*)animationIdentifier targetNode:(TKNode*)node
{
    if ([animationIdentifier compare:@"AnimationEaseIn"] == NSOrderedSame)
    {
        srcController = nil;
        dstController = [[NSClassFromString(dstControllerName) alloc] initWithDirector:director];
        dstController.root.alpha = 0.0;
        director.sceneController = dstController;
            
        TKAnimation* animation = [[TKAnimation alloc] init];
        animation.delay = easeInDelay;
        animation.duration = easeInDuration;
            
        TKBasicAnimationEffect* basicEffect = [[TKBasicAnimationEffect alloc] init];    
        basicEffect.keyPath = kTKKeyPath_Alpha;
        basicEffect.fromValue = [NSNumber numberWithFloat:0.0];
        basicEffect.toValue = [NSNumber numberWithFloat:1.0];
            
        [animation addEffect:basicEffect];
        [dstController.root addAnimation:animation immediatePerform:YES needStore:NO];
    }
}

@end
    