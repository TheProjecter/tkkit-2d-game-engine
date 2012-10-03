//
//  TKViewController.m
//  ChaosJow
//
//

#import "TKViewController.h"
#import "ES2Renderer.h"
#import "TKDirector.h"
#include <sys/time.h>

@implementation TKViewController

@synthesize animating;
@dynamic    animationFrameInterval;
@synthesize displayLink;
@synthesize director;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        renderer = [[ES2Renderer alloc] init];
		if (!renderer)
            return nil;
        
        displayLink = nil;
        animating = FALSE;
		animationFrameInterval = 1;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - operation
- (void) startAnimation
{
	if (!animating)
	{	
        displayLink = [NSClassFromString(@"CADisplayLink") displayLinkWithTarget:self selector:@selector(drawView:)];
        [displayLink setFrameInterval:animationFrameInterval];
        [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
		
		animating = TRUE;
	}
}

- (void)stopAnimation
{
	if (animating)
	{
        [displayLink invalidate];
        displayLink = nil;
		
		animating = FALSE;
	}
}

#pragma mark - property
- (NSInteger) animationFrameInterval
{
	return animationFrameInterval;
}

- (void) setAnimationFrameInterval:(NSInteger)frameInterval
{
	if (frameInterval >= 1)
	{
		animationFrameInterval = frameInterval;
		
		if (animating)
		{
			[self stopAnimation];
			[self startAnimation];
		}
	}
}

- (void)viewDidLayoutSubviews
{
    [renderer resizeFromLayer:(CAEAGLLayer*)self.view.layer];
    [self drawView:nil];
}

#pragma mark - loop
- (void) drawView:(id)sender
{
    [self update:[self updateDeltaTime]];
    [self render];
    
    [renderer render];
}

- (void)update:(NSTimeInterval)timeSinceLastUpdate
{
    
}
- (void)render
{
}

#pragma mark - tool
- (NSTimeInterval)updateDeltaTime
{
    static NSTimeInterval lastTime = 0;
    
    NSTimeInterval diffTime= displayLink.timestamp - lastTime;
	lastTime = displayLink.timestamp;
    
	return diffTime;
}

#pragma mark - touches
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{    
    [director touchesBegan:touches withEvent:event];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [director touchesMoved:touches withEvent:event];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [director touchesCancelled:touches withEvent:event];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [director touchesEnded:touches withEvent:event];
}
@end
