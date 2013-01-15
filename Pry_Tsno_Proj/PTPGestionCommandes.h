//
//  PTPGestionCommandes.h
//  Pry_Tsno_Proj
//
//  Created by ulybu on 14/01/13.
//  Copyright (c) 2013 ulybu. All rights reserved.
//

#import <Foundation/Foundation.h>

//@class ShoppingListViewController;
@protocol GestionCommandesDelegate ;
@interface PTPGestionCommandes : NSObject
{
//    ShoppingListViewController * commandeController;
}

@property (nonatomic,assign) NSInteger commandesCount;
@property (nonatomic,assign) id <GestionCommandesDelegate> commandesController;

+ (id) sharedGestionCommandes;

@end

@protocol GestionCommandesDelegate <NSObject>

@optional
//- (void) gestionCommandes:(PTPGestionCommandes*)gestionCommandes nouvelleCommande:(NSInteger)vinID;
//
//- (void) gestionCommandes:(PTPGestionCommandes*)gestionCommandes setCommandesCount:(NSInteger)count;


- (void) nouvelleCommande:(NSInteger)vinID;

- (void) setCommandesCount:(NSInteger)count;
@end
