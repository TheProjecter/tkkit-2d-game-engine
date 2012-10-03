//
//  GameProducer.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-28.
//

#import "GameProducer.h"
#import "TKSpriteNode.h"
#import "TKAnimation.h"
#import "TKKeyframeAnimationEffect.h"
#import "TKSpriteProvider.h"
#import "TKSprite.h"
#import "TKBasicAnimationEffect.h"
#import "TKDirector.h"

@interface GameProducer() 
+(TKSpriteNode*)spriteNodeOfCorner;
+(TKSpriteNode*)spriteNodeOfCloud;
+(TKSpriteNode*)spriteNodeOfGrass;
+(TKSpriteNode*)spriteNodeOfFence;
+(TKSpriteNode*)spriteNodeOfNormalDesk:(NSInteger)index;
+(TKSpriteNode*)spriteNodeOfDayNight;
+(TKSpriteNode*)spriteNodeOfDay;
+(TKSpriteNode*)sprtieNodeOfDayNumber;
+(TKSpriteNode*)sprtieNodeOfKeeper;
+(TKSpriteNode*)spriteNodeOfCup:(NSInteger)index;
@end

@implementation GameProducer

+ (TKSpriteNode*)spriteNodeWithIndex:(NSInteger)index
{
    switch (index) {
        case 1:
            return [self spriteNodeOfCorner];
        case 2:
            return [self spriteNodeOfCloud];
        case 3:
            return [self spriteNodeOfGrass];
        case 4:
            return [self spriteNodeOfFence];
        case 5:
            return [self spriteNodeOfNormalDesk:0];
        case 6:
            return [self spriteNodeOfNormalDesk:1];
        case 7:
            return [self spriteNodeOfNormalDesk:2];
        case 8:
            return [self spriteNodeOfNormalDesk:3];
        case 9:
            return [self spriteNodeOfDayNight];
        case 10:
            return [self spriteNodeOfDay];
        case 11:
            return [self sprtieNodeOfDayNumber];
        case 12:
            return [self sprtieNodeOfKeeper];
        case 13:
            return [self spriteNodeOfCup:0];
        case 14:
            return [self spriteNodeOfCup:1];
        case 15:
            return [self spriteNodeOfCup:2];
        default:
            break;
    }

    return nil;
}

+ (TKSpriteNode*)spriteNodeOfActionCup:(NSInteger)category;
{
    TKSpriteNode* spriteNode = nil;
    
    switch(category)
    {
        case 1:
            spriteNode = [[TKSpriteNode alloc] initWithImage:@"GameSceneCupNormal.png" index:0];
            break;
        case 2:
            spriteNode = [[TKSpriteNode alloc] initWithImage:@"GameSceneCupQuick.png" index:0];
            break;
        case 3:
            spriteNode = [[TKSpriteNode alloc] initWithImage:@"GameSceneCupPerfect.png" index:0];
            break;
        default:
            break;
    }

    return spriteNode;
}

- (void)animationDidEnd:(NSString*)identifier
{
    
}

