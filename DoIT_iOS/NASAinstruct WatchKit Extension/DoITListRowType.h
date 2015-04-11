//
//  DoITListRowType.h
//  NASAinstruct
//
//  Created by Christine Corbett Moran on 4/11/15.
//  Copyright (c) 2015 Corbett. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface DoITListRowType : NSObject
@property (weak, nonatomic) IBOutlet WKInterfaceLabel* rowDescription;
@property (weak, nonatomic) IBOutlet WKInterfaceImage* rowIcon;
@end
