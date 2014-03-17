//
//  loginViewController.m
//  wk02
//
//  Created by Jorge Angarita on 3/16/14.
//  Copyright (c) 2014 jorge. All rights reserved.
//

#import "loginViewController.h"
#import "feedViewController.h"
#import "peopleViewController.h"
#import "messagesViewController.h"
#import "notificationsViewController.h"
#import "moreViewController.h"

@interface loginViewController ()

@property (weak, nonatomic) IBOutlet UIView *loginGroup;
@property (weak, nonatomic) IBOutlet UILabel *signupLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIImageView *loginImage;
@property (weak, nonatomic) IBOutlet UIImageView *loggingImage;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;

- (IBAction)onTap:(id)sender;
- (IBAction)onLoginButton:(id)sender;


@end

@implementation loginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];

    
    
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.emailField.delegate = self;
    self.passwordField.delegate = self;
    self.loginButton.enabled = NO;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
}

- (void) myMethod {
    NSString *email = self.emailField.text;
    NSString *password = self.passwordField.text;
    
    if ([email isEqualToString:@"jorge@yahoo.com"] && [password isEqualToString:@"password"]) {
        
        UIViewController *vc1 = [[feedViewController alloc] init];
        UIViewController *vc2 = [[peopleViewController alloc] init];
        UIViewController *vc3 = [[messagesViewController alloc] init];
        UIViewController *vc4 = [[notificationsViewController alloc] init];
        UIViewController *vc5 = [[moreViewController alloc] init];

        UINavigationController *nvc1 = [[UINavigationController alloc] initWithRootViewController:vc1];
        UINavigationController *nvc2 = [[UINavigationController alloc] initWithRootViewController:vc2];
        UINavigationController *nvc3 = [[UINavigationController alloc] initWithRootViewController:vc3];
        UINavigationController *nvc4 = [[UINavigationController alloc] initWithRootViewController:vc4];
        UINavigationController *nvc5 = [[UINavigationController alloc] initWithRootViewController:vc5];
        

        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        tabBarController.viewControllers = @[nvc1,nvc2,nvc3,nvc4,nvc5];
        tabBarController.tabBar.translucent = NO;
        tabBarController.tabBar.barTintColor = [UIColor whiteColor];
        
        
        nvc1.tabBarItem.title = @"News feed";
        nvc1.tabBarItem.image = [UIImage imageNamed:@"newsFeed"];
        nvc1.navigationBar.barTintColor = [UIColor colorWithRed:(59/255.0) green:(89/255.0) blue:(152/255.0) alpha:1];
        nvc1.navigationBar.translucent = NO;
        nvc1.navigationBar.tintColor = [UIColor whiteColor];
        
        nvc2.tabBarItem.title = @"People";
        nvc2.tabBarItem.image = [UIImage imageNamed:@"people"];
        nvc2.navigationBar.barTintColor = [UIColor colorWithRed:(59/255.0) green:(89/255.0) blue:(152/255.0) alpha:1];
        nvc2.navigationBar.translucent = NO;
        nvc2.navigationBar.tintColor = [UIColor whiteColor];
        
        
        nvc3.tabBarItem.title = @"Messages";
        nvc3.tabBarItem.image = [UIImage imageNamed:@"messages"];
        nvc3.navigationBar.barTintColor = [UIColor colorWithRed:(59/255.0) green:(89/255.0) blue:(152/255.0) alpha:1];
        nvc3.navigationBar.translucent = NO;
        nvc3.navigationBar.tintColor = [UIColor whiteColor];
        
        nvc4.tabBarItem.title = @"Notifications";
        nvc4.tabBarItem.image = [UIImage imageNamed:@"notifications"];
        nvc4.navigationBar.barTintColor = [UIColor colorWithRed:(59/255.0) green:(89/255.0) blue:(152/255.0) alpha:1];
        nvc4.navigationBar.translucent = NO;
        nvc4.navigationBar.tintColor = [UIColor whiteColor];
        
        nvc5.tabBarItem.title = @"More";
        nvc5.tabBarItem.image = [UIImage imageNamed:@"menu"];
        nvc5.navigationBar.barTintColor = [UIColor colorWithRed:(59/255.0) green:(89/255.0) blue:(152/255.0) alpha:1];
        nvc5.navigationBar.translucent = NO;
        nvc5.navigationBar.tintColor = [UIColor whiteColor];

        
        tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        [self presentViewController:tabBarController animated:YES completion:nil];

    } else {
        NSLog(@"alert modal");
        self.loggingImage.alpha = 0;
        [self.activityView stopAnimating];
        //self.loginImage.alpha = 0.5;
        //self.loginButton.enabled = NO;
        
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"The password you entered is incorrect. Please try again." delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alertView show];
        
    }


    NSLog(@"my method ran");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.loginGroup.frame = CGRectMake(0, 50, self.loginGroup.frame.size.width, self.loginGroup.frame.size.height);
                         self.signupLabel.frame = CGRectMake(76, self.view.frame.size.height - kbSize.height - self.signupLabel.frame.size.height - 15, self.signupLabel.frame.size.width, self.signupLabel.frame.size.height);
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.loginGroup.frame = CGRectMake(0, 120, self.loginGroup.frame.size.width, self.loginGroup.frame.size.height);
                         self.signupLabel.frame = CGRectMake(76, 465, self.signupLabel.frame.size.width, self.signupLabel.frame.size.height);
                     }
                     completion:nil];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onLoginButton:(id)sender {
    
    self.loggingImage.alpha = 1;
    [self.activityView startAnimating];
    [self performSelector:@selector(myMethod) withObject:nil afterDelay:2];
    //self.view.userInteractionEnabled = NO;
    
    
}



-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


#pragma mark - UITextField delegate methods

- (void)textFieldDidBeginEditing:(UITextField *)textField {
   
    //NSLog(@"text field did begin editing");
    NSString *email = self.emailField.text;
    NSString *password = self.passwordField.text;
    
    if ([email isEqualToString:@""] && [password isEqualToString:@""]) {
        NSLog(@"disable button");
        self.loginImage.alpha = 0.5;
         self.loginButton.enabled = NO;
    } else {
        NSLog(@"enable button");
        self.loginImage.alpha = 1;
         self.loginButton.enabled = YES;
        
    }

    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    //NSLog(@"text field did end editing");
    NSString *email = self.emailField.text;
    NSString *password = self.passwordField.text;
    
    if ([email isEqualToString:@""] && [password isEqualToString:@""]) {
        NSLog(@"disable button");
        self.loginImage.alpha = 0.5;
        self.loginButton.enabled = NO;
    } else {
        NSLog(@"enable button");
        self.loginImage.alpha = 1;
        self.loginButton.enabled = YES;
    }

    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSLog(@"%@", text);
    /*NSString *email = self.emailField.text;
    NSString *password = self.passwordField.text;
    
    if ([email isEqualToString:@""] && [password isEqualToString:@""]) {
        NSLog(@"disable button");
        self.loginImage.alpha = 0.5;
        self.loginButton.enabled = NO;
    } else {
        NSLog(@"enable button");
        self.loginImage.alpha = 1;
        self.loginButton.enabled = YES;
    }
    */

    
    
    return YES;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
}

@end
