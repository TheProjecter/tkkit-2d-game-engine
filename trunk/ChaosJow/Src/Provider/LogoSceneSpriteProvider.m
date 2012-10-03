//
//  LogoSceneController.m
//  ChaosJow
//
//

#import "LogoSceneSpriteProvider.h"

#pragma mark - DefaultProvider
@implementation DefaultProvider
- (NSUInteger)spriteCount
{
    return 1;
}
- (CGRect)spriteWithIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
            return CGRectMake(0, 0, 320, 480);
        default:
            break;
    }
    return CGRectMake(0, 0, 0, 0);
}
@end