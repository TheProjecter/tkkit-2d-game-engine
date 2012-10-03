//
//  TKSpriteSheet.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import <Foundation/Foundation.h>

@class TKSprite;

@interface TKSpriteSheet : NSObject
{
    NSMutableArray* spriteArray;
}

- (void)addSprite:(TKSprite*)sprite;
- (void)deleteSprite:(TKSprite*)sprite;

@end
