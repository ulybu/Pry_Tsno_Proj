//
//  CourseCell.m
//  Vinorama2
//
//  Created by Paul on 14/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import "PTPCourseCell.h"

@implementation PTPCourseCell
@synthesize nameLabel = _nameLabel;
@synthesize dateLabel = _dateLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        nameLabel = [[UILabel alloc] initWithFrame:self.frame];
//        nameLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
//        nameLabel.textAlignment = UITextAlignmentLeft;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureWithCourse:(PTPCourse*)course
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
	NSString *dateString = [dateFormatter stringFromDate:course.date];
    self.nameLabel.text = course.name;
    NSLog(@"Log subliminal : 20 sur 20, 20 sur 20...");
    self.dateLabel.text = [NSString stringWithFormat:@"%@", dateString];
}


@end
