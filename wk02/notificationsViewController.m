//
//  notificationsViewController.m
//  wk02
//
//  Created by Jorge Angarita on 3/16/14.
//  Copyright (c) 2014 jorge. All rights reserved.
//

#import "notificationsViewController.h"

@interface notificationsViewController ()

@end

@implementation notificationsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.navigationItem.title = @"Notifications";
        

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
