//
//  TKRenderManager.h
//  ChaosJow
//
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@class TKSpriteNode;
@class TKDirector;

@interface TKRenderManager : NSObject

@property(weak, nonatomic) UIViewController* mainViewController;
@property(weak, nonatomic) TKDirector* director;
@property (assign, nonatomic) GLuint program;
@property (assign, nonatomic) GLKMatrix4 projectMatrix;
@property (assign, nonatomic) GLuint mvpMatrixUniformLocation;
@property (assign, nonatomic) GLuint alphaUniformLocation;
@property (assign, nonatomic) GLuint sampleUniformLocation;


#pragma mark - init
- (id)initWithDirector:(TKDirector*)mainDirector;
- (void)loadShaders;
- (void)setupRenderParameter;

#pragma mark - control game
- (void)update:(NSTimeInterval)timeSinceLastUpdate;
- (void)render;

#pragma mark - utility
- (void)renderSpriteNode:(TKSpriteNode*)sprite;



@end
