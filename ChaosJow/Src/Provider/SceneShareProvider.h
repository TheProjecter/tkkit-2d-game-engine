//
//  SceneShareProvider.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-25.
//

#import <Foundation/Foundation.h>
#import "TKProvider.h"

#pragma mark - SceneShareMenusProvider
@interface SceneShareMenusProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end