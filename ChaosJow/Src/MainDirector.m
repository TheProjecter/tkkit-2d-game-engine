//
//  MainDirector.m
//  ChaosJow
//
//

#import "MainDirector.h"
#import "LogoSceneController.h"
#import "TKSegue.h"
#import "MainSceneController.h"
#import "AudioManager.h"
#import "GameSceneController.h"

@implementation MainDirector

static MainDirector* pInstance;
+ (MainDirector*)sharedInstance
{
    if (pInstance == nil)
        pInstance = [[MainDirector alloc] init];
    
    return pInstance;
}

#pragma mark - init
- (id)initWithViewController:(UIViewController*)mainViewController
{
    if (self = [super initWithViewController:mainViewController])
    {
        
    }
    return self;
}

#pragma mark - control game
- (void)loadGameResource
{
    super.audioManager = [[AudioManager alloc] init];
    
    super.sceneController = [[LogoSceneController alloc] initWithDirector:self];
    //super.sceneController = [[MainSceneController alloc] initWithDirector:self];
    //super.sceneController = [[GameSceneController alloc] initWithDirector:self];
  
    // Logo -> Main
    TKSegue* segue = [[TKSegue alloc] initWithIdentifier:@"SegueToMainScene" withDirector:self withDestination:@"MainSceneController"];
    segue.easeInDelay = 2.0;
    [super addSegue:segue];
    [super performSegueWithIdentifier:@"SegueToMainScene" delay:1.0];
    
    // Main -> Game
    segue = [[TKSegue alloc] initWithIdentifier:@"SegueToGameScene" withDirector:self withDestination:@"GameSceneController"];
    [super addSegue:segue];
}
- (void)startPlay
{
}

@end
