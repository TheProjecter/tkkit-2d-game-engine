//
//  TKMenu.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-21.
//

#import <Foundation/Foundation.h>
#import "TKNode.h"

@class TKSpriteNode;

#pragma mark - MenuAlignMode
typedef enum {
	kTKAlignMode_Horizontal_Left = 0x1,
    kTKAlignMode_Horizontal_Center = 0x2,
    kTKAlignMode_Horizontal_Right = 0x4,
    kTKAlignMode_Vertical_Top = 0x8,
    kTKAlignMode_Vertical_Center = 0x16,
    kTKAlignMode_Vertical_Bottom = 0x32,
    kTKAlignMode_Default = kTKAlignMode_Horizontal_Center|kTKAlignMode_Vertical_Center
} TKAlignMode;

@class TKMenuNode;

@protocol TKMenuNodeDelegate <TKNodeDelegate>
@optional
-(void)menuNodeHighlightedItemChanged:(TKMenuNode*)menuNode;
@end

#pragma mark - TKMenuNode
@interface TKMenuNode : TKNode

@property(assign, nonatomic) NSInteger      itemWidth;
@property(assign, nonatomic) NSInteger      itemHeight;
@property(assign, nonatomic) NSInteger      capacity;
@property(assign, nonatomic) NSInteger      highlightedIndex;
@property(strong, nonatomic) NSMutableSet*  highlightedIndices;
@property(assign, nonatomic) CGFloat        delay;
@property(assign, nonatomic) BOOL           blink;
@property(assign, nonatomic) BOOL           blinkHighlighted;
@property(assign, nonatomic) BOOL           multiSelect;
@property(assign, nonatomic) TKAlignMode    alignMode;

- (id)initWithItemWidth:(NSInteger)newWidth itemHeight:(NSInteger)newHeight capacity:(NSInteger)newCapacity;
- (void)addMenuItem:(TKSpriteNode*)item;

#pragma mark - update render
- (void)update:(NSTimeInterval)timeSinceLastUpdate;

#pragma mark - tools
- (BOOL)isItemHighlighted:(NSInteger)index;


@end
