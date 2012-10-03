//
//  TKTextureManager.h
//  ChaosJow
//
//

#import <Foundation/Foundation.h>

@class TKTexture;

@interface TKTextureProvider : NSObject
{
    NSMutableDictionary* textureDictionary;
}

+ (id)sharedInstance;
- (id)init;

- (void)addTexture:(TKTexture*)texture withFileName:(NSString*)filename;
- (void)removeTexture:(NSString*)filename;

- (BOOL)hasTextureBeenLoad:(NSString*)filename;
- (TKTexture*)textureWithFileName:(NSString*)filename;
@end
