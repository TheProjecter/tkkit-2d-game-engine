//
//  LogoSceneController.h
//  ChaosJow
//
//

#import <Foundation/Foundation.h>
#import "TKProvider.h"

#pragma mark - Default
@interface DefaultProvider : NSObject<TKSpriteProviderProtocol>
- (NSUInteger)spriteCount;
- (CGRect)spriteWithIndex:(NSUInteger)index;
@end


