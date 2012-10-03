//
//  TKKeyframeAnimationEffect.m
//  ChaosJow
//
//

#import "TKKeyframeAnimationEffect.h"
#import "TKUtility.h"
#import "TKNode.h"
#import "TKLayer.h"
#import "TKSpriteNode.h"

#pragma mark - private category
@interface TKKeyframeAnimationEffect()

#pragma mark - interpolate transform
- (void)interpolateTransformRotation:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage;
- (void)interpolateTransformScale:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage;
- (void)interpolateTransformScaleX:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage;
- (void)interpolateTransformScaleY:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage;
- (void)interpolateTransformTranslation:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage;
- (void)interpolateTransformTranslationX:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage;
- (void)interpolateTransformTranslationY:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage;

#pragma mark - interpolate property
- (void)interpolateCenter:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage;
- (void)interpolateAlpha:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage;
- (void)interpolateScale:(TKNode *)node withIndex:(NSInteger)index withPercentage:(float)percentage;
- (void)interpolateAnchorPoint:(TKNode *)node withIndex:(NSInteger)index withPercentage:(float)percentage;
- (void)interpolateRotation:(TKNode *)node withIndex:(NSInteger)index withPercentage:(float)percentage;
- (void)interpolateSprite:(TKNode *)node withIndex:(NSInteger)index withPercentage:(float)percentage;
- (void)interpolateHighlighted:(TKNode *)node withIndex:(NSInteger)index withPercentage:(float)percentage;

@end


@implementation TKKeyframeAnimationEffect

@synthesize values;
@synthesize keyTimes;

