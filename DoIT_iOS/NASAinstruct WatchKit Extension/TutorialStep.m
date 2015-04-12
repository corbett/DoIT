//
//  TutorialStep.m
//  NASAinstruct
//
//  Created by Christine Corbett Moran on 4/11/15.
//  Copyright (c) 2015 Corbett. All rights reserved.
//

#import "TutorialStep.h"

@implementation TutorialStep

-(instancetype)initWithTitle:(NSString*)title withImage:(UIImage*)image withInstruction:(NSString*)instruction withTimeInSeconds:(NSNumber*)timeInSeconds {
    self = [super init];
    if(self) {
        _title = title;
        _image = [image copy];
        _instruction = instruction;
        _timeInSeconds = timeInSeconds;
    }
    return self;
}

@end
