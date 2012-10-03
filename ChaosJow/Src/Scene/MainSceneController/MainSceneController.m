//
//  MainSceneController.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-8.
//

#import "MainSceneController.h"
#import "TKNode.h"
#import "TKSprite.h"
#import "TKSpriteNode.h"
#import "TKAnimation.h"
#import "TKBasicAnimationEffect.h"
#import "TKAudioManager.h"
#import "TKKeyframeAnimationEffect.h"
#import "TKDirector.h"
#import "TKMenuNode.h"
#import "CrowProducer.h"
#import "MainProducer.h"
#import "TKUtility.h"
#import "TKKit.h"

@implementation MainSceneController

#pragma mark - init
- (id)initWithDirector:(TKDirector*)mainDirector
{
    if (self =[super initWithDirector:mainDirector])
    {
        //super.root.alpha = 0.0;
        crowArray = [[NSMutableArray alloc] init];
        [self loadResource];
    }
    return self;
}

- (void)loadResource
{
    // 1. 背景乌云
    spriteNodeBackground = [MainProducer spriteNodeWithIndex:1];
    [super.root addChildNode:spriteNodeBackground];
    
    // 2. 外侧乌云
    spriteNodeCloudOut = [MainProducer spriteNodeWithIndex:2];
    [super.root addChildNode:spriteNodeCloudOut];
    
    // 3. 内侧乌云
    spriteNodeCloudIn = [MainProducer spriteNodeWithIndex:3];
    [super.root addChildNode:spriteNodeCloudIn];

    // 4. House
    spriteNodeHouse = [MainProducer spriteNodeWithIndex:4];
    [super.root addChildNode:spriteNodeHouse];
    
    // 5. Gate
    spriteNodeGate = [MainProducer spriteNodeWithIndex:5];
    [super.root addChildNode:spriteNodeGate];
    
    // 6. Title
    spriteNodeTitle = [MainProducer spriteNodeWithIndex:6];
    [super.root addChildNode:spriteNodeTitle];

    // 7. TapCaution
    spriteNodeTapCaution = [MainProducer spriteNodeWithIndex:7];
    [super.root addChildNode:spriteNodeTapCaution];
    
    TK_ASYNC_TASK_START
    [super.director.audioManager playBGM:@"MainSceneBGM.caf"];
    [super.director.audioManager playSFX:@"MainSceneThunderSFX.wav"];
    TK_ASYNC_TASK_END
}

- (void)loadCrow
{
    TKSpriteNode* spriteCrow = nil;
    
    // crow NO.1
    spriteCrow = [CrowProducer crowWithIndex:1];
    [crowArray addObject:spriteCrow];
    [super.root insertChildNode:spriteCrow atIndex:4];
    
    spriteCrow = [CrowProducer crowWithIndex:1];
    [crowArray addObject:spriteCrow];
    [super.root insertChildNode:spriteCrow atIndex:4];
    
    // corw NO.2
    spriteCrow = [CrowProducer crowWithIndex:2];
    [crowArray addObject:spriteCrow];
    [super.root insertChildNode:spriteCrow atIndex:4];
    
    spriteCrow = [CrowProducer crowWithIndex:2];
    [crowArray addObject:spriteCrow];
    [super.root insertChildNode:spriteCrow atIndex:4];
    
    // crow NO.3
    spriteCrow = [CrowProducer crowWithIndex:3];
    [crowArray addObject:spriteCrow];
    [super.root insertChildNode:spriteCrow atIndex:4];
    
    spriteCrow = [CrowProducer crowWithIndex:3];
    [crowArray addObject:spriteCrow];
    [super.root insertChildNode:spriteCrow atIndex:4];
    
    // crow NO.4
    spriteCrow = [CrowProducer crowWithIndex:4];
    [crowArray addObject:spriteCrow];
    [super.root insertChildNode:spriteCrow atIndex:4];
    
    spriteCrow = [CrowProducer crowWithIndex:4];
    [crowArray addObject:spriteCrow];
    [super.root insertChildNode:spriteCrow atIndex:4];
    
    // crow NO.5
    spriteCrow = [CrowProducer crowWithIndex:5];
    [crowArray addObject:spriteCrow];
    [super.root insertChildNode:spriteCrow atIndex:4];
    
    spriteCrow = [CrowProducer crowWithIndex:5];
    [crowArray addObject:spriteCrow];
    [super.root insertChildNode:spriteCrow atIndex:4];
}

- (void)loadMenuMain
{
    TKSpriteNode* startGameMenuItem = [[TKSpriteNode alloc] initWithNormalImage:@"MainSceneMenu.png" normalIndex:2 normalAlpha:0.8  highlightedImage:@"MainSceneMenu.png" highlightedIndex:2 highlightedAlpha:1.4];
    TKSpriteNode* optionMenuItem = [[TKSpriteNode alloc] initWithNormalImage:@"MainSceneMenu.png" normalIndex:4 normalAlpha:0.8 highlightedImage:@"MainSceneMenu.png" highlightedIndex:4 highlightedAlpha:1.4];
    TKSpriteNode* moreMenuItem = [[TKSpriteNode alloc] initWithNormalImage:@"MainSceneMenu.png" normalIndex:6 normalAlpha:0.8 highlightedImage:@"MainSceneMenu.png" highlightedIndex:6 highlightedAlpha:1.4];

    // 添加MenuItem
    menuNodeMain = [[TKMenuNode alloc] initWithItemWidth:149 itemHeight:25 capacity:3];
    menuNodeMain.center = CGPointMake(245, 260);
    menuNodeMain.blink = YES;
    menuNodeMain.delay = 2.0;
    menuNodeMain.scale = CGPointMake(0.9, 0.9);
    [menuNodeMain addDelegate:self];
    
    [menuNodeMain addMenuItem:startGameMenuItem];
    [menuNodeMain addMenuItem:optionMenuItem];
    [menuNodeMain addMenuItem:moreMenuItem];
    
    [super.root addChildNode:menuNodeMain];
}

