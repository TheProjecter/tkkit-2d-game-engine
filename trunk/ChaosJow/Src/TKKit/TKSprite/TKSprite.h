//
//  TKSprite.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import <Foundation/Foundation.h>

@class TKTexture;

@interface TKSprite : NSObject

@property(strong, nonatomic) TKTexture* texture;
@property(assign, nonatomic) CGRect     rect;

+ (id)spriteFromImage:(NSString*)fullName withIndex:(NSInteger)index;

#pragma mark - init
- (id)initWithImageFile:(NSString*)filename withRect:(CGRect)newRect;
- (id)initWithTexture:(TKTexture*)texture withRect:(CGRect)newRect;

@end
