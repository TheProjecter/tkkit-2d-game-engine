//
//  TKAnimationEffect.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import <Foundation/Foundation.h>

#pragma mark - KeyPath
typedef enum {
	kTKKeyPath_TransformRotation = 0,
	kTKKeyPath_TransformScale,
	kTKKeyPath_TransformScaleX,
    kTKKeyPath_TransformScaleY,
    kTKKeyPath_TransformTranslation,
    kTKKeyPath_TransformTranslationX,
    kTKKeyPath_TransformTranslationY,
    kTKKeyPath_Center,
    kTKKeyPath_Alpha,
    kTKKeyPath_Scale,
    kTKKeyPath_AnchorPoint,
    kTKKeyPath_Rotation,
    kTKKeyPath_Sprite,
    kTKKeyPath_Highlighted
} TKAnimationKeyPath;

#pragma mark - TKNode
@class TKNode;

@interface TKAnimationEffect : NSObject

@property(assign, nonatomic) TKAnimationKeyPath keyPath;
@property(strong, nonatomic) NSString*  identifier;

- (void)perform:(TKNode*)spriteNode withPercentage:(float)percentage;

@end
