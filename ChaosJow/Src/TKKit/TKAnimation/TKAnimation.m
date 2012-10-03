//
//  TKAnimation.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import "TKAnimation.h"
#import "TKAnimationEffect.h"
#import "TKSpriteNode.h"
#import "TKAnimationManager.h"
#import "TKDirector.h"

@implementation TKAnimation

#pragma mark - synthesize
@synthesize identifier;
@synthesize repeat;
@synthesize duration;
@synthesize delay;
@synthesize delegate;
@synthesize hasEnded;

#pragma mark - init
- (id)init
{
    if (self = [super init])
    {
        effectArray = [[NSMutableArray alloc] init];
        repeat = NO;
        duration = 1.0;
        delay = 0.0;
        delegate = nil;
        identifier = @"NoName";
        hasEnded = NO;
    }
    
    return self;
}
- (id)initWithIdentifier:(NSString*)newIdentifier
{
    self = [self init];
    identifier = newIdentifier;
    return self;
}

#pragma mark - operate effect
- (void)addEffect:(TKAnimationEffect*)effect
{
    [effectArray addObject:effect];
}
- (void)deleteEffect:(TKAnimationEffect*)effect
{
    [effectArray removeObject:effect];
}
- (void)deleteEffectWithIdentifier:(NSString*)effectIdentifier
{
    TKAnimationEffect* effect;
    for(effect in effectArray)
    {
        if ([effect.identifier compare:effectIdentifier] == NSOrderedSame)
        {
            [effectArray removeObject:effect];
            return ;
        }
    }
}

#pragma mark - 
- (void)update:(TKNode*)node withTime:(NSTimeInterval)timeSinceLastUpdate;
{
    // 动画时间over
    if (accumTime > duration + delay)
    {
        if (hasEnded == YES)
            return ;
        
        hasEnded = YES;
    }
    
    accumTime += timeSinceLastUpdate;
    if (accumTime < delay)
        return ;
    
    // 计算percentage
    float timePercentage = (accumTime-delay)/duration;

    timePercentage = fmin(1.0, timePercentage);
    timePercentage = fmax(0.0, timePercentage);
    
    // 依调用effect
    TKAnimationEffect* effect;
    for (effect in effectArray)
    {
        [effect perform:node withPercentage:timePercentage];
    }
    
    if (hasEnded && delegate)
        [[TKDirector mainDirector].animationManager addActionDelegate:delegate identifier:identifier node:node];
}

- (void)replay
{
    accumTime = delay;
    hasEnded = NO;
}

- (void)reset
{
    accumTime = 0;
    hasEnded = NO;
}

@end
