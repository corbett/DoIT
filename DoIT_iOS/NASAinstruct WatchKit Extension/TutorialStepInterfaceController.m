//
//  TutorialStepInterfaceController.m
//  NASAinstruct
//
//  Created by Christine Corbett Moran on 4/11/15.
//  Copyright (c) 2015 Corbett. All rights reserved.
//

#import "TutorialStepInterfaceController.h"
#import "Tutorial.h"
#import "TutorialStep.h"
@interface TutorialStepInterfaceController ()
@end

@implementation TutorialStepInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    _tutorial = (Tutorial*)context;
    _isSteppingForward=FALSE;
    

    TutorialStep *tutorialStep = [_tutorial getCurrentStep];
    [self.instructionImageButton setBackgroundImage:tutorialStep.image];
    [self.instructionTitle setText:tutorialStep.title];
    if(![_tutorial isLastStep]) {

        [self.instructionStep setText:[NSString stringWithFormat:@"%d/%d",[_tutorial onStep]+1,[_tutorial getTotalSteps]-1]];
    }
    else {
        [self.instructionStep setHidden:YES];
        [_instructionTime setHidden:YES];
    }
    
    if([tutorialStep.timeInSeconds doubleValue] > 0) {
        [_instructionTime setDate:[NSDate dateWithTimeIntervalSinceNow:[tutorialStep.timeInSeconds doubleValue]]];
        [_instructionTime start];
        
    }
    else {
        [_instructionTime setHidden:YES];
    }
    
    [WKInterfaceController openParentApplication:@{@"tutorialStepInstruction":[[_tutorial getCurrentStep] instruction]} reply:nil];

    _synth = [[AVSpeechSynthesizer alloc] init];
    _synth.delegate = self;
    
    _utterance = [AVSpeechUtterance speechUtteranceWithString:tutorialStep.instruction];
    [_utterance setRate:0.2];
    [_synth speakUtterance:_utterance];
    [_playPauseButton setBackgroundImageNamed:@"pause"];
}

- (IBAction)goToNextTutorial:(id)sender  {
     _isSteppingForward=TRUE;
    [_synth stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    [_playPauseButton setBackgroundImageNamed:@"play"];
    [_instructionTime stop];
    [_instructionTime setDate:[NSDate dateWithTimeIntervalSinceNow:[[_tutorial getCurrentStep].timeInSeconds doubleValue]]];
    if(![_tutorial isLastStep]) {
        [_tutorial stepForward];
        [WKInterfaceController openParentApplication:@{@"tutorialStepInstruction":[[_tutorial getCurrentStep] instruction]} reply:nil];
        [self pushControllerWithName:@"tutorialStepInterfaceController" context:_tutorial];
    }
    else {
        [_tutorial reset];
        [self popToRootController];
    }
}


- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [_instructionTime start];

    [super willActivate];
}

-(IBAction)playPauseOrUnpause:(id)sender {
    if(_synth.isPaused) {
        [_synth continueSpeaking];
    }
    else if(_synth.isSpeaking) {
        [_synth pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
    else {
        [_synth speakUtterance:_utterance];
    }
}


- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    [_playPauseButton setBackgroundImageNamed:@"play"];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer
  didPauseSpeechUtterance:(AVSpeechUtterance *)utterance {
     [_playPauseButton setBackgroundImageNamed:@"play"];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance {
    [_playPauseButton setBackgroundImageNamed:@"pause"];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {
    [_playPauseButton setBackgroundImageNamed:@"pause"];
}


- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [_synth stopSpeakingAtBoundary:AVSpeechBoundaryWord];
    [_instructionTime stop];
    [_instructionTime setDate:[NSDate dateWithTimeIntervalSinceNow:[[_tutorial getCurrentStep].timeInSeconds doubleValue]]];
    if(!_isSteppingForward) {
        [_tutorial stepBack];
    }
    [super didDeactivate];
}

@end



