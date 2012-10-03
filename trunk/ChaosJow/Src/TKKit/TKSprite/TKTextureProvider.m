//
//  TKTextureManager.m
//  ChaosJow
//
//

#import "TKTextureProvider.h"

#pragma mark - TKTextureElement
@interface TKTextureWrapper : NSObject 
@property(weak, nonatomic) TKTexture* texture;
@end

@implementation TKTextureWrapper
@synthesize texture;
@end

#pragma mark - TKTextureProvider
@implementation TKTextureProvider

static TKTextureProvider* pInstance;
+ (id)sharedInstance
{
    if (pInstance == nil)
        pInstance = [[TKTextureProvider alloc] init];
    
    return pInstance;
}

- (id)init
{
    if (self = [super init])
    {
        textureDictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)addTexture:(TKTexture*)texture withFileName:(NSString*)filename
{
    TKTextureWrapper* textureWrapper = [textureDictionary objectForKey:filename];
    if (textureWrapper == nil)
    {
        textureWrapper = [[TKTextureWrapper alloc] init];
    }
    textureWrapper.texture = texture;
    
    [textureDictionary setObject:textureWrapper forKey:filename];
}

- (void)removeTexture:(NSString*)filename
{
    [textureDictionary removeObjectForKey:filename];
}

- (BOOL)hasTextureBeenLoad:(NSString*)filename
{
    TKTextureWrapper* textureWrapper = [textureDictionary objectForKey:filename];
    return textureWrapper.texture != nil;
}

- (TKTexture*)textureWithFileName:(NSString*)filename
{
    TKTextureWrapper* textureWrapper = [textureDictionary objectForKey:filename];
    return textureWrapper.texture;
}

@end
