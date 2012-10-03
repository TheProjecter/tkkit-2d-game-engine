//
//  GameSceneController.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-28.
//

#import <Foundation/Foundation.h>
#import "TKSceneController.h"
#import "TKAnimation.h"

@class TKSpriteNode;
@class GameController;

@interface GameSceneController : TKSceneController<TKAnimationDelegate>
{
    TKSpriteNode* spriteNodeCorner;
    TKSpriteNode* spriteNodeCloud;
    TKSpriteNode* spriteNodeGrass;
    TKSpriteNode* spriteNodeFence;
    TKSpriteNode* spriteNodeDesk[4];
    TKSpriteNode* spriteNodeDayNight;
    TKSpriteNode* spriteNodeDay;
    TKSpriteNode* spriteNodeDayNumber;
    TKSpriteNode* spriteNodeKeeper;
    TKSpriteNode* spriteNodeCup[3];
    TKSpriteNode* spriteNodeNoCup;
    GameController* gameController;
}

#pragma mark - property

#pragma mark - init
- (id)initWithDirector:(TKDirector*)mainDirector;

#pragma mark - load
- (void)loadResource;

#pragma mark - tools
- (NSInteger)channelFromPoint:(CGPoint)point;

#pragma mark - animation
- (void)animationDidEnd:(NSString*)identifier targetNode:(TKNode*)node;

@end
