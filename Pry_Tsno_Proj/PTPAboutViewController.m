//
//  PTPAboutViewController.m
//  Pry_Tsno_Proj
//
//  Created by ulybu on 12/01/13.
//  Copyright (c) 2013 ulybu. All rights reserved.
//

#import "PTPAboutViewController.h"

@interface PTPAboutViewController ()

@end

@implementation PTPAboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        self.navigationController.title=@"manger";
         self.title =@"A Propos";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
