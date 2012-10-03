//
//  GameSceneProvider.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-28.
//

#import <Foundation/Foundation.h>
#import "TKProvider.h"

#pragma mark - GameSceneBGCornerProvider
@interface GameSceneBGCornerProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneBGCloudProvider
@interface GameSceneBGCloudProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneBGGrassProvider
@interface GameSceneBGGrassProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneBGFenceProvider
@interface GameSceneBGFenceProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneDayProvider
@interface GameSceneDayProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneDayNightProvider
@interface GameSceneDayNightProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneDeskNormalProvider
@interface GameSceneDeskNormalProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneDeskHighlightProvider
@interface GameSceneDeskHighlightProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneDialogProvider
@interface GameSceneDialogProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneBlackFogProvider
@interface GameSceneBlackFogProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneGameOverProvider
@interface GameSceneGameOverProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneKeeperDeadProvider
@interface GameSceneKeeperDeadProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneKeeperProvider
@interface GameSceneKeeperProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneCupNormalProvider
@interface GameSceneCupNormalProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneCupPerfectProvider
@interface GameSceneCupPerfectProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneCupQuickProvider
@interface GameSceneCupQuickProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneSlidePerfectProvider
@interface GameSceneSlidePerfectProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneDayToNightProvider
@interface GameSceneDayToNightProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneNightToDayProvider
@interface GameSceneNightToDayProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneCupEmptyProvider
@interface GameSceneCupEmptyProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneNoCupProvider
@interface GameSceneNoCupProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end
