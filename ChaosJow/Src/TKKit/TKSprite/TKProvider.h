//
//  TKBaseProvider.h
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-15.
//

#import <Foundation/Foundation.h>

@protocol TKSpriteProviderProtocol
-(NSUInteger)spriteCount;
-(CGRect)spriteWithIndex:(NSUInteger)index;
@end
