//
//  CharacterProvider.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-30.
//

#import <Foundation/Foundation.h>
#import "TKProvider.h"

#pragma mark - GameSceneBigbossDrinkProvider
@interface GameSceneBigbossDrinkProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneBigbossForwardProvider
@interface GameSceneBigbossForwardProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end

#pragma mark - GameSceneBigbossUpProvider
@interface GameSceneBigbossUpProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end