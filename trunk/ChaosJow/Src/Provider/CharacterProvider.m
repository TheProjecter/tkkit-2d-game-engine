//
//  CharacterProvider.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-30.
//

#import "CharacterProvider.h"

#pragma mark - GameSceneBigbossDrinkProvider
@implementation GameSceneBigbossDrinkProvider
- (NSUInteger)spriteCount
{
    return 16;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 7, 47, 175, 187);
        case 1:
            return CGRectMake( 243, 47, 170, 183);
        case 2:
            return CGRectMake( 505, 46, 143, 184);
        case 3:
            return CGRectMake( 708, 27, 135, 202);
        case 4:
            return CGRectMake( 48, 257, 125, 212);
        case 5:
            return CGRectMake( 262, 253, 131, 215);
        case 6:
            return CGRectMake( 481, 253, 131, 215);
        case 7:
            return CGRectMake( 703, 257, 125, 212);
        case 8:
            return CGRectMake( 56, 503, 139, 204);
        case 9:
            return CGRectMake( 282, 523, 148, 184);
        case 10:
            return CGRectMake( 509, 523, 143, 184);
        case 11:
            return CGRectMake( 711, 524, 152, 183);
        case 12:
            return CGRectMake( 45, 763, 158, 182);
        case 13:
            return CGRectMake( 263, 762, 158, 184);
        case 14:
            return CGRectMake( 482, 762, 158, 184);
        case 15:
            return CGRectMake( 700, 761, 158, 185);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneBigbossForwardProvider
@implementation GameSceneBigbossForwardProvider
- (NSUInteger)spriteCount
{
    return 15;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 2, 7, 158, 183);
        case 1:
            return CGRectMake( 168, 7, 158, 183);
        case 2:
            return CGRectMake( 334, 7, 158, 183);
        case 3:
            return CGRectMake( 500, 7, 158, 183);
        case 4:
            return CGRectMake( 666, 7, 158, 184);
        case 5:
            return CGRectMake( 831, 8, 160, 184);
        case 6:
            return CGRectMake( 2, 206, 158, 184);
        case 7:
            return CGRectMake( 168, 206, 158, 184);
        case 8:
            return CGRectMake( 334, 206, 158, 185);
        case 9:
            return CGRectMake( 500, 206, 158, 184);
        case 10:
            return CGRectMake( 666, 205, 158, 184);
        case 11:
            return CGRectMake( 832, 205, 158, 183);
        case 12:
            return CGRectMake( 2, 403, 158, 184);
        case 13:
            return CGRectMake( 168, 402, 158, 189);
        case 14:
            return CGRectMake( 334, 402, 158, 185);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneBigbossUpProvider
@implementation GameSceneBigbossUpProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 0, 62, 83);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end
