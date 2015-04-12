//
//  TutorialStepInterfaceController.h
//  NASAinstruct
//
//  Created by Christine Corbett Moran on 4/11/15.
//  Copyright (c) 2015 Corbett. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "Tutorial.h"
@interface TutorialStepInterfaceController : WKInterfaceController
@property (nonatomic,weak) Tutorial *tutorial;
@property (nonatomic) BOOL isSteppingForward;
@property (nonatomic,strong) IBOutlet WKInterfaceButton* instructionImageButton;
@property (nonatomic,strong) IBOutlet WKInterfaceLabel* instructionTitle;
@property (nonatomic,strong) IBOutlet WKInterfaceLabel* instructionText;
@property (nonatomic,strong) IBOutlet WKInterfaceLabel* instructionStep;
@property (nonatomic,strong) AVSpeechSynthesizer *synth;

- (IBAction)goToNextTutorial:(id)sender;

@end
