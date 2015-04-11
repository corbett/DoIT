//
//  TutorialStepInterfaceController.m
//  NASAinstruct
//
//  Created by Christine Corbett Moran on 4/11/15.
//  Copyright (c) 2015 Corbett. All rights reserved.
//

#import "TutorialStepInterfaceController.h"

@interface TutorialStepInterfaceController ()

@end

@implementation TutorialStepInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    NSString *imageName = (NSString*)context;
    
    [self.instructionImageButton setBackgroundImageNamed:imageName];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



