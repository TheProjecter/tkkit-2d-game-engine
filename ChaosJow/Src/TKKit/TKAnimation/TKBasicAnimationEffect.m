//
//  TKBasicAnimatinoEffect.m
//  ChaosJow
//
//

#import "TKBasicAnimationEffect.h"
#import "TKSpriteNode.h"
#import "TKUtility.h"
#import "TKLayer.h"

#pragma mark - private category
@interface TKBasicAnimationEffect()

#pragma mark - interpolate transform
- (void)interpolateTransformRotation:(TKNode*)node withPercentage:(float)percentage;
- (void)interpolateTransformScale:(TKNode*)node withPercentage:(float)percentage;
- (void)interpolateTransformScaleX:(TKNode*)node withPercentage:(float)percentage;
- (void)interpolateTransformScaleY:(TKNode*)node withPercentage:(float)percentage;
- (void)interpolateTransformTranslation:(TKNode*)node withPercentage:(float)percentage;
- (void)interpolateTransformTranslationX:(TKNode*)node withPercentage:(float)percentage;
- (void)interpolateTransformTranslationY:(TKNode*)node withPercentage:(float)percentage;

#pragma mark - interpolate property
- (void)interpolateCenter:(TKNode*)node withPercentage:(float)percentage;
- (void)interpolateAlpha:(TKNode*)node withPercentage:(float)percentage;
- (void)interpolateScale:(TKNode*)node withPercentage:(float)percentage;
- (void)interpolateAnchorPoint:(TKNode*)node withPercentage:(float)percentage;
- (void)interpolateRotation:(TKNode*)node withPercentage:(float)percentage;

@end

@implementation TKBasicAnimationEffect

@synthesize fromValue;
@synthesize toValue;

- (void)perform:(TKNode*)node withPercentage:(float)percentage
{
#define TK_BASIC_ANIMATION_MAP_BEGIN \
    switch (super.keyPath)\
    {\

#define TK_BASIC_ANIMATION_MAP(X, Y) \
    case X:\
        [self Y:node withPercentage:percentage];\
    break;\

#define TK_MASIC_ANIMATION_BLINK(X) \
    case X:\
        NSLog(@"error: basic animation does not support spirte");\
        break;

#define TK_BASIC_ANIMATINO_MAP_END \
    }
    
    TK_BASIC_ANIMATION_MAP_BEGIN
    TK_BASIC_ANIMATION_MAP(kTKKeyPath_TransformRotation, interpolateTransformRotation)
    TK_BASIC_ANIMATION_MAP(kTKKeyPath_TransformScale, interpolateTransformScale)
    TK_BASIC_ANIMATION_MAP(kTKKeyPath_TransformScaleX, interpolateTransformScaleX)
    TK_BASIC_ANIMATION_MAP(kTKKeyPath_TransformScaleY, interpolateTransformScaleY)
    TK_BASIC_ANIMATION_MAP(kTKKeyPath_TransformTranslation, interpolateTransformTranslation)
    TK_BASIC_ANIMATION_MAP(kTKKeyPath_TransformTranslationX, interpolateTransformTranslationX)
    TK_BASIC_ANIMATION_MAP(kTKKeyPath_TransformTranslationY, interpolateTransformTranslationY)
    TK_BASIC_ANIMATION_MAP(kTKKeyPath_Center, interpolateCenter)
    TK_BASIC_ANIMATION_MAP(kTKKeyPath_Alpha, interpolateAlpha)
    TK_BASIC_ANIMATION_MAP(kTKKeyPath_Scale, interpolateScale)
    TK_BASIC_ANIMATION_MAP(kTKKeyPath_AnchorPoint, interpolateRotation)
    TK_BASIC_ANIMATION_MAP(kTKKeyPath_Rotation, interpolateRotation)
    TK_MASIC_ANIMATION_BLINK(kTKKeyPath_Sprite)
    TK_MASIC_ANIMATION_BLINK(kTKKeyPath_Highlighted)
    TK_BASIC_ANIMATINO_MAP_END
    
    
#undef TK_BASIC_ANIMATION_MAP_BEGIN
#undef TK_BASIC_ANIMATION_MAP
#undef TK_MASIC_ANIMATION_BLINK
#undef TK_BASIC_ANIMATINO_MAP_END
}

