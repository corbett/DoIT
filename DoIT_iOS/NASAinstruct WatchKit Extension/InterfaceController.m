//
//  InterfaceController.m
//  NASAinstruct WatchKit Extension
//
//  Created by Christine Corbett Moran on 4/11/15.
//  Copyright (c) 2015 Corbett. All rights reserved.
//

#import "InterfaceController.h"
#import "DoITListRowType.h"

@interface InterfaceController()

@end


@implementation InterfaceController
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    NSLog(@"%@ awake with context", self);
    self.tutorialNames = @[@"step1", @"step2", @"step3", @"step4",@"highfive"];
    [self.table setNumberOfRows:self.tutorialNames.count withRowType:@"doITListRowType"];
    for (NSInteger i = 0; i < self.table.numberOfRows; i++) {
        DoITListRowType* row = (DoITListRowType*)[self.table rowControllerAtIndex:i];
        [row.rowDescription setText:(NSString*)[self.tutorialNames objectAtIndex:i ]];
        [row.rowIcon  setImageNamed:(NSString*)[self.tutorialNames objectAtIndex:i ]];
        
    }
 //   [self.tutorialNames enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {

        

}

-(IBAction)goToRootController:(id)sender {
    [self popToRootController];
    
}


- (instancetype) contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex{
    return [self.tutorialNames objectAtIndex:rowIndex]; // later hand more data
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



