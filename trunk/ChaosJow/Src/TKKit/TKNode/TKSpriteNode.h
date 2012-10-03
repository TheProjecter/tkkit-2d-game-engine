//
//  TKSpriteNode.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-9.
//

#import <Foundation/Foundation.h>
#import "TKNode.h"

@class TKSprite;

@interface TKSpriteNode : TKNode

@property(strong, nonatomic) TKSprite*  sprite;
@property(strong, nonatomic) NSString*  normalFilename;
@property(assign, nonatomic) NSInteger  normalIndex;
@property(assign, nonatomic) CGFloat    normalAlpha;
@property(strong, nonatomic) NSString*  highlightedFilename;
@property(assign, nonatomic) NSInteger  highlightedIndex;
@property(assign, nonatomic) CGFloat    highlightedAlpha;  
@property(assign, nonatomic) BOOL       highlighted;
@property(assign, nonatomic) GLfloat*   vertexData;

#pragma mark - init
- (id)initWithImage:(NSString*)filename index:(NSInteger)index;
- (id)initWithNormalImage:(NSString*)normalFilename 
              normalIndex:(NSInteger)normalIndex 
         highlightedImage:(NSString*)highlightedFilename
         highlightedIndex:(NSInteger)highlightedIndex;
- (id)initWithNormalImage:(NSString*)normalFilename 
              normalIndex:(NSInteger)normalIndex 
              normalAlpha:(CGFloat)normalAlpha
         highlightedImage:(NSString*)highlightedFilename
         highlightedIndex:(NSInteger)highlightedIndex 
         highlightedAlpha:(CGFloat)highlightedAlpha;
- (void)initSetVertexData;

#pragma mark - update render
- (void)update:(NSTimeInterval)timeSinceLastUpdate;
- (void)updateVertexData;
- (void)render;
- (void)renderSelf;

@end
