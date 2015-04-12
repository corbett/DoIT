//
//  TutorialStep.h
//  NASAinstruct
//
//  Created by Christine Corbett Moran on 4/11/15.
//  Copyright (c) 2015 Corbett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TutorialStep : NSObject
@property (nonatomic,strong) NSString* title;
@property (nonatomic,strong) NSString* instruction;
@property (nonatomic,strong) UIImage* image;
@property (nonatomic,strong) NSNumber *timeInSeconds;
-(instancetype)initWithTitle:(NSString*)title withImage:(UIImage*)image withInstruction:(NSString*)instruction withTimeInSeconds:(NSNumber*)timeInSeconds;
@end
