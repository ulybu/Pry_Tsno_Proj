//
//  ShoppingListViewController.m
//  Vinorama2
//
//  Created by Paul on 14/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import "ShoppingListViewController.h"
#import "JSONKit.h"
#import "Wine.h"
#import "OrderCell.h"

@interface ShoppingListViewController ()

@end

@implementation ShoppingListViewController

@synthesize shoppingList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        titre
        self.title=@"Mes Commandes";
        
//        On se défini delegate de la gestion des commandes
        _gestionnaire=[PTPGestionCommandes sharedGestionCommandes];
        [_gestionnaire setCommandesController:self];
        
//        Chargement depuis le Json et calcu du nombre total d'éléments
//        ....
        
//        On met à jour le gestionnaire puis on affiche le badge
//        [_gestionnaire setCommandesCount: NOMBRE DE COMMANDES];
//        [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%d",[_gestionnaire commandesCount]]];
        
            }
    return self;
}
- (void) nouvelleCommande:(NSInteger)vinID{
    
//    Quoi faire quand on clique sur le caddie dans l'onglet vin'
//    Genre on re parse le json
    
//    On met à jour le gestionnaire puis on affiche le badge
    [_gestionnaire setCommandesCount:[_gestionnaire commandesCount]+1];
    [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%d",[_gestionnaire commandesCount]]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self parseShoppingList];
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

- (void) parseShoppingList{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"shoppingCart" ofType:@"json"];
    NSData* jsonData = [NSData dataWithContentsOfFile: filePath];
    JSONDecoder* decoder = [[JSONDecoder alloc]
                            initWithParseOptions:JKParseOptionNone];
    NSObject* jsonObject = [decoder objectWithData:jsonData];
    NSArray *shoppingCart = [jsonObject valueForKey:@"wines"];
    NSLog(@"number of orders %d", [shoppingCart count]);
    NSMutableArray * tempShoppingList =  [[NSMutableArray alloc] init];
    for (NSObject *orderJSON in shoppingCart){
        Wine * wine = [[Wine alloc] init];
        wine.name = [orderJSON valueForKey:@"name"];
        NSLog(@"nom du vin: %@",wine.name);
        wine.price = [[orderJSON valueForKey:@"price"] floatValue];
        NSLog(@"price: %f",wine.price);
        wine.year = [[orderJSON valueForKey:@"year"] integerValue];
        wine.ID = [[orderJSON valueForKey:@"id"] integerValue];
        [tempShoppingList addObject: wine];
    }
    shoppingList = [[NSArray alloc] initWithArray:tempShoppingList];
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
    return [shoppingList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"OrderCell";
    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
        //        cell = [[CourseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    [cell configureWithWine:[shoppingList objectAtIndex:[indexPath row]]];
    //    cell.nameLabel.text = ((Course *)[courseList objectAtIndex:[indexPath row]]).name;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


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
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}




@end