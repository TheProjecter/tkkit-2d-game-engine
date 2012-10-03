//
//  GameSceneProvider.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-28.
//

#import "GameSceneProvider.h"

#pragma mark - GameSceneBGCornerProvider
@implementation GameSceneBGCornerProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 0, 221,  204);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneBGCloudProvider
@implementation GameSceneBGCloudProvider
- (NSUInteger)spriteCount
{
    return 4;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 0, 480,  117);
        case 1:
            return CGRectMake( 0, 117, 480,  117);
        case 2:
            return CGRectMake( 0, 234, 480,  117);
        case 3:
            return CGRectMake( 0, 351, 480,  117);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneBGGrassProvider
@implementation GameSceneBGGrassProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 0, 51,  29);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneBGFenceProvider
@implementation GameSceneBGFenceProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 0, 14, 119);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneDayProvider
@implementation GameSceneDayProvider
- (NSUInteger)spriteCount
{
    return 8;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 0, 41, 28);
        case 1:
            return CGRectMake(41, 0, 18, 28);
        case 2:
            return CGRectMake(62, 0, 18, 28);
        case 3:
            return CGRectMake(82, 0, 18, 28);
        case 4:
            return CGRectMake(101, 0, 18, 28);
        case 5:
            return CGRectMake(121, 0, 18, 28);
        case 6:
            return CGRectMake(142, 0, 18, 28);
        case 7:
            return CGRectMake(162, 0, 18, 28);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneDayNightProvider
@implementation GameSceneDayNightProvider
- (NSUInteger)spriteCount
{
    return 2;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 2, 4, 40, 38);
        case 1:
            return CGRectMake(44, 1, 44, 42);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneDeskNormalProvider
@implementation GameSceneDeskNormalProvider
- (NSUInteger)spriteCount
{
    return 4;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 8, 277, 60);
        case 1:
            return CGRectMake(0, 99, 285, 61);
        case 2:
            return CGRectMake(0, 175, 300, 77);
        case 3:
            return CGRectMake(0, 264, 322, 84);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneDeskHighlightProvider
@implementation GameSceneDeskHighlightProvider
- (NSUInteger)spriteCount
{
    return 4;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 8, 277, 60);
        case 1:
            return CGRectMake(0, 99, 285, 61);
        case 2:
            return CGRectMake(0, 175, 300, 77);
        case 3:
            return CGRectMake(0, 264, 322, 84);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneDialogProvider
@implementation GameSceneDialogProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 0, 283, 171);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneBlackFogProvider
@implementation GameSceneBlackFogProvider
- (NSUInteger)spriteCount
{
    return 20;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 7, 13, 90, 124);
        case 1:
            return CGRectMake(126, 13, 90, 124);
        case 2:
            return CGRectMake(243, 13, 90, 124);
        case 3:
            return CGRectMake(359, 13, 93, 124);
        case 4:
            return CGRectMake(477, 12, 94, 126);
        case 5:
            return CGRectMake(595, 13, 95, 126);
        case 6:
            return CGRectMake(711, 18, 98, 122);
        case 7:
            return CGRectMake(829, 16, 97, 126);
        case 8:
            return CGRectMake(4, 165, 96, 129);
        case 9:
            return CGRectMake(118, 163, 101, 129);
        case 10:
            return CGRectMake(240, 165, 98, 129);
        case 11:
            return CGRectMake(356, 166, 102, 125);
        case 12:
            return CGRectMake(474, 167, 102, 124);
        case 13:
            return CGRectMake(590, 166, 104, 125);
        case 14:
            return CGRectMake(712, 167, 99, 124);
        case 15:
            return CGRectMake(829, 168, 101, 123);
        case 16:
            return CGRectMake( 4, 322, 100, 118);
        case 17:
            return CGRectMake(121, 322, 102, 118);
        case 18:
            return CGRectMake(242, 324, 97, 118);
        case 19:
            return CGRectMake(358, 323, 100, 118);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneGameOverProvider
@implementation GameSceneGameOverProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 0, 351, 146);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneKeeperDeadProvider
@implementation GameSceneKeeperDeadProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 0, 99, 124);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneKeeperProvider
@implementation GameSceneKeeperProvider
- (NSUInteger)spriteCount
{
    return 6;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 6, 3, 86, 119);
        case 1:
            return CGRectMake(105, 4, 86, 117);
        case 2:
            return CGRectMake(207, 4, 82, 116);
        case 3:
            return CGRectMake(6, 127, 86, 120);
        case 4:
            return CGRectMake(110, 130, 84, 116);
        case 5:
            return CGRectMake(207, 130, 85, 114);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneCupNormalProvider
@implementation GameSceneCupNormalProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 0, 28, 49);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneCupPerfectProvider
@implementation GameSceneCupPerfectProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 0, 59, 52);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneCupQuickProvider
@implementation GameSceneCupQuickProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 0, 50, 49);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneSlidePerfectProvider
@implementation GameSceneSlidePerfectProvider
- (NSUInteger)spriteCount
{
    return 3;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 38, 304, 121);
        case 1:
            return CGRectMake( 0, 246, 304, 116);
        case 2:
            return CGRectMake( 0, 434, 304, 114);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneDayToNightProvider
@implementation GameSceneDayToNightProvider
- (NSUInteger)spriteCount
{
    return 11;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 7, 3, 43, 40);
        case 1:
            return CGRectMake( 65, 3, 44, 40);
        case 2:
            return CGRectMake( 123, 3, 43, 40);
        case 3:
            return CGRectMake( 184, 3, 37, 40);
        case 4:
            return CGRectMake( 18, 51, 22, 40);
        case 5:
            return CGRectMake( 77, 53, 20, 38);
        case 6:
            return CGRectMake( 129, 53, 32, 38);
        case 7:
            return CGRectMake( 184, 53, 38, 38);
        case 8:
            return CGRectMake( 10, 101, 38, 38);
        case 9:
            return CGRectMake( 68, 101, 38, 38);
        case 10:
            return CGRectMake( 126, 101, 38, 38);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneNightToDayProvider
@implementation GameSceneNightToDayProvider
- (NSUInteger)spriteCount
{
    return 12;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 10, 5, 38, 38);
        case 1:
            return CGRectMake( 68, 5, 37, 38);
        case 2:
            return CGRectMake( 129, 5, 32, 38);
        case 3:
            return CGRectMake( 190, 5, 26, 38);
        case 4:
            return CGRectMake( 21, 53, 16, 38);
        case 5:
            return CGRectMake( 83, 51, 7, 40);
        case 6:
            return CGRectMake( 141, 52, 7, 39);
        case 7:
            return CGRectMake( 194, 51, 18, 40);
        case 8:
            return CGRectMake( 14, 99, 29, 40);
        case 9:
            return CGRectMake( 68, 99, 37, 40);
        case 10:
            return CGRectMake( 124, 99, 42, 40);
        case 11:
            return CGRectMake( 181, 99, 44, 40);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneCupEmptyProvider
@implementation GameSceneCupEmptyProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 0, 25, 28);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

#pragma mark - GameSceneNoCupProvider
@implementation GameSceneNoCupProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake( 0, 0, 55, 66);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end

