//
//  TKTexture.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import <Foundation/Foundation.h>

typedef enum {
	kTKTexturePixelFormat_Automatic = 0,
	//! 32-bit texture: RGBA8888
	kTKTexturePixelFormat_RGBA8888,
	//! 16-bit texture without Alpha channel
	kTKTexturePixelFormat_RGB565,
	//! 8-bit textures used as masks
	kTKTexturePixelFormat_A8,
	//! 8-bit intensity texture
	kTKTexturePixelFormat_I8,
	//! 16-bit textures used as masks
	kTKTexturePixelFormat_AI88,
	//! 16-bit textures: RGBA4444
	kTKTexturePixelFormat_RGBA4444,
	//! 16-bit textures: RGB5A1
	kTKTexturePixelFormat_RGB5A1,	
	//! 4-bit PVRTC-compressed texture: PVRTC4
	kTKTexturePixelFormat_PVRTC4,
	//! 2-bit PVRTC-compressed texture: PVRTC2
	kTKTexturePixelFormat_PVRTC2,
    
	//! Default texture format: RGBA8888
	kTKTexturePixelFormat_Default = kTKTexturePixelFormat_RGBA8888,
    
	// backward compatibility stuff
	kTexturePixelFormat_Automatic = kTKTexturePixelFormat_Automatic,
	kTexturePixelFormat_RGBA8888 = kTKTexturePixelFormat_RGBA8888,
	kTexturePixelFormat_RGB565 = kTKTexturePixelFormat_RGB565,
	kTexturePixelFormat_A8 = kTKTexturePixelFormat_A8,
	kTexturePixelFormat_RGBA4444 = kTKTexturePixelFormat_RGBA4444,
	kTexturePixelFormat_RGB5A1 = kTKTexturePixelFormat_RGB5A1,
	kTexturePixelFormat_Default = kTKTexturePixelFormat_Default
	
} TKTexturePixelFormat;

@interface TKTexture : NSObject

@property(assign, nonatomic) GLuint name;
@property(strong, nonatomic) NSString* filename;
@property(assign, nonatomic) NSInteger width;
@property(assign, nonatomic) NSInteger height;
@property(assign, nonatomic) NSInteger pngWidth;
@property(assign, nonatomic) NSInteger pngHeight;

+ (id)textureFromFile:(NSString*)filename;

#pragma mark - init
- (id)initWithImageFile:(NSString*)filename;
- (id)initWithData:(const void*)data pixelFormat:(TKTexturePixelFormat)pixelFormat;


@end
