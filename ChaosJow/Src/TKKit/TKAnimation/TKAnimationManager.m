//
//  TKAnimationManager.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-23.
//

#import "TKAnimationManager.h"

@implementation TKDelegateCallbacker
@synthesize delegate;
@synthesize identifier;
@synthesize node;
@end

@implementation TKAnimationManager

- (id)init
{
    if (self = [super init])
    {
        delegateArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addActionDelegate:(id<TKAnimationDelegate>)delegate identifier:(NSString*)identifier 
                     node:(TKNode*)node
{
    TKDelegateCallbacker* callbacker = [[TKDelegateCallbacker alloc] init];
    callbacker.delegate = delegate;
    callbacker.identifier = identifier;
    callbacker.node = node;
    
    [delegateArray addObject:callbacker];
}

- (void)update:(NSTimeInterval)timeSinceLastUpdate
{
    TKDelegateCallbacker* callbacker = nil;
    
    for (callbacker in delegateArray)
    {
        [callbacker.delegate animationDidEnd:callbacker.identifier targetNode:callbacker.node];
    }
    [delegateArray removeAllObjects];
}

@end
