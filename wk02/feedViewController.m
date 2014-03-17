//
//  feedViewController.m
//  wk02
//
//  Created by Jorge Angarita on 3/16/14.
//  Copyright (c) 2014 jorge. All rights reserved.
//

#import "feedViewController.h"
#import "loginViewController.h"
#import "peopleViewController.h"
#import "messagesViewController.h"
#import "notificationsViewController.h"
#import "moreViewController.h"
#import "composeViewController.h"


@interface feedViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (weak, nonatomic) IBOutlet UIImageView *feedView;
- (IBAction)onStatusButton:(id)sender;

@end

@implementation feedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.navigationItem.title = @"News Feed";
        
        UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.leftBarButtonItem = leftButton;
        
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"messagesTop"] style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.rightBarButtonItem = rightButton;
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.feedView.alpha = 0;
    [self.activityView startAnimating];
    [self performSelector:@selector(myMethod) withObject:nil afterDelay:2];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
}


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void) myMethod {
    
    [self.activityView stopAnimating];
    [UIView animateWithDuration:0.2
                     animations:^ {
                         self.feedView.alpha = 1;
                     }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)onStatusButton:(id)sender {
    UIViewController *vc1 = [[composeViewController alloc] init];
    
    UINavigationController *nvc1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    nvc1.navigationBar.barTintColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
    nvc1.navigationBar.translucent = NO;
    nvc1.navigationBar.tintColor = [UIColor blackColor];
    
    nvc1.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:nvc1 animated:YES completion:nil];
}
@end
