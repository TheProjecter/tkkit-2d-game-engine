//
//  TKSpriteNode.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-9.
//

#import "TKSpriteNode.h"
#import "TKRenderManager.h"
#import "TKAnimation.h"
#import "TKSprite.h"
#import "TKTexture.h"
#import "TKLayer.h"
#import "TKDirector.h"

#pragma mark - private declaration
@interface TKSpriteNode()
{
    NSInteger bufferSize;
}
@end

@implementation TKSpriteNode

@synthesize sprite;
@synthesize normalFilename;
@synthesize normalIndex;
@synthesize normalAlpha;
@synthesize highlightedFilename;
@synthesize highlightedIndex;
@synthesize highlightedAlpha;
@synthesize highlighted;
@synthesize vertexData;

#pragma mark - init
- (id)initWithImage:(NSString*)filename index:(NSInteger)index
{
    if (self = [super init])
    {
        sprite = [TKSprite spriteFromImage:filename withIndex:index];
        super.bounds = CGRectMake(0, 0, sprite.rect.size.width, sprite.rect.size.height);
        
        normalFilename = filename;
        normalIndex = index;
        normalAlpha = 1.0;
        highlightedFilename = nil;
        highlightedIndex = 0;
        highlightedAlpha = 1.0;
        highlighted = NO;
        bufferSize = (VERTEX_BYTES_LENGTH+TEXCOORD_BYTES_LENGTH)*sizeof(GLfloat);
        vertexData = (GLfloat*)malloc(bufferSize);
        [self initSetVertexData];
    }
    return self;
}

- (id)initWithNormalImage:(NSString*)newNormalFilename 
              normalIndex:(NSInteger)newNormalIndex 
         highlightedImage:(NSString*)newHighlightedFilename
         highlightedIndex:(NSInteger)newHighlightedIndex
{
    self = [self initWithImage:newNormalFilename index:newNormalIndex];
    
    highlightedFilename = newHighlightedFilename;
    highlightedIndex = newHighlightedIndex;
    
    highlightedAlpha = 1.0;
    normalAlpha = 1.0;
    
    return self;
}

- (id)initWithNormalImage:(NSString*)newNormalFilename 
              normalIndex:(NSInteger)newNormalIndex 
              normalAlpha:(CGFloat)newNormalAlpha
         highlightedImage:(NSString*)newHighlightedFilename
         highlightedIndex:(NSInteger)newHighlightedIndex 
         highlightedAlpha:(CGFloat)newHighlightedAlpha
{
    self = [self initWithImage:newNormalFilename index:newNormalIndex];
    
    highlightedFilename = newHighlightedFilename;
    highlightedIndex = newHighlightedIndex;
    highlightedAlpha = newHighlightedAlpha;
    normalAlpha = newNormalAlpha;
    
    return self;
}

- (void)initSetVertexData
{
    // texture 总宽和总长
    NSInteger texWidth = sprite.texture.width;
    NSInteger texHeight = sprite.texture.height;
    
    // left top
    vertexData[0] = 0;
    vertexData[1] = sprite.rect.size.height;
    vertexData[2] = 1;
    vertexData[3] = sprite.rect.origin.x/texWidth;
    vertexData[4] = sprite.rect.origin.y/texHeight;
    // right top
    vertexData[5] = sprite.rect.size.width;
    vertexData[6] = sprite.rect.size.height;
    vertexData[7] = 1;
    vertexData[8] = (sprite.rect.origin.x + sprite.rect.size.width)/texWidth;
    vertexData[9] = sprite.rect.origin.y/texHeight;
    // right bottom
    vertexData[10] = sprite.rect.size.width;
    vertexData[11] = 0;
    vertexData[12] = 1;
    vertexData[13] = (sprite.rect.origin.x + sprite.rect.size.width)/texWidth;
    vertexData[14] = (sprite.rect.origin.y + sprite.rect.size.height)/texHeight;
    // left bottom
    vertexData[15] = 0;
    vertexData[16] = 0;
    vertexData[17] = 1;
    vertexData[18] = sprite.rect.origin.x/texWidth;
    vertexData[19] = (sprite.rect.origin.y + sprite.rect.size.height)/texHeight;
}

#pragma mark - update render
- (void)update:(NSTimeInterval)timeSinceLastUpdate
{
    [super update:timeSinceLastUpdate];
    [self updateVertexData];
}

- (void)render
{
    [super render];
}

- (void)updateVertexData
{
    // left top
    vertexData[0] = super.layer.frame.point1.x-240;
    vertexData[1] = super.layer.frame.point1.y*-1.0+160;
    //vertexData[2] = 1;
    //vertexData[3] = sprite.rect.origin.x/texWidth;
    //vertexData[4] = sprite.rect.origin.y/texHeight;
    
    // right top
    vertexData[5] = super.layer.frame.point2.x-240;
    vertexData[6] = super.layer.frame.point2.y*-1.0+160;
    //vertexData[7] = 1;
    //vertexData[8] = (sprite.rect.origin.x + sprite.rect.size.width)/texWidth;
    //vertexData[9] = sprite.rect.origin.y/texHeight;
    
    // right bottom
    vertexData[10] = super.layer.frame.point3.x-240;
    vertexData[11] = super.layer.frame.point3.y*-1.0+160;
    //vertexData[12] = 1;
    //vertexData[13] = (sprite.rect.origin.x + sprite.rect.size.width)/texWidth;
    //vertexData[14] = (sprite.rect.origin.y + sprite.rect.size.height)/texHeight;
    
    // left bottom
    vertexData[15] = super.layer.frame.point4.x-240;
    vertexData[16] = super.layer.frame.point4.y*-1.0+160;
    //vertexData[17] = 1;
    //vertexData[18] = sprite.rect.origin.x/texWidth;
    //vertexData[19] = (sprite.rect.origin.y + sprite.rect.size.height)/texHeight;
}

- (void)renderSelf
{
    if (sprite != nil)
        [[TKDirector mainDirector].renderManager renderSpriteNode:self];
}

#pragma mark - property
- (void)setHighlighted:(BOOL)value
{
    if (highlighted == NO && value == YES)
    {
        highlighted = YES;
        _layer.alpha = highlightedAlpha;
        sprite = [TKSprite spriteFromImage:highlightedFilename withIndex:highlightedIndex];
    }
    else if(highlighted == YES && value == NO)
    {
        highlighted = NO;
        _layer.alpha = normalAlpha;
        sprite = [TKSprite spriteFromImage:normalFilename withIndex:normalIndex];
    }
    super.bounds = CGRectMake(0, 0, sprite.rect.size.width, sprite.rect.size.height);
    super.layer.bounds = super.bounds;
    [self initSetVertexData];
}

- (void)setSprite:(TKSprite *)value
{
    sprite = value;
    super.bounds = CGRectMake(0, 0, sprite.rect.size.width, sprite.rect.size.height);
    super.layer.bounds = super.bounds;
    [self initSetVertexData];
}

- (void)dealloc
{
    free(vertexData);
    NSLog(@"spriteNode dealloc");
}

@end
