//
//  OrderCell.m
//  Vinorama2
//
//  Created by Paul on 14/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import "PTPOrderCell.h"

@implementation PTPOrderCell
@synthesize nameLabel = _nameLabel;
@synthesize priceLabel = _priceLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)configureWithWine:(PTPWine*)wine
{
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %d", wine.name, wine.year];
     NSLog(@"Log subliminal (encore): Ulysse et Paul sont trop cool...");
    self.priceLabel.text = [NSString stringWithFormat:@"%.2f€", wine.price];
}


@end