//
//  MainSceneController.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-8.
//

#import <Foundation/Foundation.h>
#import "TKProvider.h"

#pragma mark - MainSceneMenuProvider
@interface MainSceneMenuProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - MainSceneCloudOutProvider
@interface MainSceneCloudOutProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - MainSceneCloudInProvider
@interface MainSceneCloudInProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - MainSceneTitleProvider
@interface MainSceneTitleProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - MainSceneHouseProvider
@interface MainSceneHouseProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - MainSceneBackgroundProvider
@interface MainSceneBackgroundProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - MainSceneGateCloseProvider
@interface MainSceneGateCloseProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - MainSceneGateOpenProvider
@interface MainSceneGateOpenProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - MainSceneBirdsProvider
@interface MainSceneBirdsProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

