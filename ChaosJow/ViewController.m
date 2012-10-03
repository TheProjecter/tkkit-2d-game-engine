//
//  ViewController.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-3.
//

#import "ViewController.h"
#import "MainDirector.h"

#pragma mark - implementation
@implementation ViewController

#pragma mark - other
- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc. that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationLandscapeRight
        || interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        return YES;
    
    return NO;
}

#pragma mark - initialize
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    super.director = [[MainDirector alloc] initWithViewController:self];
    [super.director startPlay];
}

#pragma mark - loop
- (void)update:(NSTimeInterval)timeSinceLastUpdate
{
    [super.director update:timeSinceLastUpdate];
}
- (void)render
{
    [super.director render];
}

@end
