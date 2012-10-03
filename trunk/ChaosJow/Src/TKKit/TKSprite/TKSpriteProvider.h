//
//  TKSpriteManager.h
//  ChaosJow
//
//

#import <Foundation/Foundation.h>

@class TKSprite;

@interface TKSpriteProvider: NSObject
{
    NSMutableDictionary* spriteDictionary;
}
+ (id)sharedInstance;

- (void)addSprite:(TKSprite*)sprite withFileName:(NSString*)filename index:(NSUInteger)index;
- (void)removeSprite:(NSString*)filename index:(NSUInteger)index;

- (BOOL)hasSpriteBeenLoad:(NSString*)filename index:(NSUInteger)index;
- (TKSprite*)spriteWithFileName:(NSString*)filename index:(NSUInteger)index;
@end
