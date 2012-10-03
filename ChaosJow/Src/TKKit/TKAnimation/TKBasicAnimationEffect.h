//
//  TKBasicAnimatinoEffect.h
//  ChaosJow
//
//

#import <Foundation/Foundation.h>
#import "TKAnimationEffect.h"

@class TKSpriteNode;

@interface TKBasicAnimationEffect : TKAnimationEffect

@property(strong, nonatomic) id fromValue;
@property(strong, nonatomic) id toValue;

- (void)perform:(TKSpriteNode*)spriteNode withPercentage:(float)percentage;

@end
