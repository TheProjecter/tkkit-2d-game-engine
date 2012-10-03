//
//  TKKeyframeAnimationEffect.h
//  ChaosJow
//
//

#import <Foundation/Foundation.h>
#import "TKAnimationEffect.h"

/*
 TKAnimatinoEffect
 values，keyTimes必须至少包含2个值
 keyTimes必须以0.0打头，以1.0结尾
 */
@interface TKKeyframeAnimationEffect : TKAnimationEffect

@property(strong, nonatomic) NSMutableArray* values;
@property(strong, nonatomic) NSMutableArray* keyTimes;

- (id)init;
- (void)setValuesArray:(NSMutableArray*)newValues keyTimeArray:(NSMutableArray*)newKeyTimes;
- (void)addValue:(id)value keyTime:(float)keytime;

- (void)perform:(TKNode*)node withPercentage:(float)percentage;

@end