- (void)loadMenuOption
{
    if (menuNodeOption)
    {
        menuNodeOption.hidden = NO;
        return ;
    }
    
    TKSpriteNode* markMenuItem = [[TKSpriteNode alloc] initWithNormalImage:@"SceneShareMenus.png" normalIndex:0 highlightedImage:@"SceneShareMenus.png" highlightedIndex:1];
    TKSpriteNode* tipsMenuItem = [[TKSpriteNode alloc] initWithNormalImage:@"SceneShareMenus.png" normalIndex:2 highlightedImage:@"SceneShareMenus.png" highlightedIndex:3];
    TKSpriteNode* soundMenuItem = [[TKSpriteNode alloc] initWithNormalImage:@"SceneShareMenus.png" normalIndex:4 highlightedImage:@"SceneShareMenus.png" highlightedIndex:5];
    
    // 添加MenuItem
    menuNodeOption = [[TKMenuNode alloc] initWithItemWidth:149 itemHeight:26 capacity:3];
    menuNodeOption.center = CGPointMake(80, 220);
    menuNodeOption.scale = CGPointMake(1.2, 1.2);
    menuNodeOption.alignMode = kTKAlignMode_Horizontal_Left|kTKAlignMode_Vertical_Center;
    menuNodeOption.multiSelect = YES;
    
    [menuNodeOption addMenuItem:markMenuItem];
    [menuNodeOption addMenuItem:tipsMenuItem];
    [menuNodeOption addMenuItem:soundMenuItem];
    
    [super.root addChildNode:menuNodeOption];
}



- (void)easeOutTitle
{
    TKAnimation* animation = [[TKAnimation alloc] init];
    animation.identifier = @"animationTitleEaseOut";
    animation.duration = 0.7;
    animation.delegate = self;
    
    // alpha
    TKBasicAnimationEffect* basicEffect = [[TKBasicAnimationEffect alloc] init];    
    basicEffect.keyPath = kTKKeyPath_Alpha;
    basicEffect.fromValue = [NSNumber numberWithFloat:1.0];
    basicEffect.toValue = [NSNumber numberWithFloat:0.0];
    [animation addEffect:basicEffect];
    
    // scale
    basicEffect = [[TKBasicAnimationEffect alloc] init];
    basicEffect.keyPath = kTKKeyPath_Scale;
    basicEffect.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    basicEffect.toValue = [NSValue valueWithCGPoint:CGPointMake(1.5, 1.5)];
    [animation addEffect:basicEffect];
    
    [spriteNodeTitle addAnimation:animation immediatePerform:YES needStore:NO];
}

#pragma mark - TKAnimationDelegate
- (void)animationDidEnd:(NSString*)identifier targetNode:(TKNode*)node
{
    if ([identifier compare:@"animationTitleEaseOut"] == NSOrderedSame)
    {
        [super.root deleteChild:spriteNodeTitle];
        spriteNodeTitle = nil;
    }
    else if ([identifier compare:@"crowAnimation"] == NSOrderedSame)
    {
        TKSpriteNode* spriteNode;
        for (spriteNode in crowArray)
        {
            [super.root deleteChild:spriteNode];
        }
        
        [crowArray removeAllObjects];
    }
}

- (void)update:(NSTimeInterval)timeSinceLastUpdate
{
    [super update:timeSinceLastUpdate];
}
- (void)render
{
    [super render];
}

#pragma mark - action
- (void)responseTapCaution
{
    spriteNodeGate.highlighted = YES;
    
    [self easeOutTitle];
    [self loadMenuMain];
    [self loadCrow];
    
    // 释放TapCaution
    [super.root deleteChild:spriteNodeTapCaution];
    spriteNodeTapCaution = nil;
    
    TK_ASYNC_TASK_START
    [super.director.audioManager playSFX:@"MainSceneGateSFX.wav"];
    [super.director.audioManager playSFX:@"MainSceneBirdsSFX.wav"];
    [super.director.audioManager playSFX:@"MainScenePianoSFX.wav"];
    TK_ASYNC_TASK_END
}

#pragma mark - touches
- (void)touchesBegan:(NSSet *)touches withEvent:(TKEvent *)event
{
    //TKTouch* touch = [touches anyObject];
    
    if (spriteNodeTapCaution && super.root.alpha == 1)
    {
        [self responseTapCaution];
        return ;
    }
}

#pragma mark - TKMenuNodeDelegate
-(void)menuNodeHighlightedItemChanged:(TKMenuNode*)menuNode
{
    if (menuNode == menuNodeMain)
    {
        switch (menuNodeMain.highlightedIndex)
        {
            case 0:
                [super.director performSegueWithIdentifier:@"SegueToGameScene"];
                break;
            case 1:
                [self loadMenuOption];
                break;
            case 2:
                menuNodeOption.hidden = YES;
                break;   
            default:
                break;
        }
    }
    else if (menuNode == menuNodeOption)
    {
        NSLog(@"menuNodeHighlightedItemChanged: menuNodeOption");
    }
}

@end
