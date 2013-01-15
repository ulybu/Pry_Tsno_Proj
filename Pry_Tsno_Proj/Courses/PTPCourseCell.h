//
//  CourseCell.h
//  Vinorama2
//
//  Created by Paul on 14/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTPCourse.h"

@interface PTPCourseCell : UITableViewCell
{
    UILabel * nameLabel;
    UILabel * dateLabel;
}

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;

-(void)configureWithCourse:(PTPCourse*)course;

@end
