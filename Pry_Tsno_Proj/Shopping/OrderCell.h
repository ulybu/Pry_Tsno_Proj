//
//  OrderCell.h
//  Vinorama2
//
//  Created by Paul on 14/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Wine.h"

@interface OrderCell : UITableViewCell
{
    UILabel * nameLabel;
    UILabel * priceLabel;
}

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;

-(void)configureWithWine:(Wine*)wine;

@end
