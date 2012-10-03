//
//  TKLayer.m
//  ChaosJow
//
//

#import "TKLayer.h"

@implementation TKLayer
{
    BOOL hasPropertyChanged;
}

@synthesize bounds;
@synthesize center;
@synthesize alpha;
@synthesize scale;
@synthesize rotation;
@synthesize anchorPoint;
@synthesize transform;
@synthesize frame;

- (id)init
{
    if (self = [super init])
    {
        bounds = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
        frame = TKFrameMake(bounds);
        alpha = 1.0;
        scale = CGPointMake(1.0, 1.0);
        rotation = 0.0;
        anchorPoint = CGPointMake(0.5, 0.5);
        transform = GLKMatrix4Identity;
        hasPropertyChanged = YES;
    }
    return self;
}

- (void)copyValue:(TKLayer*)layer
{
    [self setCenter:layer.center];
    [self setScale:layer.scale];
    [self setRotation:layer.rotation];

    bounds = layer.bounds;
    alpha = layer.alpha;
    anchorPoint = layer.anchorPoint;
    transform = layer.transform;
    frame = layer.frame;
    
}

- (void)multiply:(TKLayer*)layer
{
    [self setCenter:CGPointMake(center.x + layer.center.x-layer.bounds.size.width/2,
                                center.y + layer.center.y-layer.bounds.size.height/2)];
    [self setScale:CGPointMake(scale.x * layer.scale.x,
                               scale.y * layer.scale.y)];
    [self setRotation:rotation+layer.rotation];
    
    alpha *= layer.alpha;
    transform = GLKMatrix4Multiply(layer.transform, transform);
}

#pragma mark - property
- (TKFrame)frame
{
    if (hasPropertyChanged == YES)
    {
        hasPropertyChanged = NO;
        GLKMatrix4 finalTransfrom = transform;
        
        TKMatrix4Translate(&finalTransfrom, center.x - (SCREEN_WIDTH>>1), (SCREEN_HEIGHT>>1)-center.y);
        TKMatrix4Scale(&finalTransfrom, scale.x, scale.y);
        TKMatrix4Translate(&finalTransfrom, (anchorPoint.x-0.5)*bounds.size.width,
                           (anchorPoint.y-0.5)*bounds.size.height);
        
        finalTransfrom = GLKMatrix4Rotate(finalTransfrom, rotation, 0, 0, 1.0);
        
        TKMatrix4Translate(&finalTransfrom, -1.0*anchorPoint.x*bounds.size.width, -1.0*anchorPoint.y*bounds.size.height);
    
        GLKVector4 vector1 = GLKVector4Make(0, bounds.size.height, 1, 1);
        GLKVector4 vector2 = GLKVector4Make(bounds.size.width, bounds.size.height, 1, 1);
        GLKVector4 vector3 = GLKVector4Make(bounds.size.width, 0, 1, 1);
        GLKVector4 vector4 = GLKVector4Make(0, 0, 1, 1);
    
        vector1 = GLKMatrix4MultiplyVector4(finalTransfrom, vector1);
        vector2 = GLKMatrix4MultiplyVector4(finalTransfrom, vector2);
        vector3 = GLKMatrix4MultiplyVector4(finalTransfrom, vector3);
        vector4 = GLKMatrix4MultiplyVector4(finalTransfrom, vector4);
    
        frame.point1 = TKPointMake(vector1.x+240, 160-vector1.y);
        frame.point2 = TKPointMake(vector2.x+240, 160-vector2.y);
        frame.point3 = TKPointMake(vector3.x+240, 160-vector3.y);
        frame.point4 = TKPointMake(vector4.x+240, 160-vector4.y);
    }
    
    return frame;
}

#pragma mark - world transform operation
- (void)translateX:(float)x Y:(float)y
{
     GLKMatrix4 leftMatrix = GLKMatrix4MakeTranslation(x, y, 1);
     transform = GLKMatrix4Multiply(leftMatrix, transform);
}
- (void)scaleX:(float)x Y:(float)y
{
    GLKMatrix4 leftMatrix = GLKMatrix4MakeScale(x, y, 1);
    transform = GLKMatrix4Multiply(leftMatrix, transform);
}
- (void)rotateR:(float)radian X:(float)x Y:(float)y Z:(float)z
{
    GLKMatrix4 leftMatrix = GLKMatrix4MakeRotation(radian, x, y, z);
    transform = GLKMatrix4Multiply(leftMatrix, transform);
}

#pragma mark - property
- (void)setCenter:(CGPoint)value
{
    if (center.x != value.x || center.y != value.y)
    {
        hasPropertyChanged = YES;
        center = value;
    }
}
- (void)setRotation:(CGFloat)value
{
    if (rotation != value)
    {
        hasPropertyChanged = YES;
        rotation = value;
    }
}
- (void)setScale:(CGPoint)value
{
    if (scale.x != value.x || scale.y != value.y)
    {
        hasPropertyChanged = YES;
        scale = value;
    }
}

- (void)setBounds:(CGRect)value
{
    hasPropertyChanged = YES;
    bounds = value;
}

@end
