//
//  WineCatalogManager.h
//  Vinorama2
//
//  Created by Paul on 13/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WineCatalogManager : NSObject {
    NSArray *wineCatalog;
}

-(UIImage*)getImageAtIndex:(NSInteger)index;

@property (nonatomic,copy) NSArray * wineCatalog;

@end


