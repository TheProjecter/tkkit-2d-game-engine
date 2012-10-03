//
//  TKAnimationManager.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-23.
//

#import <Foundation/Foundation.h>
#import "TKAnimation.h"

#pragma mark - TKDelegateCallbacker
@interface TKDelegateCallbacker : NSObject 
@property(weak, nonatomic) id<TKAnimationDelegate> delegate;
@property(strong, nonatomic) NSString* identifier;
@property(weak, nonatomic) TKNode* node;
@end

#pragma mark - TKAnimationManager
@interface TKAnimationManager : NSObject
{
    NSMutableArray* delegateArray;
}

- (id)init;
- (void)addActionDelegate:(id<TKAnimationDelegate>)delegate identifier:(NSString*)identifier 
                     node:(TKNode*)node;
- (void)update:(NSTimeInterval)timeSinceLastUpdate;

@end
