//
//  TKSegue.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import <Foundation/Foundation.h>
#import "TKAnimation.h"

@class TKSceneController;
@class TKDirector;

@interface TKSegue : NSObject<TKAnimationDelegate>
{
    TKSceneController* srcController;
    TKSceneController* dstController;
    NSString* dstControllerName;
}

@property(weak, nonatomic) TKDirector* director;
@property(strong, nonatomic, readonly) NSString* identifier;
@property(assign, nonatomic) NSTimeInterval easeOutDuration;
@property(assign, nonatomic) NSTimeInterval easeOutDelay;
@property(assign, nonatomic) NSTimeInterval easeInDuration;
@property(assign, nonatomic) NSTimeInterval easeInDelay;

- (id)initWithIdentifier:(NSString*)newIdentifier withDirector:(TKDirector*)newDirector withDestination:(NSString*)dstControllerName;
- (void)perform;
- (void)animationDidEnd:(NSString*)identifier targetNode:(TKNode*)node;

@end
