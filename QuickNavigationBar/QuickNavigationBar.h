//
//  QuickNavigationBar.h
//
//  Created by Flame Grace on 16/8/15.
//  Copyright © 2016年 com.flamegrace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuickNavigationBar : UIView

//分割线
@property (strong, nonatomic) UIView *underLine;
@property (strong, nonatomic) UIView *titleView;
@property (strong, nonatomic) UIView *leftView;
@property (strong, nonatomic) UIView *rightView;

- (void)pushLeftItem:(UIView *)leftItem;
- (void)pushRightItem:(UIView *)rightItem;

- (UILabel *)configTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font;

@end
