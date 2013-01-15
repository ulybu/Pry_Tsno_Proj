//
//  ShoppingListViewController.h
//  Vinorama2
//
//  Created by Paul on 14/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTPGestionCommandesDelegate.h"

@interface PTPShoppingListViewController : UITableViewController<GestionCommandesDelegate>
{
    PTPGestionCommandesDelegate *_gestionnaire;
    NSMutableArray * shoppingList;
}

@property (nonatomic,copy) NSArray * shoppingList;

@end
