//
//  PTPGestionCommandes.m
//  Pry_Tsno_Proj
//
//  Created by ulybu on 14/01/13.
//  Copyright (c) 2013 ulybu. All rights reserved.
//

#import "PTPGestionCommandes.h"
#import "ShoppingListViewController.h"

@implementation PTPGestionCommandes

@synthesize commandesCount=_commandesCount;
@synthesize commandesController=_commandesController;


#pragma mark - Singleton Methods

+ (id) sharedGestionCommandes{
    static PTPGestionCommandes *sharedPTPGestionCommandes=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedPTPGestionCommandes=[[self alloc] init];
    });
    return sharedPTPGestionCommandes;
    }
- (id) init {
    if(self = [super init]){
        _commandesCount = 0;
    }
    return self;
}

@end

