//
//  BADefaultViewController.m
//  NavigationBarColor
//
//  Created by Борис on 09.11.16.
//  Copyright © 2016 Анели Борис. All rights reserved.
//

#import "BADefaultViewController.h"
#import "UIViewController+NavigationBar.h"

@interface BADefaultViewController ()

@property (strong, nonatomic) UIColor *tintColor;
@property (strong, nonatomic) UIColor *barTintColor;
@property (strong, nonatomic) UIColor *titleColor;

@end

@implementation BADefaultViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tintColor = [self randomColor];
    self.barTintColor = [self randomColor];
    self.titleColor = [self randomColor];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self configureNavigationBar];
}


//===============================================================================

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self configureNavigationBarColor:self.barTintColor animated:animated];
    
    self.navigationController.navigationBar.tintColor = self.tintColor;
    
    [self configureNavigationBarTitleColor:self.titleColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self resetNavigationBarColor:self.barTintColor];
}

- (void)willMoveToParentViewController:(UIViewController *)parent
{
    [super willMoveToParentViewController:parent];
    
    UIColor *barTintColor = [self defaultNavigationBarColor];
    
    if (self.parentBarTintColor != nil)
    {
        barTintColor = self.parentBarTintColor;
    }
    
    [self configureDismissNavigationBarColor:barTintColor];
}

- (void)nextViewController
{
    BADefaultViewController *defaultViewController = [[BADefaultViewController alloc] init];
    
    defaultViewController.parentBarTintColor = self.barTintColor;
    
    [self.navigationController pushViewController:defaultViewController animated:YES];
}

//===============================================================================


#pragma mark - Helper

- (void)configureNavigationBar
{
    [self configureNavigationBarTitleColor:self.tintColor];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                  style:UIBarButtonItemStyleDone
                                                                 target:self
                                                                 action:@selector(nextViewController)];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:nil
                                                                 action:nil];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.backBarButtonItem = leftItem;
    
    self.navigationItem.title = @"Title";
}

#pragma mark - ColorHelper

- (UIColor *)defaultNavigationBarColor
{
    return [UIColor whiteColor];
}

- (UIColor *)randomColor
{
    CGFloat red = arc4random_uniform(255) / 255.0;
    CGFloat green = arc4random_uniform(255) / 255.0;
    CGFloat blue = arc4random_uniform(255) / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    return color;
}

@end
