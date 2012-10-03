//
//  GameSceneController.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-28.
//

#import "GameSceneController.h"
#import "TKNode.h"
#import "GameProducer.h"
#import "TKSpriteNode.h"
#import "TKUtility.h"
#import "GameController.h"
#import "TKBasicAnimationEffect.h"
#import "TKDirector.h"
#import "TKAudioManager.h"
#import "TKKit.h"
#import "TKSprite.h"

@implementation GameSceneController

#pragma mark - property

#pragma mark - init
- (id)initWithDirector:(TKDirector*)mainDirector
{
    if (self = [super initWithDirector:mainDirector])
    {
        gameController = [[GameController alloc] init];
        [self loadResource];
    }
    return self;
}

#pragma mark - load
- (void)loadResource
{
    // 1. 右下角背景
    spriteNodeCorner = [GameProducer spriteNodeWithIndex:1];
    [super.root addChildNode:spriteNodeCorner];
    
    // 2. cloud
    spriteNodeCloud = [GameProducer spriteNodeWithIndex:2];
    [super.root addChildNode:spriteNodeCloud];
    
    // 3. grass
    spriteNodeGrass = [GameProducer spriteNodeWithIndex:3];
    [super.root addChildNode:spriteNodeGrass];
    
    // 4. fence
    spriteNodeFence = [GameProducer spriteNodeWithIndex:4];
    [super.root addChildNode:spriteNodeFence];
    
    // 5. normal desk
    for (NSInteger i = 0; i < 4; i++)
    {
        spriteNodeDesk[i] = [GameProducer spriteNodeWithIndex:5+i];
        [super.root addChildNode:spriteNodeDesk[i]];
    }
    
    // 9. day night
    spriteNodeDayNight = [GameProducer spriteNodeWithIndex:9];
    [super.root addChildNode:spriteNodeDayNight];
    
    // 10. day
    spriteNodeDay = [GameProducer spriteNodeWithIndex:10];
    [super.root addChildNode:spriteNodeDay];
    
    // 11. day number
    spriteNodeDayNumber = [GameProducer spriteNodeWithIndex:11];
    [super.root addChildNode:spriteNodeDayNumber];
    
    // 12. keeper
    spriteNodeKeeper = [GameProducer spriteNodeWithIndex:12];
    [super.root addChildNode:spriteNodeKeeper];
    
    // 13. cup
    for (NSInteger i = 0; i < 3; i++)
    {
        spriteNodeCup[i] = [GameProducer spriteNodeWithIndex:13+i];
        [super.root addChildNode:spriteNodeCup[i]];
    }
    
    spriteNodeNoCup = [TKSprite spriteFromImage:@"GameSceneNoCup.png" withIndex:0];
    
    TK_ASYNC_TASK_START
    [super.director.audioManager playBGM:@"GameSceneBGM.caf"];
    TK_ASYNC_TASK_END
}

#pragma mark - init
- (void)update:(NSTimeInterval)timeSinceLastUpdate
{
    [super update:timeSinceLastUpdate];
    
    // random produce monster
    if (rand()%100 == 1)
    {
        //generate a monster
    }
}

#pragma mark - touches
static BOOL     keeperPressed;
static CGPoint  lastPoint;
static CGPoint  pressedPoint;
-(void)touchesBegan:(NSSet *)touches withEvent:(TKEvent *)event
{
    TKTouch* touch = [touches anyObject];
    
    if (touch.node == spriteNodeKeeper)
        keeperPressed = YES;
    
    lastPoint = touch.point;
    pressedPoint = touch.point;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(TKEvent *)event
{
    TKTouch* touch = [touches anyObject];
    
    if (keeperPressed == YES)
    {
        // move up & down
        // leftTop(310, 110), rightBottom(355, 260)
        CGFloat deltaY = touch.point.y - lastPoint.y;
        CGFloat deltaX = deltaY*45/(260-110);
            
        CGPoint center = spriteNodeKeeper.center;
        deltaX = center.x+deltaX;
        deltaY = center.y+deltaY;
            
        if (deltaY < 110 || deltaY > 260)
            return ;
            
        spriteNodeKeeper.center = CGPointMake(deltaX, deltaY);
    }
    
    lastPoint = touch.point;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(TKEvent *)event
{
    TKTouch* touch = [touches anyObject];
    keeperPressed = NO;
    
    CGFloat delta = fabs(touch.point.x - pressedPoint.x);
    if (delta > 50)
    {
        // 大于30后，60％机率高速
        if (delta > 250)
        {
            // perfect 
            if ([spriteNodeKeeper isAnimationActivting:@"NormalSlide"] == NO)
                [spriteNodeKeeper playAnimation:@"PerfectSlide"];
            [super.director.audioManager playSFX:@"GameScenePerfectSFX.wav"];
        }
        else
        {
            // normal
            if ([spriteNodeKeeper isAnimationActivting:@"PerfectSlide"] == NO)
                [spriteNodeKeeper playAnimation:@"NormalSlide"];
            [super.director.audioManager playSFX:@"GameSceneSlideSFX.wav"];
        }
        
        // 杯子种类，normal,quick,perfect
        NSInteger category;
        if (delta > 250)
            category = 3;
        else if (delta > 150)
            category = 2;
        else category = 1;
        
        
        TKSpriteNode* spriteNode = [GameProducer spriteNodeOfActionCup:category];
        CGPoint startPoint, endPoint;
        
        NSInteger channel = [self channelFromPoint:spriteNodeKeeper.center];
        switch(channel)
        {
            case 1:
                startPoint = CGPointMake(300, 105);
                endPoint = CGPointMake(0, 105);
                break;
            case 2:
                startPoint = CGPointMake(300, 140);
                endPoint = CGPointMake(0, 140);
                break;
            case 3:
                startPoint = CGPointMake(300, 190);
                endPoint = CGPointMake(0, 190);
                break;
            case 4:
                startPoint = CGPointMake(300, 234);
                endPoint = CGPointMake(0, 235);
                break;
            default:
                break;
        }
        
        TKAnimation* animation = [[TKAnimation alloc] initWithIdentifier:@"ActionCup"];
        animation.duration = 4-category;
        animation.delegate = self;
        
        TKBasicAnimationEffect* basicEffect = [[TKBasicAnimationEffect alloc] init];
        basicEffect.keyPath = kTKKeyPath_Center;
        basicEffect.fromValue = [NSValue valueWithCGPoint:startPoint];
        basicEffect.toValue = [NSValue valueWithCGPoint:endPoint];
        
        [animation addEffect:basicEffect];
        [spriteNode addAnimation:animation immediatePerform:YES needStore:NO];
        
        [super.root addChildNode:spriteNode];
    }
}

#pragma makr - tools
- (NSInteger)channelFromPoint:(CGPoint)point
{
    if (point.y > 235)
        return 4;
    if (point.y > 185)
        return 3;
    if (point.y > 140)
        return 2;
    
    return 1;
}

#pragma mark - animation
- (void)animationDidEnd:(NSString*)identifier targetNode:(TKNode*)node
{
    if ([identifier compare:@"ActionCup"] == NSOrderedSame)
    {
        [super.root deleteChild:node];
        [super.director.audioManager playSFX:@"GameSceneCupbreakSFX.wav"];
    }
}

@end
