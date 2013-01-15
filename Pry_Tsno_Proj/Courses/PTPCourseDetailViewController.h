//
//  CourseDetailViewController.h
//  Vinorama2
//
//  Created by Paul on 15/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTPCourse.h"

@interface PTPCourseDetailViewController : UIViewController{

    UITextField * nameLabel;
    UITextField *dateLabel;
    UITextView * description;
    PTPCourse * course;
}

@property (nonatomic,weak) IBOutlet UITextField * nameLabel;
@property (nonatomic,weak) IBOutlet UITextField *dateLabel;
@property (nonatomic,weak) IBOutlet UITextView * description;
@property (nonatomic,assign) PTPCourse * course;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil course:(PTPCourse*)currentCourse;

@end