- (id)init
{
    if (self = [super init])
    {
        values = [[NSMutableArray alloc] init];
        keyTimes = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)setValuesArray:(NSMutableArray*)newValues keyTimeArray:(NSMutableArray*)newKeyTimes
{
    values = newValues;
    keyTimes = newKeyTimes;
}

- (void)addValue:(id)value keyTime:(float)keytime
{
    [values addObject:value];
    [keyTimes addObject:[NSNumber numberWithFloat:keytime]];
}

- (void)perform:(TKNode*)node withPercentage:(float)percentage
{
    if (values.count < 2)
        return ;
    
    // 计算index
    NSNumber* timeNumber;
    float toTime;
    NSInteger index;
    
    for (index = 1; index < keyTimes.count; index++)
    {
        timeNumber = [keyTimes objectAtIndex:index];
        toTime = [timeNumber floatValue];
        
        if (toTime >= percentage)
            break;
    }
    
    timeNumber = [keyTimes objectAtIndex:index-1];
    float fromTime = [timeNumber floatValue];
    
    if (fromTime == toTime)
        toTime = 1.0;
    
    percentage = (percentage-fromTime)/(toTime-fromTime);
    
#define TK_KEYFRAME_ANIMATION_MAP_BEGIN \
    switch (super.keyPath)\
    {\

#define TK_KEYFRAME_ANIMATION_MAP(X, Y) \
    case X:\
        [self Y:node withIndex:index withPercentage:percentage];\
        break;\

#define TK_KEYFRAME_ANIMATINO_MAP_END \
    }

    TK_KEYFRAME_ANIMATION_MAP_BEGIN
    TK_KEYFRAME_ANIMATION_MAP(kTKKeyPath_TransformRotation, interpolateTransformRotation)
    TK_KEYFRAME_ANIMATION_MAP(kTKKeyPath_TransformScale, interpolateTransformScale)
    TK_KEYFRAME_ANIMATION_MAP(kTKKeyPath_TransformScaleX, interpolateTransformScaleX)
    TK_KEYFRAME_ANIMATION_MAP(kTKKeyPath_TransformScaleY, interpolateTransformScaleY)
    TK_KEYFRAME_ANIMATION_MAP(kTKKeyPath_TransformTranslation, interpolateTransformTranslation)
    TK_KEYFRAME_ANIMATION_MAP(kTKKeyPath_TransformTranslationX, interpolateTransformTranslationX)
    TK_KEYFRAME_ANIMATION_MAP(kTKKeyPath_TransformTranslationY, interpolateTransformTranslationY)
    TK_KEYFRAME_ANIMATION_MAP(kTKKeyPath_Center, interpolateCenter)
    TK_KEYFRAME_ANIMATION_MAP(kTKKeyPath_Alpha, interpolateAlpha)
    TK_KEYFRAME_ANIMATION_MAP(kTKKeyPath_Scale, interpolateScale)
    TK_KEYFRAME_ANIMATION_MAP(kTKKeyPath_AnchorPoint, interpolateAnchorPoint)
    TK_KEYFRAME_ANIMATION_MAP(kTKKeyPath_Rotation, interpolateRotation)
    TK_KEYFRAME_ANIMATION_MAP(kTKKeyPath_Sprite, interpolateSprite)
    TK_KEYFRAME_ANIMATION_MAP(kTKKeyPath_Highlighted, interpolateHighlighted)
    TK_KEYFRAME_ANIMATINO_MAP_END
    
#undef TK_KEYFRAME_ANIMATION_MAP_BEGIN
#undef TK_KEYFRAME_ANIMATION_MAP
#undef TK_KEYFRAME_ANIMATINO_MAP_END
}

#pragma mark - interpolate transform
- (void)interpolateTransformRotation:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage
{
    float fromScalar = [(NSNumber*)[values objectAtIndex:index-1] floatValue];
    float toScalar = [(NSNumber*)[values objectAtIndex:index] floatValue];
    
    float interpolatedScalar = TKLinearInterpolate(fromScalar, toScalar, percentage);
    [node.layer rotateR:interpolatedScalar X:0 Y:0 Z:1];
}
- (void)interpolateTransformScale:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage
{
    float fromScalar = [(NSNumber*)[values objectAtIndex:index-1] floatValue];
    float toScalar = [(NSNumber*)[values objectAtIndex:index] floatValue];
    
    float interpolatedScalar = TKLinearInterpolate(fromScalar, toScalar, percentage);
    [node.layer scaleX:interpolatedScalar Y:interpolatedScalar];
}
- (void)interpolateTransformScaleX:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage
{
    float fromScalar = [(NSNumber*)[values objectAtIndex:index-1] floatValue];
    float toScalar = [(NSNumber*)[values objectAtIndex:index] floatValue];
    
    float interpolatedScalar = TKLinearInterpolate(fromScalar, toScalar, percentage);
    [node.layer scaleX:interpolatedScalar Y:1];
}
- (void)interpolateTransformScaleY:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage
{
    float fromScalar = [(NSNumber*)[values objectAtIndex:index-1] floatValue];
    float toScalar = [(NSNumber*)[values objectAtIndex:index] floatValue];
    
    float interpolatedScalar = TKLinearInterpolate(fromScalar, toScalar, percentage);
    [node.layer scaleX:1 Y:interpolatedScalar];
}
- (void)interpolateTransformTranslation:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage
{
    CGPoint fromScalar = [(NSValue*)[values objectAtIndex:index-1] CGPointValue];
    CGPoint toScalar = [(NSValue*)[values objectAtIndex:index] CGPointValue];
    
    float interpolatedScalarX = TKLinearInterpolate(fromScalar.x, toScalar.x, percentage);
    float interpolatedScalarY = TKLinearInterpolate(fromScalar.y, toScalar.y, percentage);
    
    [node.layer translateX:interpolatedScalarX Y:interpolatedScalarY];
}
- (void)interpolateTransformTranslationX:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage
{
    float fromScalar = [(NSNumber*)[values objectAtIndex:index-1] floatValue];
    float toScalar = [(NSNumber*)[values objectAtIndex:index] floatValue];
    
    float interpolatedScalar = TKLinearInterpolate(fromScalar, toScalar, percentage);
    [node.layer translateX:interpolatedScalar Y:0];
}
- (void)interpolateTransformTranslationY:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage
{
    float fromScalar = [(NSNumber*)[values objectAtIndex:index-1] floatValue];
    float toScalar = [(NSNumber*)[values objectAtIndex:index] floatValue];
    
    float interpolatedScalar = TKLinearInterpolate(fromScalar, toScalar, percentage);
    [node.layer translateX:0 Y:interpolatedScalar];
}

#pragma mark - interpolate property
- (void)interpolateCenter:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage
{
    CGPoint fromScalar = [(NSValue*)[values objectAtIndex:index-1] CGPointValue];
    CGPoint toScalar = [(NSValue*)[values objectAtIndex:index] CGPointValue];
    
    float interpolatedScalarX = TKLinearInterpolate(fromScalar.x, toScalar.x, percentage);
    float interpolatedScalarY = TKLinearInterpolate(fromScalar.y, toScalar.y, percentage);
    
    node.layer.scale = CGPointMake(interpolatedScalarX, interpolatedScalarY);
}
- (void)interpolateAlpha:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage
{
    float fromScalar = [(NSNumber*)[values objectAtIndex:index-1] floatValue];
    float toScalar = [(NSNumber*)[values objectAtIndex:index] floatValue];
    
    node.layer.alpha = TKLinearInterpolate(fromScalar, toScalar, percentage);
}
- (void)interpolateScale:(TKNode*)node withIndex:(NSInteger)index withPercentage:(float)percentage
{
    CGPoint fromScalar = [(NSValue*)[values objectAtIndex:index-1] CGPointValue];
    CGPoint toScalar = [(NSValue*)[values objectAtIndex:index] CGPointValue];
    
    float interpolatedScalarX = TKLinearInterpolate(fromScalar.x, toScalar.x, percentage);
    float interpolatedScalarY = TKLinearInterpolate(fromScalar.y, toScalar.y, percentage);
    
    node.layer.scale = CGPointMake(interpolatedScalarX, interpolatedScalarY);
}
- (void)interpolateAnchorPoint:(TKNode *)node withIndex:(NSInteger)index withPercentage:(float)percentage
{
    CGPoint fromScalar = [(NSValue*)[values objectAtIndex:index-1] CGPointValue];
    CGPoint toScalar = [(NSValue*)[values objectAtIndex:index] CGPointValue];
    
    float interpolatedScalarX = TKLinearInterpolate(fromScalar.x, toScalar.x, percentage);
    float interpolatedScalarY = TKLinearInterpolate(fromScalar.y, toScalar.y, percentage);
    
    node.layer.anchorPoint = CGPointMake(interpolatedScalarX, interpolatedScalarY);
}
- (void)interpolateRotation:(TKNode *)node withIndex:(NSInteger)index withPercentage:(float)percentage
{
    float fromScalar = [(NSNumber*)[values objectAtIndex:index-1] floatValue];
    float toScalar = [(NSNumber*)[values objectAtIndex:index] floatValue];
    
    node.layer.rotation = TKLinearInterpolate(fromScalar, toScalar, percentage);
}
- (void)interpolateSprite:(TKNode *)node withIndex:(NSInteger)index withPercentage:(float)percentage
{
    TKSprite* sprite = (TKSprite*)[values objectAtIndex:index -1];
    
    TKSpriteNode* spriteNode = (TKSpriteNode*)node;
    spriteNode.sprite = sprite;
}
- (void)interpolateHighlighted:(TKNode *)node withIndex:(NSInteger)index withPercentage:(float)percentage
{
    NSNumber* number = [values objectAtIndex:index -1];
    BOOL highlighted = [number boolValue];
    
    TKSpriteNode* spriteNode = (TKSpriteNode*)node;
    spriteNode.highlighted = highlighted;
}

@end
