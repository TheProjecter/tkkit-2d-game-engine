//
//  LogoSceneController.m
//  ChaosJow
//
//

#import "LogoSceneController.h"
#import "TKSpriteNode.h"
#import "TKDirector.h"

@implementation LogoSceneController

- (id)initWithDirector:(TKDirector*)mainDirector
{
    if (self =[super initWithDirector:mainDirector])
    {
        // 创建LogoSprite
        spriteNodeLogo = [[TKSpriteNode alloc] initWithImage:@"Default.png" index:0];
        spriteNodeLogo.rotation = M_PI/2;
        
        [super.root addChildNode:spriteNodeLogo];
    }
    return self;
}

- (void)update:(NSTimeInterval)timeSinceLastUpdate
{
    [super update:timeSinceLastUpdate];
    //[super.root update:timeSinceLastUpdate];
}

- (void)render
{
    [super render];
    //[super.root render];
}

@end
