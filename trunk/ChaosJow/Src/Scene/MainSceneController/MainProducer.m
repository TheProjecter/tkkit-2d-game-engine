//
//  MainProducer.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-24.
//

#import "MainProducer.h"
#import "TKSpriteNode.h"
#import "TKBasicAnimationEffect.h"
#import "TKAnimation.h"
#import "TKKeyframeAnimationEffect.h"
#import "TKMenuNode.h"

@interface MainProducer()
+ (TKSpriteNode*)spriteNodeOfBackground;
+ (TKSpriteNode*)spriteNodeOfCloudOut;
+ (TKSpriteNode*)spriteNodeOfCloudIn;
+ (TKSpriteNode*)spriteNodeOfHouse;
+ (TKSpriteNode*)spriteNodeOfGate;
+ (TKSpriteNode*)spriteNodeOfTitle;
+ (TKSpriteNode*)spriteNodeOfTapCaution;
@end

@implementation MainProducer

+ (TKSpriteNode*)spriteNodeWithIndex:(NSInteger)index
{
    switch (index) {
        case 1:
            return [self spriteNodeOfBackground];
        case 2:
            return [self spriteNodeOfCloudOut];
        case 3:
            return [self spriteNodeOfCloudIn];
        case 4:
            return [self spriteNodeOfHouse];
        case 5:
            return [self spriteNodeOfGate];
        case 6:
            return [self spriteNodeOfTitle];
        case 7:
            return [self spriteNodeOfTapCaution];
        default:
            break;
    }
    
    return nil;
}

+ (TKSpriteNode*)spriteNodeOfBackground
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithImage:@"MainSceneBackground.png" index:0];
    return spriteNode;
}
+ (TKSpriteNode*)spriteNodeOfCloudOut
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithImage:@"MainSceneCloudOut.png" index:0];
    spriteNode.center = CGPointMake(245, -15);
    spriteNode.scale = CGPointMake(1.0, 1.0);
    
    TKAnimation* animation = [[TKAnimation alloc] init];
    animation.duration = 100.0;
    animation.repeat = YES;
    
    TKBasicAnimationEffect* basicEffect = [[TKBasicAnimationEffect alloc] init];    
    basicEffect.keyPath = kTKKeyPath_Rotation;
    basicEffect.fromValue = [NSNumber numberWithFloat:0];
    basicEffect.toValue = [NSNumber numberWithFloat:2*M_PI];
    
    [animation addEffect:basicEffect];
    [spriteNode addAnimation:animation immediatePerform:YES needStore:NO];
    
    return spriteNode;
}
+ (TKSpriteNode*)spriteNodeOfCloudIn
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithImage:@"MainSceneCloudIn.png" index:0];
    spriteNode.center = CGPointMake(240, 0);
    spriteNode.scale = CGPointMake(1.0, 0.7);
    
    TKAnimation* animation = [[TKAnimation alloc] init];
    animation.duration = 100.0;
    animation.repeat = YES;
    
    TKBasicAnimationEffect* basicEffect = [[TKBasicAnimationEffect alloc] init];    
    basicEffect.keyPath = kTKKeyPath_Rotation;
    basicEffect.fromValue = [NSNumber numberWithFloat:0];
    basicEffect.toValue = [NSNumber numberWithFloat:-2*M_PI];
    
    [animation addEffect:basicEffect];
    [spriteNode addAnimation:animation immediatePerform:YES needStore:NO];
    
    return spriteNode;
}
+ (TKSpriteNode*)spriteNodeOfHouse
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithImage:@"MainSceneHouse.png" index:0];
    return spriteNode;
}
+ (TKSpriteNode*)spriteNodeOfGate
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithNormalImage:@"MainSceneGateClose.png" normalIndex:0 normalAlpha:1.0 highlightedImage:@"MainSceneGateOpen.png" highlightedIndex:0 highlightedAlpha:1.0];
    
    return spriteNode;
}
+ (TKSpriteNode*)spriteNodeOfTitle
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithImage:@"MainSceneTitle.png" index:0];
    spriteNode.center = CGPointMake(268, 118);
    return spriteNode;
}
+ (TKSpriteNode*)spriteNodeOfTapCaution
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithImage:@"MainSceneMenu.png" index:0];
    spriteNode.scale = CGPointMake(0.8, 0.8);
    spriteNode.center = CGPointMake(247, 280);
    spriteNode.alpha = 0.0;
    
    TKAnimation* animation = [[TKAnimation alloc] init];
    animation.duration = 3.0;
    animation.delay = 5.0;
    animation.repeat = YES;
    
    TKKeyframeAnimationEffect* keyframeEffect = [[TKKeyframeAnimationEffect alloc] init];
    keyframeEffect.keyPath = kTKKeyPath_Alpha;
    [keyframeEffect addValue:[NSNumber numberWithFloat:0.0] keyTime:0.0];
    [keyframeEffect addValue:[NSNumber numberWithFloat:1.2] keyTime:0.45];
    [keyframeEffect addValue:[NSNumber numberWithFloat:1.2] keyTime:0.55];
    [keyframeEffect addValue:[NSNumber numberWithFloat:0.0] keyTime:1.0];
    
    [animation addEffect:keyframeEffect];
    [spriteNode addAnimation:animation immediatePerform:YES needStore:NO];
    
    return spriteNode;
}


@end
