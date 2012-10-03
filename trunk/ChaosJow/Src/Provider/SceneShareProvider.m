//
//  SceneShareProvider.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-25.
//

#import "SceneShareProvider.h"

#pragma mark - MainSceneMenuProvider
@implementation SceneShareMenusProvider
- (NSUInteger)spriteCount
{
    return 8;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            //Mark
            return CGRectMake( 4,   0, 68,  24);
        case 1:
            return CGRectMake(92,   0, 68,  24);
        case 2:
            // tips
            return CGRectMake( 5,  24, 54,  25);
        case 3:
            return CGRectMake(92,  24, 54,  25);
        case 4:
            // sound
            return CGRectMake( 1,  48, 63,  28);
        case 5:
            return CGRectMake(89,  48, 63,  28);
        case 6:
            // skeleton menu
            return CGRectMake( 0,  77,  27,  27);
        case 7:
            return CGRectMake(27,  77,  27,  27);
        case 8:
            // eye menu
            return CGRectMake(54, 77, 27, 27);
        case 9:
            return CGRectMake(81, 77, 27, 27);
        case 10:
            // mouse menu
            return CGRectMake(108, 77, 27, 27);
        case 11:
            return CGRectMake(135, 77, 27, 27);
        case 12:
            // nike menu
            return CGRectMake(0, 104, 27, 27);
        case 13:
            return CGRectMake(27, 104, 27, 27);
        case 14:
            // cross menu
            return CGRectMake(54, 104, 27, 27);
        case 15:
            return CGRectMake(81, 104, 27, 27);
        case 16:
            // mountain menu
            return CGRectMake(108, 104, 27, 27);
        case 17:
            return CGRectMake(135, 104, 27, 27);
        case 18:
            // bat
            return CGRectMake(12, 132, 19, 33);
        case 19:
            return CGRectMake(46, 132, 29, 31);
        case 20:
            return CGRectMake(7, 186, 30, 33);
        case 21:
            return CGRectMake(52, 166, 29, 34);
        case 22:
            return CGRectMake(88, 166, 29, 35);
        case 23:
            return CGRectMake(132, 186, 30, 33);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end