+(TKSpriteNode*)spriteNodeOfCorner
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithImage:@"GameSceneBGCorner.png" index:0];
    spriteNode.center = CGPointMake(369.5, 218);
    return spriteNode;
}
+(TKSpriteNode*)spriteNodeOfCloud
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithImage:@"GameSceneBGCloud.png" index:0];
    spriteNode.center = CGPointMake(240, 58.5);
    return spriteNode;
}
+(TKSpriteNode*)spriteNodeOfGrass
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithImage:@"GameSceneBGGrass.png" index:0];
    spriteNode.center = CGPointMake(51, 242);
    return spriteNode;
}
+(TKSpriteNode*)spriteNodeOfFence
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithImage:@"GameSceneBGFence.png" index:0];
    spriteNode.center = CGPointMake(7, 261);
    return spriteNode;
}
+(TKSpriteNode*)spriteNodeOfNormalDesk:(NSInteger)index
{
    TKSpriteNode *spriteNode = [[TKSpriteNode alloc] initWithNormalImage:@"GameSceneDeskNormal.png" normalIndex:index highlightedImage:@"GameSceneDeskHighlight.png" highlightedIndex:index];

    switch (index) {
        case 0:
            spriteNode.center = CGPointMake(138.5, 143);
            break;
        case 1:
            spriteNode.center = CGPointMake(142.5, 179);
            break;
        case 2:
            spriteNode.center = CGPointMake(150, 232);
            break;
        case 3:
            spriteNode.center = CGPointMake(161, 281);
            break;
        default:
            break;
    }
    
    return spriteNode;
}
+(TKSpriteNode*)spriteNodeOfDayNight
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithNormalImage:@"GameSceneDayNight.png" normalIndex:1 highlightedImage:@"GameSceneDayNight.png" highlightedIndex:0];
    spriteNode.center = CGPointMake(187, 21);
    
    // add DayToNight animation
    TKAnimation* animation = [[TKAnimation alloc] initWithIdentifier:@"DayToNight"];
    animation.duration = 1.5;
    
    TKKeyframeAnimationEffect* keyframeEffect = [[TKKeyframeAnimationEffect alloc] init];
    keyframeEffect.keyPath = kTKKeyPath_Scale;
    [keyframeEffect addValue:[NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)] keyTime:0.0];
    [keyframeEffect addValue:[NSValue valueWithCGPoint:CGPointMake(0.0, 1.0)] keyTime:0.5];
    [keyframeEffect addValue:[NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)] keyTime:1.0];
    [animation addEffect:keyframeEffect];
    
    keyframeEffect = [[TKKeyframeAnimationEffect alloc] init];
    keyframeEffect.keyPath = kTKKeyPath_Highlighted;
    [keyframeEffect addValue:[NSNumber numberWithBool:NO] keyTime:0.0];
    [keyframeEffect addValue:[NSNumber numberWithBool:YES] keyTime:0.5];
    [animation addEffect:keyframeEffect];
        
    [spriteNode addAnimation:animation immediatePerform:NO needStore:YES];
    
    // add NightToDay animation
    animation = [[TKAnimation alloc] initWithIdentifier:@"NightToDay"];
    animation.duration = 1.5;
    
    keyframeEffect = [[TKKeyframeAnimationEffect alloc] init];
    keyframeEffect.keyPath = kTKKeyPath_Scale;
    [keyframeEffect addValue:[NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)] keyTime:0.0];
    [keyframeEffect addValue:[NSValue valueWithCGPoint:CGPointMake(0.0, 1.0)] keyTime:0.5];
    [keyframeEffect addValue:[NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)] keyTime:1.0];
    [animation addEffect:keyframeEffect];
    
    keyframeEffect = [[TKKeyframeAnimationEffect alloc] init];
    keyframeEffect.keyPath = kTKKeyPath_Highlighted;
    [keyframeEffect addValue:[NSNumber numberWithBool:YES] keyTime:0.0];
    [keyframeEffect addValue:[NSNumber numberWithBool:NO] keyTime:0.5];
    [animation addEffect:keyframeEffect];
    
    [spriteNode addAnimation:animation immediatePerform:NO needStore:YES];
    
    return spriteNode;
}
+(TKSpriteNode*)spriteNodeOfDay
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithImage:@"GameSceneDay.png" index:0];
    spriteNode.center = CGPointMake(232, 23);
    
    return spriteNode;
}
+(TKSpriteNode*)sprtieNodeOfDayNumber
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithImage:@"GameSceneDay.png" index:7];
    spriteNode.center = CGPointMake(256, 23);

    return spriteNode;
}
+(TKSpriteNode*)sprtieNodeOfKeeper
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithImage:@"GameSceneKeeper.png" index:0];
    spriteNode.interactable = YES;
    spriteNode.center = CGPointMake(355, 245);
    
    // normal slide
    TKAnimation* animation = [[TKAnimation alloc] initWithIdentifier:@"NormalSlide"];
    animation.duration = 0.3;
    TKKeyframeAnimationEffect* keyframeEffect = [[TKKeyframeAnimationEffect alloc] init];
    keyframeEffect.keyPath = kTKKeyPath_Sprite;
    [keyframeEffect addValue:[TKSprite spriteFromImage:@"GameSceneKeeper.png" withIndex:3] keyTime:0.0];
    [keyframeEffect addValue:[TKSprite spriteFromImage:@"GameSceneKeeper.png" withIndex:0] keyTime:0.9];
    [animation addEffect:keyframeEffect];
    [spriteNode addAnimation:animation immediatePerform:NO needStore:YES];
    
    // perfect slide
    animation = [[TKAnimation alloc] initWithIdentifier:@"PerfectSlide"];
    animation.duration = 0.3;
    keyframeEffect = [[TKKeyframeAnimationEffect alloc] init];
    keyframeEffect.keyPath = kTKKeyPath_Sprite;
    [keyframeEffect addValue:[TKSprite spriteFromImage:@"GameSceneSlidePerfect.png" withIndex:0] keyTime:0.0];
    [keyframeEffect addValue:[TKSprite spriteFromImage:@"GameSceneKeeper.png" withIndex:0] keyTime:0.9];
    [animation addEffect:keyframeEffect];
    [spriteNode addAnimation:animation immediatePerform:NO needStore:YES];
    
    return spriteNode;
}
+(TKSpriteNode*)spriteNodeOfCup:(NSInteger)index
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithImage:@"GameSceneCupEmpty.png" index:0];
    
    switch (index) {
        case 0:
            spriteNode.center = CGPointMake(455, 210);
            break;
        case 1:
            spriteNode.center = CGPointMake(455, 205);
            break;
        case 2:
            spriteNode.center = CGPointMake(455, 200);
            break;
        default:
            break;
    }
    
    return spriteNode;}
@end
