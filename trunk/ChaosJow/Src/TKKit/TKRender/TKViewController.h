//
//  TKViewController.h
//  ChaosJow
//
//

#import <UIKit/UIKit.h>
#import "ESRenderer.h"

@class TKDirector;

@interface TKViewController : UIViewController
{
    BOOL animating;
	NSInteger animationFrameInterval;
    id <ESRenderer> renderer;	
}

@property(readonly, nonatomic, getter=isAnimating) BOOL animating;
@property(assign, nonatomic) NSInteger      animationFrameInterval;
@property(strong, nonatomic) CADisplayLink* displayLink;
@property(strong, nonatomic) TKDirector*    director;

#pragma mark - operation
- (void) startAnimation;
- (void) stopAnimation;

#pragma mark - loop
- (void)drawView:(id)sender;
- (void)update:(NSTimeInterval)timeSinceLastUpdate;
- (void)render;

#pragma mark - tool
- (NSTimeInterval)updateDeltaTime;

@end
