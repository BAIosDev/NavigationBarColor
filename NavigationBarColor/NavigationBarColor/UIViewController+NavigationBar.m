//
//  UIViewController+NavigationBar.m
//  NavigationBarColor
//
//  Created by Борис on 09.11.16.
//  Copyright © 2016 Анели Борис. All rights reserved.
//

#import "UIViewController+NavigationBar.h"

@implementation UIViewController (NavigationBar)

///Меняет цвета navigation bar и title во время появления контроллера
///Вызывать в viewWillAppear:
- (void)configureNavigationBarColor:(UIColor *)barTintColor animated:(BOOL)animated
{
    if (animated)
    {
        [[self transitionCoordinator] animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
            
            self.navigationController.navigationBar.barTintColor = barTintColor;
        } completion:nil];
    }
    else
    {
        self.navigationController.navigationBar.barTintColor = barTintColor;
    }
}

///Возвращает цвет nvigation bar при неполном swipe to back
///Вызывать в viewDidAppear
- (void)resetNavigationBarColor:(UIColor *)barTintColor
{
    self.navigationController.navigationBar.barTintColor = barTintColor;
}

///Плавно меняет цвет navigation bar во время закрытия контроллера
///Вызывать в willMoveToParentViewController:
- (void)configureDismissNavigationBarColor:(UIColor *)barTintColor
{
    CGFloat systemVersion = [self systemVersion];
    
    BOOL animated = NO;
    
    if (systemVersion < 10)
    {
        animated = YES;
    }
    
    [self configureNavigationBarColor:barTintColor animated:animated];
}

///Меняет цвет title у navigation bar
///Вызывать в viewWillAppear:
- (void)configureNavigationBarTitleColor:(UIColor *)titleColor
{
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    NSMutableDictionary *defaultTextAttributes = [self.navigationController.navigationBar.titleTextAttributes mutableCopy];
    
    if (defaultTextAttributes)
    {
        textAttributes = defaultTextAttributes;
    }
    
    textAttributes[NSForegroundColorAttributeName] = titleColor;
    self.navigationController.navigationBar.titleTextAttributes = [textAttributes copy];
}



#pragma mark - Helper

- (CGFloat)systemVersion
{
    static CGFloat systemVersion_ = 0;
    if (systemVersion_ == 0)
    {
        systemVersion_ = (CGFloat)[[[UIDevice currentDevice] systemVersion] floatValue];
    }
    
    return systemVersion_;
}

@end
