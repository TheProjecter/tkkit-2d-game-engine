//
//  TKAnimation.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import <Foundation/Foundation.h>

@class TKAnimationEffect;
@class TKNode;

#pragma mark - protocol
@protocol TKAnimationDelegate <NSObject>
- (void)animationDidEnd:(NSString*)identifier targetNode:(TKNode*)node;
@end

#pragma mark - interface
@interface TKAnimation : NSObject
{
    NSMutableArray* effectArray;
    NSTimeInterval  accumTime;
}

@property(strong, nonatomic) NSString* identifier;
@property(assign, nonatomic) BOOL repeat;
@property(assign, nonatomic) NSTimeInterval duration;
@property(assign, nonatomic) NSTimeInterval delay;
@property(weak, nonatomic) id<TKAnimationDelegate> delegate;
@property(assign, nonatomic) BOOL hasEnded;

#pragma mark - init
- (id)init;
- (id)initWithIdentifier:(NSString*)newIdentifier;

#pragma mark - operate effect
- (void)addEffect:(TKAnimationEffect*)effect;
- (void)deleteEffect:(TKAnimationEffect*)effect;
- (void)deleteEffectWithIdentifier:(NSString*)identifier;

#pragma mark - animation operation
- (void)update:(TKNode*)node withTime:(NSTimeInterval)timeSinceLastUpdate;
- (void)replay;
- (void)reset;

@end

