//
//  CourseListViewController.m
//  Vinorama2
//
//  Created by Paul on 14/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import "PTPCourseListViewController.h"
#import "PTPCourseCell.h"
#import "PTPCourseDetailViewController.h"
#import "JSONKit.h"
#import "PTPCourse.h"

@interface PTPCourseListViewController ()

@end

@implementation PTPCourseListViewController

@synthesize courseList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"subliminal system log: Here comes the back up");
        self.title=@"Cours à venir";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"subliminal system log: Here comes the back up");
    [self parseCourseList];
    
    self.tableView.backgroundColor = [UIColor underPageBackgroundColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) parseCourseList{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"courses" ofType:@"json"];
    NSData* jsonData = [NSData dataWithContentsOfFile: filePath];
    JSONDecoder* decoder = [[JSONDecoder alloc]
                            initWithParseOptions:JKParseOptionNone];
    NSObject* jsonObject = [decoder objectWithData:jsonData];
    NSArray *courses = [jsonObject valueForKey:@"courses"];
    NSMutableArray * tempCourseCatalog =  [[NSMutableArray alloc] init];
    for (NSObject *courseJSON in courses){
        PTPCourse * course = [[PTPCourse alloc] init];
        course.name = [courseJSON valueForKey:@"name"];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        course.date = [dateFormatter dateFromString:[courseJSON valueForKey:@"date"]];
        course.description = [courseJSON valueForKey:@"description"];
        course.ID = [[courseJSON valueForKey:@"id"] integerValue];
        [tempCourseCatalog addObject: course];
    }
    courseList = [[NSArray alloc] initWithArray:tempCourseCatalog];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
// Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [courseList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PTPCourseCell";
    PTPCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
//        cell = [[CourseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    [cell configureWithCourse:[courseList objectAtIndex:[indexPath row]]];
//    cell.nameLabel.text = ((Course *)[courseList objectAtIndex:[indexPath row]]).name;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    PTPCourseDetailViewController *courseDetailViewController = [[PTPCourseDetailViewController alloc] initWithNibName:@"PTPCourseDetailViewController" bundle:nil course:((PTPCourse*)[courseList objectAtIndex:[indexPath row]])];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:courseDetailViewController animated:YES];
}




@end
