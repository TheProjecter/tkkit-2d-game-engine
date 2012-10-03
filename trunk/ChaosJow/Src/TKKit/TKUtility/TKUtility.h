//
//  TKUtility.h
//  ChaosJow
//
//

#import <Foundation/Foundation.h>

unsigned long TKNextPOT(unsigned long x);

#pragma mark - interpolate
float TKLinearInterpolate(float start, float end, float percentage);
float TKEaseInInterpolate(float start, float end, float percentage);
float TKEaseOutInterpolate(float start, float end, float percentage);
float TKEaseInOutInterpolate(float start, float end, float percentage);

#pragma mark - TKPoint
struct TKPoint
{
    NSInteger x;
    NSInteger y;
};
typedef struct TKPoint TKPoint;

TKPoint TKPointMake(NSInteger x, NSInteger y);

#pragma mark - TKRect
struct TKFrame
{
    TKPoint point1;
    TKPoint point2;
    TKPoint point3;
    TKPoint point4;
};
typedef struct TKFrame TKFrame;

TKFrame     TKFrameMake(CGRect rect);
NSInteger  TKVectorCross(TKPoint point1, TKPoint point2, TKPoint point0);
BOOL        TKPointInFrame(CGPoint point, TKFrame frame);

#pragma mark - matrix operation
void TKMatrix4Translate(GLKMatrix4* matrix, float tx, float ty);
void TKMatrix4Scale(GLKMatrix4* matrix, float sx, float sy);

#pragma mark - TKEvent
@interface TKEvent : NSObject
@property(strong, nonatomic) NSSet* touchSet;
- (NSSet *)allTouches;
@end

#pragma mark - TKTouch
@class TKNode;
@interface TKTouch : NSObject
@property(weak, nonatomic) TKNode* node;
@property(assign, nonatomic) CGPoint point;
@end

#pragma mark - TKUtility
@interface TKUtility : NSObject

@end
