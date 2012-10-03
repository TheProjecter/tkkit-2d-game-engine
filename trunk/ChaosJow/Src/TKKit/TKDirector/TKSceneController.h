//
//  TKSceneController.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import <Foundation/Foundation.h>

@class TKNode;
@class TKDirector;
@class TKEvent;

@interface TKSceneController : NSObject

@property(strong, nonatomic) TKNode* root;
@property(weak, nonatomic) TKDirector* director;
@property(weak, nonatomic) TKNode* hitNode;

- (id)initWithDirector:(TKDirector*)mainDirector;

#pragma mark - update
- (void)update:(NSTimeInterval)timeSinceLastUpdate;
- (void)render;

#pragma mark - touches
- (void)touchesBegan:(NSSet *)touches withEvent:(TKEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(TKEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(TKEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(TKEvent *)event;

@end
