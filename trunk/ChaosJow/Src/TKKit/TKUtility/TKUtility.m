//
//  TKUtility.m
//  ChaosJow
//
//

#import "TKUtility.h"

unsigned long TKNextPOT(unsigned long x)
{
    x = x - 1;
    x = x | (x >> 1);
    x = x | (x >> 2);
    x = x | (x >> 4);
    x = x | (x >> 8);
    x = x | (x >>16);
    return x + 1;
}

#pragma mark - interpolate
float TKLinearInterpolate(float start, float end, float percentage)
{
    return start*(1-percentage) + percentage*end;
}
float TKEaseInInterpolate(float start, float end, float percentage)
{
    return TKLinearInterpolate(start, end, percentage*percentage);
}
float TKEaseOutInterpolate(float start, float end, float percentage)
{
    return start + (percentage*percentage - 2*percentage)*(end-start);
}
float TKEaseInOutInterpolate(float start, float end, float percentage)
{
    float middle = (start+end)/2;
    percentage = 2*percentage;
    if (percentage <= 1)
        return TKLinearInterpolate(start, middle, percentage*percentage);
    percentage-=1;
    return TKLinearInterpolate(middle, end, percentage*percentage);
}

#pragma mark - TKPoint
TKPoint TKPointMake(NSInteger x, NSInteger y)
{
    TKPoint point;
    point.x = x;
    point.y = y;
    return point;
}

#pragma mark - TKRect
TKFrame TKFrameMake(CGRect rect)
{
    TKFrame tkRect;
    tkRect.point1 = TKPointMake(rect.origin.x, rect.origin.y);
    tkRect.point2 = TKPointMake(rect.origin.x+rect.size.width, rect.origin.y);
    tkRect.point3 = TKPointMake(rect.origin.x, rect.origin.y+rect.size.height);
    tkRect.point4 = TKPointMake(rect.origin.x+rect.size.width, rect.origin.y+rect.size.height);
    
    return tkRect;
}

NSInteger TKVectorCross(TKPoint point1, TKPoint point2, TKPoint point0)
{
    NSInteger result = (point1.x-point0.x)*(point2.y-point0.y)-(point2.x-point0.x)*(point1.y-point0.y);
    if (result < 0)
        result *= -1.0;
    return result;
}

BOOL    TKPointInFrame(CGPoint point, TKFrame frame)
{
    TKPoint tkPoint = TKPointMake(point.x, point.y);
    TKPoint* rcPoint = (TKPoint*)&frame;
    NSUInteger s = TKVectorCross(rcPoint[0], rcPoint[1], rcPoint[2]);
    NSUInteger d = TKVectorCross(rcPoint[0], rcPoint[1], tkPoint);
    d += TKVectorCross(rcPoint[1], rcPoint[2], tkPoint);
    d += TKVectorCross(rcPoint[2], rcPoint[3], tkPoint);
    d += TKVectorCross(rcPoint[3], rcPoint[0], tkPoint);
    d >>= 1;
    
    return s == d;
}

#pragma mark - matrix operation
void TKMatrix4Translate(GLKMatrix4* matrix, float tx, float ty)
{
    matrix->m[12] += matrix->m[0] * tx + matrix->m[4] * ty;
    matrix->m[13] += matrix->m[1] * tx + matrix->m[5] * ty;
    matrix->m[14] += matrix->m[2] * tx + matrix->m[6] * ty;
}

void TKMatrix4Scale(GLKMatrix4* matrix, float sx, float sy)
{
    if (sx != 1)
    {
        matrix->m[0] *= sx;
        matrix->m[1] *= sx;
        matrix->m[2] *= sx;
        matrix->m[3] *= sx;
    }
    if (sy != 1)
    {
        matrix->m[4] *= sy; 
        matrix->m[5] *= sy; 
        matrix->m[6] *= sy;
        matrix->m[7] *= sy;
    }
}

#pragma mark - TKEvent
@implementation TKEvent
@synthesize touchSet;
- (NSSet *)allTouches
{
    return touchSet;
}
@end

#pragma mark - TKTouch
@implementation TKTouch
@synthesize node;
@synthesize point;
@end


#pragma mark - TKUtility
@implementation TKUtility

@end
