//
//  CharacterProducer.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-30.
//

#import "CharacterProducer.h"
#import "TKSpriteNode.h"

@interface CharacterProducer ()
@end

@implementation CharacterProducer

+ (TKSpriteNode*)spriteNodeOfBigbossDrink:(NSInteger)index
{
    TKSpriteNode* spriteNode = [[TKSpriteNode alloc] initWithImage:@"Character_Bigboss_Forward.png" index:index];
//    spriteNode.center = CGPointMake(240, 240);
    
    return spriteNode;
}

@end
