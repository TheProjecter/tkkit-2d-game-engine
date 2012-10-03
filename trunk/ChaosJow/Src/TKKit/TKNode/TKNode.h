//
//  TKNode.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import <Foundation/Foundation.h>
#import "TKUtility.h"

@class TKAnimation;
@class TKLayer;

@protocol TKNodeDelegate <NSObject>
@optional
@end

@interface TKNode : NSObject
{
    NSMutableArray* childArray;
    NSMutableArray* queuedAnimationArray;
    NSMutableArray* storedAnimationArray;
    NSMutableArray* _delegateArray;
    TKLayer* _layer;
}

@property(assign, nonatomic) BOOL       hidden;
@property(assign, nonatomic) NSInteger  tag;
@property(assign, nonatomic) BOOL       interactable;

@property(assign, nonatomic) CGRect     bounds;
@property(assign, nonatomic) CGPoint    center;
@property(assign, nonatomic) CGPoint    scale;
@property(assign, nonatomic) CGPoint    anchorPoint;
@property(assign, nonatomic) CGFloat    alpha;
@property(assign, nonatomic) CGFloat    rotation;
@property(assign, nonatomic) GLKMatrix4 transform;
@property(assign, nonatomic) TKFrame    frame;

@property(weak, nonatomic)   TKNode*    father;
@property(strong, nonatomic) TKLayer*   layer;

#pragma mark - init
- (id)init;

#pragma mark - update render
- (void)update:(NSTimeInterval)timeSinceLastUpdate;
- (void)updateAnimation:(NSTimeInterval)timeSinceLastUpdate;
- (void)render;
- (void)renderSelf;

#pragma mark - tree hierarchy
- (void)addChildNode:(TKNode*)child;
- (void)insertChildNode:(TKNode*)child atIndex:(NSInteger)index;
- (void)deleteChild:(TKNode*)child;
- (void)deleteChildWithTag:(NSInteger)tag;

#pragma mark - hit test
- (TKNode*)hitTest:(CGPoint)point;
- (BOOL)pointInside:(CGPoint)point;

#pragma mark - transform operation
- (void)translateX:(float)x Y:(float)y;
- (void)scaleX:(float)x Y:(float)y;
- (void)rotateR:(float)radian X:(float)x Y:(float)y Z:(float)z;

#pragma mark - animation operate
- (void)addAnimation:(TKAnimation*)animation immediatePerform:(BOOL)immediatePerfom needStore:(BOOL)isNeedStore;
- (BOOL)isAnimationActivting:(NSString*)identification;
- (void)playAnimation:(NSString*)identification;
- (void)deleteAnimation:(TKAnimation*)animation forever:(BOOL)isForeverDelete;
- (void)deleteAnimationWithIdentifier:(NSString*)identifier forever:(BOOL)isForeverDelete;

#pragma mark - touches
- (void)touchesBegan:(NSSet *)touches withEvent:(TKEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(TKEvent *)event;
- (void)touchesMovedIn:(NSSet *)touches withEvent:(TKEvent *)event;
- (void)touchesMovedOut:(NSSet *)touches withEvent:(TKEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(TKEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(TKEvent *)event;

#pragma mark - delegate
- (void)addDelegate:(id<TKNodeDelegate>)delegate;
- (void)removeDelegate:(id<TKNodeDelegate>)delegate;
- (void)clearAllDelegate;
- (void)invokeDelegateForSelector:(SEL)select;
@end
