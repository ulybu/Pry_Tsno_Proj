//
//  ShoppingListViewController.h
//  Vinorama2
//
//  Created by Paul on 14/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTPGestionCommandes.h"

@interface ShoppingListViewController : UITableViewController<GestionCommandesDelegate>
{
    PTPGestionCommandes *_gestionnaire;
    NSMutableArray * shoppingList;
}

@property (nonatomic,copy) NSArray * shoppingList;

@end
