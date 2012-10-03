//
//  CrowProducer.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-24.
//

#import "CrowProducer.h"
#import "TKSpriteNode.h"
#import "TKAnimation.h"
#import "TKAnimationEffect.h"
#import "TKBasicAnimationEffect.h"
#import "TKKeyframeAnimationEffect.h"
#import "TKSprite.h"
#import "TKDirector.h"
#import "MainSceneController.h"

@interface CrowProducer()
+ (TKSpriteNode*)crowOfIndexOne;
+ (TKSpriteNode*)crowOfIndexTwo;
+ (TKSpriteNode*)crowOfIndexThree;
+ (TKSpriteNode*)crowOfIndexFour;
+ (TKSpriteNode*)crowOfIndexFive;
@end

@implementation CrowProducer

+ (TKSpriteNode*)crowWithIndex:(NSInteger)index;
{
    static BOOL hasSrand = NO;
    if (hasSrand == NO)
    {
        srand(time(0));
        hasSrand = YES;
    }
    
    switch(index)
    {
        case 1:
            return [self crowOfIndexOne];
        case 2:
            return [self crowOfIndexTwo];
        case 3:
            return [self crowOfIndexThree];
        case 4:
            return [self crowOfIndexFour];
        case 5:
            return [self crowOfIndexFive];
        default:
            break;
    }

    return nil;
}

+ (TKSpriteNode*)crowOfIndexOne
{
    TKSpriteNode* spriteCrow = [[TKSpriteNode alloc] initWithImage:@"MainSceneBirds.png" index:0];
    
    // sprite animation
    TKAnimation* animation = [[TKAnimation alloc] init];
    animation.duration = 0.2;
    animation.repeat = YES;
    
    TKKeyframeAnimationEffect* keyframeEffect = [[TKKeyframeAnimationEffect alloc] init];
    keyframeEffect.keyPath = kTKKeyPath_Sprite;
    [keyframeEffect addValue:[TKSprite spriteFromImage:@"MainSceneBirds.png" withIndex:0] keyTime:0.0];
    [keyframeEffect addValue:[TKSprite spriteFromImage:@"MainSceneBirds.png" withIndex:1] keyTime:0.5];
    
    [animation addEffect:keyframeEffect];
    [spriteCrow addAnimation:animation immediatePerform:YES needStore:NO];
    
    // center animation
    animation = [[TKAnimation alloc] init];
    animation.duration = 1.4;
    
    TKBasicAnimationEffect* basicEffect = [[TKBasicAnimationEffect alloc] init];
    basicEffect.keyPath = kTKKeyPath_Center;
    
    basicEffect.fromValue = [NSValue valueWithCGPoint:CGPointMake(180 + rand()%120, 200 + rand()%60)];
    basicEffect.toValue = [NSValue valueWithCGPoint:CGPointMake(-50, rand()%180)];
    
    [animation addEffect:basicEffect];
    [spriteCrow addAnimation:animation immediatePerform:YES needStore:NO];
    
    return spriteCrow;

}
+ (TKSpriteNode*)crowOfIndexTwo
{
    TKSpriteNode* spriteCrow = [[TKSpriteNode alloc] initWithImage:@"MainSceneBirds.png" index:2];
    
    // sprite animation
    TKAnimation* animation = [[TKAnimation alloc] init];
    animation.duration = 0.5;
    animation.repeat = YES;
    
    TKKeyframeAnimationEffect* keyframeEffect = [[TKKeyframeAnimationEffect alloc] init];
    keyframeEffect.keyPath = kTKKeyPath_Sprite;
    [keyframeEffect addValue:[TKSprite spriteFromImage:@"MainSceneBirds.png" withIndex:2] keyTime:0.0];
    [keyframeEffect addValue:[TKSprite spriteFromImage:@"MainSceneBirds.png" withIndex:3] keyTime:0.5];
    
    [animation addEffect:keyframeEffect];
    [spriteCrow addAnimation:animation immediatePerform:YES needStore:NO];
    
    // center animation
    animation = [[TKAnimation alloc] init];
    animation.duration = 1.4;
    
    TKBasicAnimationEffect* basicEffect = [[TKBasicAnimationEffect alloc] init];
    basicEffect.keyPath = kTKKeyPath_Center;
    
    basicEffect.fromValue = [NSValue valueWithCGPoint:CGPointMake(180 + rand()%120, 200 + rand()%60)];
    basicEffect.toValue = [NSValue valueWithCGPoint:CGPointMake(530, rand()%180)];
    
    [animation addEffect:basicEffect];
    [spriteCrow addAnimation:animation immediatePerform:YES needStore:NO];
    
    return spriteCrow;
}
+ (TKSpriteNode*)crowOfIndexThree
{
    TKSpriteNode* spriteCrow = [[TKSpriteNode alloc] initWithImage:@"MainSceneBirds.png" index:4];

    // center animation
    TKAnimation* animation = [[TKAnimation alloc] init];
    animation.duration = 1.2;
    
    TKBasicAnimationEffect* basicEffect = [[TKBasicAnimationEffect alloc] init];
    basicEffect.keyPath = kTKKeyPath_Center;
    
    basicEffect.fromValue = [NSValue valueWithCGPoint:CGPointMake(180 + rand()%120, 200 + rand()%60)];
    basicEffect.toValue = [NSValue valueWithCGPoint:CGPointMake(50, -1*rand()%50)];
    
    [animation addEffect:basicEffect];
    [spriteCrow addAnimation:animation immediatePerform:YES needStore:NO];
    
    return spriteCrow;
}
+ (TKSpriteNode*)crowOfIndexFour
{
    TKSpriteNode* spriteCrow = [[TKSpriteNode alloc] initWithImage:@"MainSceneBirds.png" index:7];
    
    // center animation
    TKAnimation* animation = [[TKAnimation alloc] init];
    animation.duration = 1.2;
    
    TKBasicAnimationEffect* basicEffect = [[TKBasicAnimationEffect alloc] init];
    basicEffect.keyPath = kTKKeyPath_Center;
    
    basicEffect.fromValue = [NSValue valueWithCGPoint:CGPointMake(180 + rand()%120, 200 + rand()%60)];
    basicEffect.toValue = [NSValue valueWithCGPoint:CGPointMake(450, -1*rand()%50)];
    
    [animation addEffect:basicEffect];
    [spriteCrow addAnimation:animation immediatePerform:YES needStore:NO];
    
    return spriteCrow;
}
+ (TKSpriteNode*)crowOfIndexFive
{
    TKSpriteNode* spriteCrow = [[TKSpriteNode alloc] initWithImage:@"MainSceneBirds.png" index:8];
    
    // center animation
    TKAnimation* animation = [[TKAnimation alloc] init];
    animation.identifier = @"crowAnimation";
    animation.duration = 1.6;
    animation.delegate = (MainSceneController*)[TKDirector mainDirector].sceneController;
    
    TKBasicAnimationEffect* basicEffect = [[TKBasicAnimationEffect alloc] init];
    basicEffect.keyPath = kTKKeyPath_Center;
    
    basicEffect.fromValue = [NSValue valueWithCGPoint:CGPointMake(180 + rand()%120, 200 + rand()%60)];
    basicEffect.toValue = [NSValue valueWithCGPoint:CGPointMake(100 + rand()%220, -50)];
    
    [animation addEffect:basicEffect];
    [spriteCrow addAnimation:animation immediatePerform:YES needStore:NO];
    
    return spriteCrow;
}


@end
