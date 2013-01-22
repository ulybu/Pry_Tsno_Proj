//
//  WineCatalogManager.m
//  Vinorama2
//
//  Created by Paul on 13/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import "PTPWineCatalogManager.h"
#import "JSONKit.h"
#import "PTPWine.h"



@implementation PTPWineCatalogManager

@synthesize wineCatalog;

- (id) init{
    self = [super init];
    if (self){
        NSLog(@"subliminal system log: Here comes the back up");
        [self parseWineCatalog];
    }
    return self;
}

- (void) parseWineCatalog{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"wines" ofType:@"json"]; 
    NSData* jsonData = [NSData dataWithContentsOfFile: filePath];
    JSONDecoder* decoder = [[JSONDecoder alloc]
                            initWithParseOptions:JKParseOptionNone];
    NSObject* jsonObject = [decoder objectWithData:jsonData];
    NSArray *wines = [jsonObject valueForKey:@"wines"];
    NSMutableArray * tempWineCatalog =  [[NSMutableArray alloc] init];
    for (NSObject *wineJSON in wines){
        PTPWine * wine = [[PTPWine alloc] init];
        wine.name = [wineJSON valueForKey:@"name"];
        wine.year = [[wineJSON valueForKey:@"year"] integerValue];
        wine.price = [[wineJSON valueForKey:@"price"] floatValue];
        wine.description = [wineJSON valueForKey:@"description"];
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [wineJSON valueForKey:@"imageUrl"]]];
            if ( data == nil )
                return;
            dispatch_async(dispatch_get_main_queue(), ^{
                wine.image = [UIImage imageWithData: data];
            });
        });
        wine.ID = [[wineJSON valueForKey:@"id"] integerValue];
        [tempWineCatalog addObject: wine];
    }
    wineCatalog = [[NSArray alloc] initWithArray:tempWineCatalog];
}

-(UIImage*)getImageAtIndex:(NSInteger)index{
    return ((PTPWine*)[wineCatalog objectAtIndex:(index%[wineCatalog count])]).image;
}
@end
