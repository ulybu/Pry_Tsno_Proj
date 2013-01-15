//
//  Course.h
//  Vinorama2
//
//  Created by Paul on 14/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Course : NSObject
{
    NSString * name;
    NSDate * date;
    NSString * description;
    NSInteger ID;
}

@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSDate * date;
@property (nonatomic,copy) NSString * description;
@property (nonatomic,assign) NSInteger ID;
@end
