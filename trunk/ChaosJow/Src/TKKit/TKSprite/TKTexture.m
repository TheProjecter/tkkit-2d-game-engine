//
//  TKTexture.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import "TKTexture.h"
#import "TKUtility.h"
#import "TKTextureProvider.h"

@implementation TKTexture

@synthesize filename;
@synthesize name;
@synthesize width;
@synthesize height;
@synthesize pngWidth;
@synthesize pngHeight;

+ (id)textureFromFile:(NSString*)filename
{
    TKTexture* texture = [[TKTextureProvider sharedInstance] textureWithFileName:filename];
    if (texture == nil)
    {
        texture = [[TKTexture alloc] initWithImageFile:filename];
        [[TKTextureProvider sharedInstance] addTexture:texture withFileName:filename];
    }
    
    return texture;
}

#pragma mark - init
- (id)initWithImageFile:(NSString*)newFilename
{
    filename = newFilename;
    
    CGImageRef imageRef = [UIImage imageNamed:filename].CGImage;
    NSAssert(imageRef, @"error: %@ not find", filename );
    
    pngWidth = CGImageGetWidth(imageRef);
    pngHeight = CGImageGetHeight(imageRef);
    width = TKNextPOT(CGImageGetWidth(imageRef));
    height = TKNextPOT(CGImageGetHeight(imageRef));
    
    CGImageAlphaInfo info = CGImageGetAlphaInfo(imageRef);
	BOOL hasAlpha = ((info == kCGImageAlphaPremultipliedLast) || 
                     (info == kCGImageAlphaPremultipliedFirst) || 
                     (info == kCGImageAlphaLast) ||
                     (info == kCGImageAlphaFirst) ? YES : NO);
    
    size_t bpp = CGImageGetBitsPerComponent(imageRef);
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(imageRef);
    
    TKTexturePixelFormat pixelFormat;
    if(colorSpace) {
		if(hasAlpha || bpp >= 8)
			pixelFormat = kTKTexturePixelFormat_Default;
		else {
			// Using RGB565 texture since image has no alpha");
			pixelFormat = kTKTexturePixelFormat_RGB565;
		}
	} else {
		// NOTE: No colorspace means a mask image
		// TKTexture: Using A8 texture since image is a mask
		pixelFormat = kTKTexturePixelFormat_A8;
	}
    
    GLubyte* data;
    CGContextRef context;
    
    switch(pixelFormat) {          
		case kTKTexturePixelFormat_RGBA8888:
		case kTKTexturePixelFormat_RGBA4444:
		case kTKTexturePixelFormat_RGB5A1:
			colorSpace = CGColorSpaceCreateDeviceRGB();
			data = malloc(height * width * 4);
			info = hasAlpha ? kCGImageAlphaPremultipliedLast : kCGImageAlphaNoneSkipLast; 
			context = CGBitmapContextCreate(data, width, height, 8, 4 * width, colorSpace, info | kCGBitmapByteOrder32Big);			
			CGColorSpaceRelease(colorSpace);
            
			break;
		case kTKTexturePixelFormat_RGB565:
			colorSpace = CGColorSpaceCreateDeviceRGB();
			data = malloc(height * width * 4);
			info = kCGImageAlphaNoneSkipLast;
			context = CGBitmapContextCreate(data, width, height, 8, 4 * width, colorSpace, info | kCGBitmapByteOrder32Big);
			CGColorSpaceRelease(colorSpace);
			break;
		case kTKTexturePixelFormat_A8:
			data = malloc(height * width);
			info = kCGImageAlphaOnly; 
			context = CGBitmapContextCreate(data, width, height, 8, width, NULL, info);
			break;
		default:
			[NSException raise:NSInternalInconsistencyException format:@"Invalid pixel format"];
	}

    CGContextClearRect(context, CGRectMake(0, 0, width, height));
    CGContextTranslateCTM(context, 0, height - pngHeight);
	CGContextDrawImage(context, CGRectMake(0, 0, CGImageGetWidth(imageRef), CGImageGetHeight(imageRef)), imageRef);
    
    // Repack the pixel data into the right format
    void*           tempData;
    unsigned int*	inPixel32;
	unsigned short*	outPixel16;
    
	if(pixelFormat == kTKTexturePixelFormat_RGB565) {
		//Convert "RRRRRRRRRGGGGGGGGBBBBBBBBAAAAAAAA" to "RRRRRGGGGGGBBBBB"
		tempData = malloc(height * width * 2);
		inPixel32 = (unsigned int*)data;
		outPixel16 = (unsigned short*)tempData;
		for(unsigned int i = 0; i < width * height; ++i, ++inPixel32)
			*outPixel16++ = ((((*inPixel32 >> 0) & 0xFF) >> 3) << 11) | ((((*inPixel32 >> 8) & 0xFF) >> 2) << 5) | ((((*inPixel32 >> 16) & 0xFF) >> 3) << 0);
		free(data);
		data = tempData;
		
	}
	else if (pixelFormat == kTKTexturePixelFormat_RGBA4444) {
		//Convert "RRRRRRRRRGGGGGGGGBBBBBBBBAAAAAAAA" to "RRRRGGGGBBBBAAAA"
		tempData = malloc(height * width * 2);
		inPixel32 = (unsigned int*)data;
		outPixel16 = (unsigned short*)tempData;
		for(unsigned int i = 0; i < width * height; ++i, ++inPixel32)
			*outPixel16++ = 
			((((*inPixel32 >> 0) & 0xFF) >> 4) << 12) | // R
			((((*inPixel32 >> 8) & 0xFF) >> 4) << 8) | // G
			((((*inPixel32 >> 16) & 0xFF) >> 4) << 4) | // B
			((((*inPixel32 >> 24) & 0xFF) >> 4) << 0); // A
		free(data);
		data = tempData;
		
	}
	else if (pixelFormat == kTKTexturePixelFormat_RGB5A1) {
		//Convert "RRRRRRRRRGGGGGGGGBBBBBBBBAAAAAAAA" to "RRRRRGGGGGBBBBBA"
		tempData = malloc(height * width * 2);
		inPixel32 = (unsigned int*)data;
		outPixel16 = (unsigned short*)tempData;
		for(unsigned int i = 0; i < width * height; ++i, ++inPixel32)
			*outPixel16++ = 
			((((*inPixel32 >> 0) & 0xFF) >> 3) << 11) | // R
			((((*inPixel32 >> 8) & 0xFF) >> 3) << 6) | // G
			((((*inPixel32 >> 16) & 0xFF) >> 3) << 1) | // B
			((((*inPixel32 >> 24) & 0xFF) >> 7) << 0); // A
		
		
		free(data);
		data = tempData;
	}
    
    self = [self initWithData:data pixelFormat:(TKTexturePixelFormat)pixelFormat];
    
    CGContextRelease(context);
	free(data);
    
    return self;
}

