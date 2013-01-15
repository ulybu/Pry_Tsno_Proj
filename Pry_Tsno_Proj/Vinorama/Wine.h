//
//  Wine.h
//  Vinorama2
//
//  Created by Paul on 12/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wine : NSObject
{
    NSString *name;
    NSInteger year;
    float price;
    NSString *description;
    UIImage *image;
    NSInteger ID;
}


@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *description;
@property (nonatomic,assign) float price;
@property (nonatomic,assign) NSInteger year;
@property (nonatomic,copy) UIImage *image;
@property (nonatomic,assign) NSInteger ID;

@end



