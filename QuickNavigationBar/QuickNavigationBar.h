//
//  QuickNavigationBar.h
//
//  Created by Flame Grace on 16/8/15.
//  Copyright © 2016年 com.flamegrace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationBar+QuickCreate.h"

@interface QuickNavigationBar : UINavigationBar
//导航栏集合
@property (strong , nonatomic) UINavigationItem *navigationItem;
//分割线
@property (strong, nonatomic) UIView *underLine;

- (UILabel *)configTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font;

@end
