//
//  Tutorial.h
//  NASAinstruct
//
//  Created by Christine Corbett Moran on 4/11/15.
//  Copyright (c) 2015 Corbett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TutorialStep.h"
@interface Tutorial : NSObject
@property (nonatomic,retain) NSString* name;
@property (nonatomic,retain) NSArray* tutorialSteps;
@property (nonatomic) int onStep;

-(instancetype)initWithName:(NSString*)name andSteps:(NSArray*)tutorialSteps;
-(TutorialStep*) getCurrentStep;
@end
