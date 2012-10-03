//
//  MainSceneController.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-8.
//

#import "MainSceneSpriteProvider.h"

#pragma mark - MainSceneMenuProvider
@implementation MainSceneMenuProvider
- (NSUInteger)spriteCount
{
    return 8;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake(  0,   0, 145,  19);
        case 1:
            return CGRectMake(152,   0, 145,  19);
        case 2:
            return CGRectMake(  0,  19, 149,  20);
        case 3:
            return CGRectMake(151,  19, 149,  20);
        case 4:
            return CGRectMake( 19,  39,  99,  21);
        case 5:
            return CGRectMake(171,  39,  99,  21);
        case 6:
            return CGRectMake( 30,  60,  80,  20);
        case 7:
            return CGRectMake(182,  60,  80,  20); 
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - MainSceneCloudOutProvider
@implementation MainSceneCloudOutProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake(0, 0, 190, 190);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - MainSceneCloudInProvider
@implementation MainSceneCloudInProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake(0, 0, 190, 190);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - MainSceneTitleProvider
@implementation MainSceneTitleProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake(0, 0, 480, 320);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - MainSceneHouseProvider
@implementation MainSceneHouseProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake(0, 0, 480, 320);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - MainSceneBackgroundProvider
@implementation MainSceneBackgroundProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake(0, 0, 480, 320);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - MainSceneGateCloseProvider
@implementation MainSceneGateCloseProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake(0, 0, 480, 320);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - MainSceneGateOpenProvider
@implementation MainSceneGateOpenProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake(0, 0, 480, 320);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - MainSceneBirdsProvider
@implementation MainSceneBirdsProvider
- (NSUInteger)spriteCount
{
    return 10;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake(23, 19, 36, 49);
        case 1:
            return CGRectMake(92, 20, 34, 48);
        case 2:
            return CGRectMake(168, 16, 46, 50);
        case 3:
            return CGRectMake(225, 14, 59, 51);
        case 4:
            return CGRectMake(311, 11, 43, 47);
        case 5:
            return CGRectMake(386, 28, 32, 33);
        case 6:
            return CGRectMake(22, 97, 32, 33);
        case 7:
            return CGRectMake(86, 80, 43, 48);
        case 8:
            return CGRectMake(154, 93, 60, 20);
        case 9:
            return CGRectMake(233, 93, 55, 17);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end


