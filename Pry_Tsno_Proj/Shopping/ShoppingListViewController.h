//
//  ShoppingListViewController.h
//  Vinorama2
//
//  Created by Paul on 14/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingListViewController : UITableViewController
{
    NSArray * shoppingList;
}

@property (nonatomic,copy) NSArray * shoppingList;

@end
