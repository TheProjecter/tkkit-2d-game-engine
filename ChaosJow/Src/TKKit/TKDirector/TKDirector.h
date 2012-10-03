//
//  TKDirector.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import <Foundation/Foundation.h>

@class TKSegue;
@class TKSceneController;
@class TKRenderManager;
@class TKAnimationManager;
@class TKAudioManager;
@class TKNode;

@interface TKDirector : NSObject
{
    NSMutableArray* segueArray;
}

@property(weak, nonatomic)   UIViewController*   viewController;
@property(strong, nonatomic) TKSceneController*  sceneController;
@property(strong, nonatomic) TKRenderManager*    renderManager;
@property(strong, nonatomic) TKAnimationManager* animationManager;
@property(strong, nonatomic) TKAudioManager*     audioManager;

+ (TKDirector*)mainDirector;

#pragma mark - init
- (id)initWithViewController:(UIViewController*)mainViewController;

#pragma mark - ready
- (void)loadGameResource;
- (void)startPlay;

#pragma mark - segue operation
- (void)addSegue:(TKSegue*)segue;
- (void)deleteSegue:(TKSegue*)segue;
- (void)deleteSegueWithIdentifier:(NSString*)identifier;
- (void)performSegueWithIdentifier:(NSString*)identifier;
- (void)performSegueWithIdentifier:(NSString*)identifier delay:(NSTimeInterval)delay;

#pragma mark - control game
- (void)update:(NSTimeInterval)timeSinceLastUpdate;
- (void)render;

#pragma mark - touches
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@end
