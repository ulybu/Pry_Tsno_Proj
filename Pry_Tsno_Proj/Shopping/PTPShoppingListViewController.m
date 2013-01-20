//
//  ShoppingListViewController.m
//  Vinorama2
//
//  Created by Paul on 14/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import "PTPShoppingListViewController.h"
#import "JSONKit.h"
#import "PTPWine.h"
#import "PTPOrderCell.h"

@interface PTPShoppingListViewController ()

@end

@implementation PTPShoppingListViewController

@synthesize shoppingList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        titre
        self.title=@"Mes Commandes";
        
//        On se défini delegate de la gestion des commandes
        _gestionnaire=[PTPGestionCommandesDelegate sharedGestionCommandes];
        [_gestionnaire setCommandesController:self];
                
            }
    return self;
}
- (void) nouvelleCommande:(PTPWine*)vin{
    
    if(vin!=nil){
        [shoppingList addObject: vin];
        [self.tableView reloadData];
    }else{
         [self parseShoppingList];
    }
    
   
    [_gestionnaire setCommandesCount: [shoppingList count]];
    [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%d",[shoppingList count]]];

    }

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.backgroundColor = [UIColor underPageBackgroundColor];
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
    shoppingList =  [[NSMutableArray alloc] init];
    for (NSObject *orderJSON in shoppingCart){
        PTPWine * wine = [[PTPWine alloc] init];
        wine.name = [orderJSON valueForKey:@"name"];
        wine.price = [[orderJSON valueForKey:@"price"] floatValue];
        wine.year = [[orderJSON valueForKey:@"year"] integerValue];
        wine.ID = [[orderJSON valueForKey:@"id"] integerValue];
        [shoppingList addObject: wine];
    }
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
    static NSString *CellIdentifier = @"PTPOrderCell";
    PTPOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
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
     [shoppingList removeObjectAtIndex:indexPath.row];
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%d",[shoppingList count]]];
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