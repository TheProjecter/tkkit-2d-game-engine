//
//  TKNode.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import "TKNode.h"
#import "TKAnimation.h"
#import "TKLayer.h"
#import "TKUtility.h"

@interface TKNode()
{
    TKLayer* _renderLayer;
}
@end

@implementation TKNode

#pragma mark - synthesize
@synthesize interactable;
@synthesize tag;
@synthesize hidden;

@synthesize center;
@synthesize bounds;
@synthesize alpha;
@synthesize scale;
@synthesize rotation;
@synthesize anchorPoint;
@synthesize transform;
@synthesize frame;

@synthesize father;
@synthesize layer = _renderLayer;

#pragma mark - init
- (id)init
{
    if (self = [super init])
    {
        father = nil;
        hidden = NO;
        tag = 0;
        interactable = NO;
        
        childArray = [[NSMutableArray alloc] init];
        queuedAnimationArray = [[NSMutableArray alloc] init];
        storedAnimationArray = [[NSMutableArray alloc] init];
        
        _layer = [[TKLayer alloc] init];
        _renderLayer = [[TKLayer alloc] init];
        _delegateArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

#pragma mark - update render
- (void)update:(NSTimeInterval)timeSinceLastUpdate
{
    [_renderLayer copyValue:_layer];
    
    [self updateAnimation:timeSinceLastUpdate];
    
    // 叠加父窗口效果
    if (father != nil)
        [_renderLayer multiply:father.layer];
    
    TKNode* node;
    for(node in childArray)
    {
        [node update:timeSinceLastUpdate];
    }
}

- (void)updateAnimation:(NSTimeInterval)timeSinceLastUpdate
{
    // 更新动画
    if (queuedAnimationArray.count)
    {
        for (TKAnimation* animation in queuedAnimationArray)
        {
            [animation update:self withTime:timeSinceLastUpdate];
        
            if (animation.hasEnded)
            {
                if (animation.repeat == YES)
                {
                    // 重置，从头移动到尾
                    [animation replay];
                }
                else
                {
                    [_layer copyValue:_renderLayer];
                    [queuedAnimationArray removeObject:animation];
                }
            }
        }
    }
}

- (void)render
{
    if (hidden == YES || _renderLayer.alpha == 0.0)
        return ;

    [self renderSelf];
    
    TKNode* node;
    for(node in childArray)
    {
        [node render];
    }
}

- (void)renderSelf
{
}

#pragma mark - tree hierarchy
- (void)addChildNode:(TKNode*)child
{
    [childArray addObject:child];
    child.father = self;
}
- (void)insertChildNode:(TKNode*)child atIndex:(NSInteger)index
{
    [childArray insertObject:child atIndex:index];
}
- (void)deleteChild:(TKNode*)child
{
    [childArray removeObject:child];
}
- (void)deleteChildWithTag:(NSInteger)childTag
{
    TKNode* node;
    for(node in childArray)
    {
        if (node.tag == childTag)
        {
            [childArray removeObject:node];
            return ;
        }
    }
}

#pragma mark - hit test
- (TKNode*)hitTest:(CGPoint)point
{
    TKNode* node;
    for(node in childArray)
    {
        node = [node hitTest:point];
        if (node)
            return node; 
    }
    
    if (interactable && [self pointInside:point])
        return self;
    
    return nil;
}
- (BOOL)pointInside:(CGPoint)point
{
    if (hidden == YES || _renderLayer.alpha == 0.0)
        return NO;
    return TKPointInFrame(point, _renderLayer.frame);
}

#pragma mark - world transform operation
- (void)translateX:(float)x Y:(float)y
{
    [_layer translateX:x Y:y];
}
- (void)scaleX:(float)x Y:(float)y
{
    [_layer scaleX:x Y:y];
}
- (void)rotateR:(float)radian X:(float)x Y:(float)y Z:(float)z
{
    [_layer rotateR:radian X:x Y:y Z:z];
}

#pragma mark - animation operate
- (void)addAnimation:(TKAnimation*)animation immediatePerform:(BOOL)immediatePerfom needStore:(BOOL)isNeedStore
{
    if (immediatePerfom)
        [queuedAnimationArray addObject:animation];
    
    if (isNeedStore)
        [storedAnimationArray addObject:animation];
}
- (BOOL)isAnimationActivting:(NSString*)identification
{
    TKAnimation* animation;
    for (animation in queuedAnimationArray)
        if ([animation.identifier compare:identification] == NSOrderedSame)
            return YES;
    return NO;
}
- (void)playAnimation:(NSString*)identification
{
    TKAnimation* animation;
    for (animation in storedAnimationArray)
    {
        if ([animation.identifier compare:identification] == NSOrderedSame)
        {
            [animation reset];
            // if animation is not acticating now, then add it
            if ([queuedAnimationArray containsObject:animation] == NO)
                [queuedAnimationArray addObject:animation];
        }
    }
}
- (void)deleteAnimation:(TKAnimation*)animation forever:(BOOL)isForeverDelete
{
    [queuedAnimationArray removeObject:animation];
    
    if (isForeverDelete)
        [storedAnimationArray removeObject:animation];
}
- (void)deleteAnimationWithIdentifier:(NSString*)identifier forever:(BOOL)isForeverDelete
{
    TKAnimation* animation;
    for(animation in queuedAnimationArray)
    {
        if ([animation.identifier compare:identifier] == NSOrderedSame)
        {
            [queuedAnimationArray removeObject:animation];
            
            if (isForeverDelete)
                [storedAnimationArray removeObject:animation];
            
            return ;
        }
    } 
}

#pragma mark - layer property
- (CGPoint)center
{
    return _layer.center;
}
- (void)setCenter:(CGPoint)value
{
    _layer.center = value;
}
- (CGRect)bounds
{
    return _layer.bounds;
}
- (void)setBounds:(CGRect)value
{
    _layer.bounds = value;
}
- (CGFloat)alpha
{
    return _layer.alpha;
}
- (void)setAlpha:(CGFloat)value
{
    _layer.alpha = value;
}
- (CGPoint)scale
{
    return _layer.scale;
}
- (void)setScale:(CGPoint)value
{
    _layer.scale = value;
}
- (float)rotation
{
    return  _layer.rotation;
}
- (void)setRotation:(float)value
{
    _layer.rotation = value;
}
- (CGPoint)anchorPoint
{
    return _layer.anchorPoint;
}
- (void)setAnchorPoint:(CGPoint)value
{
    _layer.anchorPoint = value;
}
- (GLKMatrix4)transform
{
    return _layer.transform;
}
- (void)setTransform:(GLKMatrix4)value
{
    _layer.transform = value;
}
- (TKFrame)frame
{
    return _layer.frame;
}
- (void)setFrame:(TKFrame)value
{
    _layer.frame = value;
}

#pragma mark - touches
- (void)touchesBegan:(NSSet *)touches withEvent:(TKEvent *)event
{
}
- (void)touchesMoved:(NSSet *)touches withEvent:(TKEvent *)event
{
}
- (void)touchesMovedIn:(NSSet *)touches withEvent:(TKEvent *)event
{
}
- (void)touchesMovedOut:(NSSet *)touches withEvent:(TKEvent *)event
{
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(TKEvent *)event
{
}
- (void)touchesEnded:(NSSet *)touches withEvent:(TKEvent *)event
{
}

#pragma mark - delegate
- (void)addDelegate:(id<TKNodeDelegate>)delegate
{
    [_delegateArray addObject:delegate];
}
- (void)removeDelegate:(id<TKNodeDelegate>)delegate
{
    [_delegateArray removeObject:delegate];
}
- (void)clearAllDelegate
{
    [_delegateArray removeAllObjects];
}
- (void)invokeDelegateForSelector:(SEL)select
{
    id<TKNodeDelegate> delegate;
    for (delegate in _delegateArray)
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [delegate performSelector:select withObject:self];
#pragma clang diagnostic pop
    }
}

@end
