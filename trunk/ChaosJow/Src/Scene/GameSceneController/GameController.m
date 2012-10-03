//
//  GameController.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-29.
//

#import "GameController.h"

@implementation GameController

@synthesize availableCupCount;
@synthesize keeperStatus;

- (id)init
{
    if (self = [super init])
    {
        availableCupCount = 3;
        keeperStatus = kKeeperStatus_Normal;
    }
    return self;
}

@end
