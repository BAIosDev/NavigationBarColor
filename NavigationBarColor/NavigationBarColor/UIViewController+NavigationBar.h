//
//  UIViewController+NavigationBar.h
//  NavigationBarColor
//
//  Created by Борис on 09.11.16.
//  Copyright © 2016 Анели Борис. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavigationBar)

///Меняет цвета navigation bar и title во время появления контроллера
///Вызывать в viewWillAppear:
- (void)configureNavigationBarColor:(UIColor *)barTintColor animated:(BOOL)animated;

///Возвращает цвет nvigation bar при неполном swipe to back
///Вызывать в viewDidAppear
- (void)resetNavigationBarColor:(UIColor *)barTintColor;

///Плавно меняет цвет navigation bar во время закрытия контроллера
///Вызывать в willMoveToParentViewController:
- (void)configureDismissNavigationBarColor:(UIColor *)barTintColor;

///Меняет цвет title у navigation bar
///Вызывать в viewWillAppear:
- (void)configureNavigationBarTitleColor:(UIColor *)titleColor;

@end
