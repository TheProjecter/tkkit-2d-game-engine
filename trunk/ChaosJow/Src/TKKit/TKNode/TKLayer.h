//
//  TKLayer.h
//  ChaosJow
//
//

#import <Foundation/Foundation.h>
#import "TKUtility.h"

@interface TKLayer : NSObject

@property(assign, nonatomic) CGRect     bounds;
// 相对于父结点左上角的坐标
@property(assign, nonatomic) CGPoint    center;
@property(assign, nonatomic) CGPoint    scale;
@property(assign, nonatomic) CGPoint    anchorPoint;
@property(assign, nonatomic) CGFloat    alpha;
@property(assign, nonatomic) CGFloat    rotation;
@property(assign, nonatomic) GLKMatrix4 transform;
// frame保存的是全局坐标
@property(assign, nonatomic) TKFrame    frame;

- (id)init;
- (void)copyValue:(TKLayer*)layer;
- (void)multiply:(TKLayer*)layer;

#pragma mark - transform operation
- (void)translateX:(float)x Y:(float)y;
- (void)scaleX:(float)x Y:(float)y;
- (void)rotateR:(float)radian X:(float)x Y:(float)y Z:(float)z;

@end
