//
//  TutorialStepInterfaceController.m
//  NASAinstruct
//
//  Created by Christine Corbett Moran on 4/11/15.
//  Copyright (c) 2015 Corbett. All rights reserved.
//

#import "TutorialStepInterfaceController.h"
#import <AVFoundation/AVFoundation.h>

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
    }
    AVSpeechUtterance *utterance = [AVSpeechUtterance
                                    speechUtteranceWithString:tutorialStep.instruction];
    AVSpeechSynthesizer *synth = [[AVSpeechSynthesizer alloc] init];
    [synth pauseSpeakingAtBoundary:AVSpeechBoundaryWord];
    [synth speakUtterance:utterance];
}

- (IBAction)goToNextTutorial:(id)sender  {
     _isSteppingForward=TRUE;
    if(![_tutorial isLastStep]) {
        
        [_tutorial stepForward];
       
        [self pushControllerWithName:@"tutorialStepInterfaceController" context:_tutorial];
    }
    else {
        [_tutorial reset];
        [self popToRootController];
    }
}


- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}


- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    if(!_isSteppingForward) {
        [_tutorial stepBack];
    }
    [super didDeactivate];
}

@end



