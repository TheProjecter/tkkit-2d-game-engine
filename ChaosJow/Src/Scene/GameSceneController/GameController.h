//
//  GameController.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-29.
//

#import <Foundation/Foundation.h>

#pragma mark - KeeperStatus
typedef enum {
	kKeeperStatus_Normal = 0,
    kKeeperStatus_Demaged,
    kKeeperStatus_Dying,
    kKeeperStatus_Dead
}KEEPER_STATUS;

@interface GameController : NSObject

@property(assign, nonatomic) NSInteger availableCupCount;
@property(assign, nonatomic) NSInteger keeperStatus;

- (id)init;

@end
