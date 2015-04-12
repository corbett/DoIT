//
//  InterfaceController.m
//  NASAinstruct WatchKit Extension
//
//  Created by Christine Corbett Moran on 4/11/15.
//  Copyright (c) 2015 Corbett. All rights reserved.
//

#import "InterfaceController.h"
#import "DoITListRowType.h"
#import "Tutorial.h"
#import "TutorialStep.h"

@interface InterfaceController()

@end


@implementation InterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    NSLog(@"%@ awake with context", self);
    self.tutorials = @[[[Tutorial alloc] initWithName:@"assembling IKEA" andSteps:@[
                                [[TutorialStep alloc] initWithTitle:@"Remove film" withImage:[UIImage imageNamed:@"step1"] withInstruction:@"Remove the protective film on the back and edge of the door or drawer front before mounting/assembly." withTimeInSeconds:[NSNumber numberWithInt:50]],
                                [[TutorialStep alloc] initWithTitle:@"Fit the hinges" withImage:[UIImage imageNamed:@"step2"] withInstruction:@"Assemble the drawer and fit the hinges."  withTimeInSeconds:[NSNumber numberWithInt:200]],
                                [[TutorialStep alloc] initWithTitle:@"Cure the surface" withImage:[UIImage imageNamed:@"step3"] withInstruction:@"Immediately after having removed the protective film the surface is especially sensitive to scratches. You can increase the surface’s resistance to scratches by curing it."  withTimeInSeconds:[NSNumber numberWithInt:0]],
                                [[TutorialStep alloc] initWithTitle:@"Soft cloth wash" withImage:[UIImage imageNamed:@"step4"] withInstruction:@"Wash it with a soft cloth, using a mild soap solution (max. 1%). Note! Do not use any cleaners containing alcohol or abrasives."  withTimeInSeconds:[NSNumber numberWithInt:25]],
                                [[TutorialStep alloc] initWithTitle:@"You are done" withImage:[UIImage imageNamed:@"highfive"] withInstruction:@"Super awesome job. Any comments?"  withTimeInSeconds:[NSNumber numberWithInt:0]]]],
                       [[Tutorial alloc] initWithName:@"ISS biology" andSteps:@[
                          [[TutorialStep alloc] initWithTitle:@"Remove film" withImage:[UIImage imageNamed:@"plantstep1"] withInstruction:@"Cut single plant specimen from the bottom with scissors." withTimeInSeconds:[NSNumber numberWithInt:15]],
                          [[TutorialStep alloc] initWithTitle:@"Fit the hinges" withImage:[UIImage imageNamed:@"plantstep2"] withInstruction:@"Place plant specimen in special bottle with the appropriate liquids. Note: Be careful to have a firm grip on the plant stem, as the plant tends to want to float away out of the bottle."  withTimeInSeconds:[NSNumber numberWithInt:45]],
                          [[TutorialStep alloc] initWithTitle:@"Cure the surface" withImage:[UIImage imageNamed:@"plantstep3"] withInstruction:@"Attach tube with specimen and liquids  on the wall and secure with velcro."  withTimeInSeconds:[NSNumber numberWithInt:360]],
                          [[TutorialStep alloc] initWithTitle:@"You are done" withImage:[UIImage imageNamed:@"highfive"] withInstruction:@"Super awesome job. Any comments?"  withTimeInSeconds:[NSNumber numberWithInt:0]]]],
                       [[Tutorial alloc] initWithName:@"ISS repairs" andSteps:@[]],
                       [[Tutorial alloc] initWithName:@"ISS gardening" andSteps:@[]],
                       [[Tutorial alloc] initWithName:@"ISS chemistry" andSteps:@[]],

                       ];

    [self.table setNumberOfRows:self.tutorials.count withRowType:@"doITListRowType"];
    [self.tutorials enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Tutorial* tutorial = (Tutorial*)obj;
        DoITListRowType* row = (DoITListRowType*)[self.table rowControllerAtIndex:idx];
        [row.rowDescription setText:tutorial.name];
        row.rowIcon = nil;
        [row.group setBackgroundImageNamed:tutorial.name];
        //[row.rowIcon setImageNamed:tutorial.name];
    }];

}

-(IBAction)goToRootController:(id)sender {
    [self popToRootController];
    
}


- (instancetype) contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex{
    return [self.tutorials objectAtIndex:rowIndex]; // later hand more data
}


- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    for(Tutorial* tut in self.tutorials) {
        [tut reset];
    }
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



