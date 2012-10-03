//
//  LogoSceneController.h
//  ChaosJow
//
//

#import <Foundation/Foundation.h>
#import "TKSceneController.h"

@class TKSpriteNode;

@interface LogoSceneController : TKSceneController
{
    TKSpriteNode* spriteNodeLogo;
}

- (id)initWithDirector:(TKDirector*)mainDirector;
- (void)update:(NSTimeInterval)timeSinceLastUpdate;
- (void)render;

@end
