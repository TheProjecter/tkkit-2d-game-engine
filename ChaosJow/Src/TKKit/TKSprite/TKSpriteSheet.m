//
//  TKSpriteSheet.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-7.
//

#import "TKSpriteSheet.h"

@implementation TKSpriteSheet

- (void)addSprite:(TKSprite*)sprite
{
    [spriteArray addObject:sprite];
}

- (void)deleteSprite:(TKSprite*)sprite
{
    [spriteArray delete:sprite];
}

@end
