//
//  TKSpriteManager.m
//  ChaosJow
//
//

#import "TKSpriteProvider.h"

#pragma mark - TKSpriteWrapper
@interface TKSpriteWrapper : NSObject 
@property(weak, nonatomic) TKSprite* sprite;
@end

@implementation TKSpriteWrapper
@synthesize sprite;
@end

#pragma mark - TKSpriteProvider
@implementation TKSpriteProvider

static TKSpriteProvider* pInstance;
+ (id)sharedInstance
{
    if (pInstance == nil)
        pInstance = [[TKSpriteProvider alloc] init];
    
    return pInstance;
}

- (void)addSprite:(TKSprite*)sprite withFileName:(NSString*)filename index:(NSUInteger)index
{
    NSString* keyText = [filename stringByAppendingFormat:@"%d", index];
    
    TKSpriteWrapper* spriteWrapper = [spriteDictionary objectForKey:keyText];
    if (spriteWrapper == nil)
    {
        spriteWrapper = [[TKSpriteWrapper alloc] init];
    }
    spriteWrapper.sprite = sprite;
    
    [spriteDictionary setObject:spriteWrapper forKey:keyText];
}

- (void)removeSprite:(NSString*)filename index:(NSUInteger)index
{
    NSString* keyText = [filename stringByAppendingFormat:@"%d", index];
    
    [spriteDictionary removeObjectForKey:keyText];
}

- (BOOL)hasSpriteBeenLoad:(NSString*)filename index:(NSUInteger)index
{
    NSString* keyText = [filename stringByAppendingFormat:@"%d", index];
    
    TKSpriteWrapper* spriteWrapper = [spriteDictionary objectForKey:keyText];
    return spriteWrapper.sprite != nil;
}

- (TKSprite*)spriteWithFileName:(NSString*)filename index:(NSUInteger)index
{
    NSString* keyText = [filename stringByAppendingFormat:@"%d", index];
    
    TKSpriteWrapper* spriteWrapper = [spriteDictionary objectForKey:keyText];
    return spriteWrapper.sprite;
}

@end
