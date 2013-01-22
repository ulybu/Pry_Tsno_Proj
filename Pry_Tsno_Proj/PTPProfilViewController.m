//
//  PTPProfilViewController.m
//  Pry_Tsno_Proj
//
//  Created by ulybu on 12/01/13.
//  Copyright (c) 2013 ulybu. All rights reserved.
//

#import "PTPProfilViewController.h"

@interface PTPProfilViewController ()

@end

@implementation PTPProfilViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"subliminal system log: Here comes the back up");
        self.title=@"Mon profile";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"subliminal system log: Here comes the back up");
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