- (id)initWithData:(const void*)data pixelFormat:(TKTexturePixelFormat)pixelFormat
{
    if (self = [super init])
    {
		glGenTextures(1, &name);
		glBindTexture(GL_TEXTURE_2D, name);
        
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        
        // Specify OpenGL texture image
		switch(pixelFormat)
		{
			case kTKTexturePixelFormat_RGBA8888:
				glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, (GLsizei) width, (GLsizei) height, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);
				break;
			case kTKTexturePixelFormat_RGBA4444:
				glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, (GLsizei) width, (GLsizei) height, 0, GL_RGBA, GL_UNSIGNED_SHORT_4_4_4_4, data);
				break;
			case kTKTexturePixelFormat_RGB5A1:
				glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, (GLsizei) width, (GLsizei) height, 0, GL_RGBA, GL_UNSIGNED_SHORT_5_5_5_1, data);
				break;
			case kTKTexturePixelFormat_RGB565:
				glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, (GLsizei) width, (GLsizei) height, 0, GL_RGB, GL_UNSIGNED_SHORT_5_6_5, data);
				break;
			case kTKTexturePixelFormat_AI88:
				glTexImage2D(GL_TEXTURE_2D, 0, GL_LUMINANCE_ALPHA, (GLsizei) width, (GLsizei) height, 0, GL_LUMINANCE_ALPHA, GL_UNSIGNED_BYTE, data);
				break;
			case kTKTexturePixelFormat_A8:
				glTexImage2D(GL_TEXTURE_2D, 0, GL_ALPHA, (GLsizei) width, (GLsizei) height, 0, GL_ALPHA, GL_UNSIGNED_BYTE, data);
				break;
			default:
				[NSException raise:NSInternalInconsistencyException format:@""];
		}
    }
    
    return self;
}

- (void)dealloc
{
    glDeleteTextures(1, &name);
    NSLog(@"TKTexture: %@ dealloc", filename);
}
@end
