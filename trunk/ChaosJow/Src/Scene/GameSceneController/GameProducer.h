//
//  GameProducer.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-28.
//

#import <Foundation/Foundation.h>
#import "TKAnimation.h"

@class TKSpriteNode;

@interface GameProducer : NSObject

+ (TKSpriteNode*)spriteNodeWithIndex:(NSInteger)index;

+ (TKSpriteNode*)spriteNodeOfActionCup:(NSInteger)category;

@end