#pragma mark - interpolate transform
- (void)interpolateTransformRotation:(TKNode*)node withPercentage:(float)percentage
{    
    float fromScalar = [(NSNumber*)fromValue floatValue];
    float toScalar = [(NSNumber*)toValue floatValue];
    
    float interpolatedScalar = fromScalar*(1-percentage) + percentage*toScalar;
    [node.layer rotateR:interpolatedScalar X:0 Y:0 Z:1];
}
- (void)interpolateTransformScale:(TKNode*)node withPercentage:(float)percentage
{
    float fromScalar = [(NSNumber*)fromValue floatValue];
    float toScalar = [(NSNumber*)toValue floatValue];
    
    float interpolatedScalar = fromScalar*(1-percentage) + percentage*toScalar;
    [node.layer scaleX:interpolatedScalar Y:interpolatedScalar];
}
- (void)interpolateTransformScaleX:(TKNode*)node withPercentage:(float)percentage
{
    float fromScalar = [(NSNumber*)fromValue floatValue];
    float toScalar = [(NSNumber*)toValue floatValue];
    
    float interpolatedScalar = fromScalar*(1-percentage)+ percentage*toScalar;
    [node.layer scaleX:interpolatedScalar Y:1];
}
- (void)interpolateTransformScaleY:(TKNode*)node withPercentage:(float)percentage
{
    float fromScalar = [(NSNumber*)fromValue floatValue];
    float toScalar = [(NSNumber*)toValue floatValue];
    
    float interpolatedScalar = fromScalar*(1-percentage)+ percentage*toScalar;
    [node.layer scaleX:1 Y:interpolatedScalar];
}
- (void)interpolateTransformTranslation:(TKNode*)node withPercentage:(float)percentage
{
    CGPoint fromScalar = [(NSValue*)fromValue CGPointValue];;
    CGPoint toScalar = [(NSValue*)toValue CGPointValue];;
    
    float interpolatedScalarX = fromScalar.x*(1-percentage) + percentage*toScalar.x;
    float interpolatedScalarY = fromScalar.y*(1-percentage)+ percentage*toScalar.y;
    
    [node.layer translateX:interpolatedScalarX Y:interpolatedScalarY];
}
- (void)interpolateTransformTranslationX:(TKNode*)node withPercentage:(float)percentage
{
    float fromScalar = [(NSNumber*)fromValue floatValue];
    float toScalar = [(NSNumber*)toValue floatValue];
    
    float interpolatedScalar = fromScalar*(1-percentage)+ percentage*toScalar;
    [node.layer translateX:interpolatedScalar Y:0];
}
- (void)interpolateTransformTranslationY:(TKNode*)node withPercentage:(float)percentage
{
    float fromScalar = [(NSNumber*)fromValue floatValue];
    float toScalar = [(NSNumber*)toValue floatValue];
    
    float interpolatedScalar = fromScalar*(1-percentage)+ percentage*toScalar;
    [node.layer translateX:0 Y:interpolatedScalar];
}

#pragma mark - interpolate property
- (void)interpolateCenter:(TKNode*)node withPercentage:(float)percentage
{
    CGPoint fromScalar = [(NSValue*)fromValue CGPointValue];;
    CGPoint toScalar = [(NSValue*)toValue CGPointValue];;
    
    float interpolatedScalarX = fromScalar.x*(1-percentage) + percentage*toScalar.x;
    float interpolatedScalarY = fromScalar.y*(1-percentage)+ percentage*toScalar.y;
    
    node.layer.center = CGPointMake(interpolatedScalarX, interpolatedScalarY);
}
- (void)interpolateAlpha:(TKNode*)node withPercentage:(float)percentage
{
    float fromScalar = [(NSNumber*)fromValue floatValue];
    float toScalar = [(NSNumber*)toValue floatValue];
    
    node.layer.alpha = TKLinearInterpolate(fromScalar, toScalar, percentage);
}
- (void)interpolateScale:(TKNode*)node withPercentage:(float)percentage
{
    CGPoint fromScalar = [(NSValue*)fromValue CGPointValue];
    CGPoint toScalar = [(NSValue*)toValue CGPointValue];
    
    float interpolatedScalarX = fromScalar.x*(1-percentage) + percentage*toScalar.x;
    float interpolatedScalarY = fromScalar.y*(1-percentage)+ percentage*toScalar.y;
    
    node.layer.scale = CGPointMake(interpolatedScalarX, interpolatedScalarY);
}
- (void)interpolateAnchorPoint:(TKNode*)node withPercentage:(float)percentage
{
    CGPoint fromScalar = [(NSValue*)fromValue CGPointValue];;
    CGPoint toScalar = [(NSValue*)toValue CGPointValue];;
    
    float interpolatedScalarX = fromScalar.x*(1-percentage) + percentage*toScalar.x;
    float interpolatedScalarY = fromScalar.y*(1-percentage)+ percentage*toScalar.y;
    
    node.layer.anchorPoint = CGPointMake(interpolatedScalarX, interpolatedScalarY);
}
- (void)interpolateRotation:(TKNode *)node withPercentage:(float)percentage
{
    float fromScalar = [(NSNumber*)fromValue floatValue];
    float toScalar = [(NSNumber*)toValue floatValue];
    
    node.layer.rotation = (1-percentage)*fromScalar + percentage*toScalar;
}



@end
