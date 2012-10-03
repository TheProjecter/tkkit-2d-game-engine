//
//  MainDirector.h
//  ChaosJow
//
//

#import <Foundation/Foundation.h>
#import "TKDirector.h"

@interface MainDirector : TKDirector

+ (MainDirector*)sharedInstance;

#pragma mark - init
- (id)initWithViewController:(UIViewController*)mainViewController;

#pragma mark - control game
- (void)loadGameResource;
- (void)startPlay;

@end
