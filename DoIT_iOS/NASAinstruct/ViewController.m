//
//  ViewController.m
//  NASAinstruct
//
//  Created by Christine Corbett Moran on 4/11/15.
//  Copyright (c) 2015 Corbett. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(tutorialStepDisplay:)
                                                 name:@"TutorialStepDisplay"
                                               object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tutorialStepDisplay:(NSNotification *) notification {
    NSString* instruction = [[notification userInfo] objectForKey:@"tutorialStepInstruction"];
    _textView.text = instruction;
}



@end
