//
//  CourseCell.h
//  Vinorama2
//
//  Created by Paul on 14/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"

@interface CourseCell : UITableViewCell

-(void)configureWithCourse:(Course*)course;

@end
