//
//  AudioManager.m
//  ChaosJow
//
//  Created by Tekka Xie on 12-5-24.
//

#import "AudioManager.h"

@implementation AudioManager

- (id)init
{
    if (self = [super init])
    {
        [super registSFXWithFileName:@"MainSceneGateSFX.wav"];
        [super registSFXWithFileName:@"MainSceneBirdsSFX.wav"];
        [super registSFXWithFileName:@"MainScenePianoSFX.wav"];
        [super registSFXWithFileName:@"MainSceneThunderSFX.wav"];
        [super registSFXWithFileName:@"GameSceneCupbreakSFX.wav"];
        [super registSFXWithFileName:@"GameSceneSlideSFX.wav"];
        [super registSFXWithFileName:@"GameScenePerfectSFX.wav"];
    }
    return self;
}

@end
