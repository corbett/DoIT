//
//  InterfaceController.h
//  NASAinstruct WatchKit Extension
//
//  Created by Christine Corbett Moran on 4/11/15.
//  Copyright (c) 2015 Corbett. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (nonatomic,strong) NSArray* tutorials;
@property (nonatomic,weak) IBOutlet WKInterfaceTable *table;
-(IBAction)goToRootController:(id)sender ;
@end
