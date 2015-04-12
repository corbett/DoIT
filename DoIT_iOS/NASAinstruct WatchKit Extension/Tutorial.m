//
//  Tutorial.m
//  NASAinstruct
//
//  Created by Christine Corbett Moran on 4/11/15.
//  Copyright (c) 2015 Corbett. All rights reserved.
//

#import "Tutorial.h"
#import "TutorialStep.h"
@implementation Tutorial

-(instancetype)initWithName:(NSString*)name andSteps:(NSArray*)tutorialSteps {
    self = [super init];
    if(self) {
        _name = name;
        _tutorialSteps = tutorialSteps;
        _onStep = 0;
    }
    return self;
}

-(TutorialStep*) getCurrentStep {
    return [_tutorialSteps objectAtIndex:_onStep];
}

-(void) stepForward {
    _onStep = MIN(_onStep+1, (int)[_tutorialSteps count]);
}

-(void) stepBack {
    _onStep = MAX(_onStep-1, 0);
}

-(BOOL) isLastStep {
    return (_onStep == [_tutorialSteps count] -1);
}

-(void)reset {
    _onStep = 0;
}

-(int) getTotalSteps {
    return (int)[_tutorialSteps count];
}

@end
