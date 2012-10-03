//
//  TKSceneController.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import "TKSceneController.h"
#import "TKNode.h"


@implementation TKSceneController

@synthesize root;
@synthesize director;
@synthesize hitNode;

- (id)initWithDirector:(TKDirector*)mainDirector
{
    if (self = [super init])
    {
        root = [[TKNode alloc] init];
        director = mainDirector;
        hitNode = nil;
    }
    return self;
}

#pragma mark - update
- (void)update:(NSTimeInterval)timeSinceLastUpdate
{
    [root update:timeSinceLastUpdate];
}

- (void)render
{
    [root render];
}

#pragma mark - touches
- (void)touchesBegan:(NSSet *)touches withEvent:(TKEvent *)event
{}
- (void)touchesMoved:(NSSet *)touches withEvent:(TKEvent *)event
{}
- (void)touchesCancelled:(NSSet *)touches withEvent:(TKEvent *)event
{}
- (void)touchesEnded:(NSSet *)touches withEvent:(TKEvent *)event
{}

@end
