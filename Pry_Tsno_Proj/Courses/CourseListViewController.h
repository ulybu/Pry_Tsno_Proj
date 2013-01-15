//
//  CourseListViewController.h
//  Vinorama2
//
//  Created by Paul on 14/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseListViewController : UITableViewController
{
    NSArray * courseList;
}

@property (nonatomic,copy) NSArray * courseList;

@end
