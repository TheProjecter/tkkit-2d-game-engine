//
//  TKMenu.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-21.
//

#import "TKMenuNode.h"
#import "TKSpriteNode.h"
#import "TKLayer.h"
#import "TKAnimation.h"
#import "TKBasicAnimationEffect.h"
#import "TKLayer.h"
#import "TKKeyframeAnimationEffect.h"
#import "TKUtility.h"

#pragma mark - private
@interface TKMenuNode()
@end

#pragma mark - implemention
@implementation TKMenuNode

@synthesize itemWidth;
@synthesize itemHeight;
@synthesize capacity;
@synthesize highlightedIndex;
@synthesize highlightedIndices;
@synthesize delay;
@synthesize blink;
@synthesize blinkHighlighted;
@synthesize multiSelect;
@synthesize alignMode;

- (id)initWithItemWidth:(NSInteger)newWidth itemHeight:(NSInteger)newHeight capacity:(NSInteger)newCapacity
{
    if (self = [super init])
    {
        itemWidth = newWidth;
        itemHeight = newHeight;
        capacity = newCapacity;
        _layer.bounds = CGRectMake(0, 0, itemWidth, itemHeight*capacity);
        highlightedIndex = capacity;
        highlightedIndices = nil;
        delay = 0.0;
        blink = NO;
        blinkHighlighted = YES;
        multiSelect = NO;
        super.interactable = YES;
        alignMode = kTKAlignMode_Default;
    }
    return self;
}

- (void)addMenuItem:(TKSpriteNode*)item
{
    if (childArray.count == capacity)
        return ;
    
    NSInteger index = childArray.count + 1;
    
    CGFloat x;
    if (alignMode & kTKAlignMode_Horizontal_Left)
        x = item.bounds.size.width/2;
    else if (alignMode & kTKAlignMode_Horizontal_Center)
        x = itemWidth>>1;
    else if (alignMode & kTKAlignMode_Horizontal_Right)
        x = itemWidth - item.bounds.size.width/2;
    
    CGFloat y;
    if (alignMode & kTKAlignMode_Vertical_Top)
    {
        y = itemHeight * (index-1);
        y += item.bounds.size.height/2;
    }
    else if (alignMode & kTKAlignMode_Vertical_Center)
        y = itemHeight*(index - 0.5);
    else if (alignMode & kTKAlignMode_Vertical_Bottom)
    {
        y = itemHeight * index;
        y -= item.bounds.size.height/2;
    }
    
    item.alpha = 0.0;
    item.center = CGPointMake(x, y);
    [self addChildNode:(TKNode*)item];
    
    // MenuItem Animation
    TKAnimation* animation = [[TKAnimation alloc] initWithIdentifier:@"MenuItemShowup"];
    animation.duration = 1.5;
    animation.delay = delay + (index-1)*0.8;
    
    TKBasicAnimationEffect* basicEffect = [[TKBasicAnimationEffect alloc] init];    
    basicEffect.keyPath = kTKKeyPath_Alpha;
    basicEffect.fromValue = [NSNumber numberWithFloat:0];
    basicEffect.toValue = [NSNumber numberWithFloat:1.0];
    
    [animation addEffect:basicEffect];
    [item addAnimation:animation immediatePerform:YES needStore:YES];
}

#pragma mark - hit test
- (TKNode*)hitTest:(CGPoint)point
{
    if (super.hidden == YES || super.layer.alpha == 0.0)
        return nil;
    
    if (super.interactable == NO)
        return nil;

    if (![self pointInside:point])        
        return nil;

    return self;
}

- (void)update:(NSTimeInterval)timeSinceLastUpdate
{
    // 更新item状态
    TKSpriteNode* spriteNode;
    NSInteger count = 0;
    for (spriteNode in childArray)
    {
        if ([self isItemHighlighted:count])
            spriteNode.highlighted = YES;
        else
            spriteNode.highlighted = NO;
    
        count++;
    }
    
    if (blinkHighlighted)
    {
        [super update:timeSinceLastUpdate];
    }
    else
    {
        // 自己更新
        [super.layer copyValue:_layer];
        [self updateAnimation:timeSinceLastUpdate];
    
        // 叠加父窗口效果
        if (super.father != nil)
            [super.layer multiply:super.father.layer];
    
        TKNode* node;
        CGFloat orgAlpha = super.layer.alpha;
        NSInteger count = 0;
        for(node in childArray)
        {
            if ([self isItemHighlighted:count])
                super.layer.alpha = 1.0;
            
            [node update:timeSinceLastUpdate];
            
            if ([self isItemHighlighted:count])
                super.layer.alpha = orgAlpha;
            
            count++;   
        }
    }
}

#pragma mark - property
- (void)setBlink:(BOOL)value
{
    if (blink == NO && value == YES)
    {
        TKAnimation* animation = [[TKAnimation alloc] init];
        animation.duration = 3.0;
        animation.delay = delay + capacity*2;
        animation.repeat = YES;
        
        TKKeyframeAnimationEffect* keyframeEffect = [[TKKeyframeAnimationEffect alloc] init];
        keyframeEffect.keyPath = kTKKeyPath_Alpha;
        [keyframeEffect addValue:[NSNumber numberWithFloat:1.0] keyTime:0.0];
        [keyframeEffect addValue:[NSNumber numberWithFloat:0.5] keyTime:0.5];
        [keyframeEffect addValue:[NSNumber numberWithFloat:1.0] keyTime:1.0];
        
        [animation addEffect:keyframeEffect];
        [self addAnimation:animation immediatePerform:YES needStore:NO];
        
        blink = YES;
    }
}

- (void)setHidden:(BOOL)value
{
    if (super.hidden == YES && value == NO)
    {
        super.hidden = NO;
        
        TKNode* child;
        for (child in childArray)
        {
            child.alpha = 0.0;
            [child playAnimation:@"MenuItemShowup"];
        }
    }
    else
    {
        super.hidden = value;
    }
    
}

- (void)setMultiSelect:(BOOL)value
{
    if (multiSelect == NO && value == YES)
    {
        highlightedIndices = [[NSMutableSet alloc] init];
    }
    else if (multiSelect == YES && value == NO)
    {
        highlightedIndices = nil;
    }
    
    multiSelect = value;
}

#pragma mark - tools
- (BOOL)isItemHighlighted:(NSInteger)index
{
    if (multiSelect == NO)
    {
        return index == highlightedIndex;
    }
    else 
    {
        return [highlightedIndices containsObject:[NSNumber numberWithInteger:index]];
    }
}

#pragma mark - touches began
- (void)touchesBegan:(NSSet *)touches withEvent:(TKEvent *)event
{
    TKTouch* touch = [touches anyObject];
    
    TKSpriteNode* spriteNode;
    highlightedIndex = 0;
    for (spriteNode in childArray)
    {
        if (spriteNode.layer.alpha >0.0 && [spriteNode pointInside:touch.point])
        {
            if (multiSelect == YES)
            {
                if ([highlightedIndices containsObject:[NSNumber numberWithInteger:highlightedIndex]])
                    [highlightedIndices removeObject:[NSNumber numberWithInteger:highlightedIndex]];
                else
                    [highlightedIndices addObject:[NSNumber numberWithInteger:highlightedIndex]];
            }
            break;
        }
        highlightedIndex++;
    }
    
    [self invokeDelegateForSelector:@selector(menuNodeHighlightedItemChanged:)];
}


@end
