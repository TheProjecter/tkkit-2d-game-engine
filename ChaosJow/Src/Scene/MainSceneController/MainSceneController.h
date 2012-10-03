//
//  MainSceneController.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-8.
//

#import <Foundation/Foundation.h>
#import "TKSceneController.h"
#import "TKAnimation.h"
#import "TKMenuNode.h"

@class TKSpriteNode;
@class TKMenuNode;

@interface MainSceneController : TKSceneController<TKAnimationDelegate, TKMenuNodeDelegate>
{
    NSMutableArray* crowArray;
    TKSpriteNode* spriteNodeBackground;
    TKSpriteNode* spriteNodeCloudOut;
    TKSpriteNode* spriteNodeCloudIn;
    TKSpriteNode* spriteNodeHouse;
    TKSpriteNode* spriteNodeGate;
    TKSpriteNode* spriteNodeTitle;
    TKSpriteNode* spriteNodeTapCaution;
    TKMenuNode*   menuNodeMain;
    TKMenuNode*   menuNodeOption;
}

#pragma mark - init
- (id)initWithDirector:(TKDirector*)mainDirector;

#pragma mark - load
- (void)loadResource;
- (void)loadCrow;
- (void)loadMenuMain;
- (void)loadMenuOption;

- (void)easeOutTitle;

#pragma mark - update
- (void)update:(NSTimeInterval)timeSinceLastUpdate;
- (void)render;

#pragma mark - action
- (void)responseTapCaution;

#pragma mark - TKAnimationDelegate
- (void)animationDidEnd:(NSString*)identifier targetNode:(TKNode*)node;

#pragma mark - TKMenuNodeDelegate
-(void)menuNodeHighlightedItemChanged:(TKMenuNode*)menuNode;

@end
