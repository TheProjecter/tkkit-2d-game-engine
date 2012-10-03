//
//  TKSprite.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import "TKSprite.h"
#import "TKTexture.h"
#import "TKProvider.h"
#import "TKSpriteProvider.h"

@implementation TKSprite

@synthesize texture;
@synthesize rect;

+ (TKSprite*)spriteFromImage:(NSString*)fullName withIndex:(NSInteger)index
{
    NSString* fileName = [fullName stringByDeletingPathExtension];
    NSString* className = [fileName stringByAppendingString:@"Provider"];
    
    id<TKSpriteProviderProtocol> provider = [[NSClassFromString(className) alloc] init];
    
    TKSprite* sprite = [[TKSpriteProvider sharedInstance] spriteWithFileName:fullName index:index];
    
    if (sprite == nil)
    {
        sprite = [[TKSprite alloc] initWithImageFile: fullName
                                            withRect: [provider spriteWithIndex:index]];
        
        [[TKSpriteProvider sharedInstance] addSprite:sprite withFileName:fullName index:index];
    }
    
    return sprite;
}

#pragma mark - init
- (id)initWithImageFile:(NSString*)filename withRect:(CGRect)newRect
{
    if (self = [super init])
    {
        rect = newRect;   
        texture = [TKTexture textureFromFile:filename];
    }
    
    return self;
}

- (id)initWithTexture:(TKTexture*)newTexture withRect:(CGRect)newRect
{
    if (self = [super init])
    {
        texture = newTexture;
        rect = newRect;
    }
    return self;
}

@end
