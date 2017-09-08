//
//  UINavigationBar+QuickCreate.h
//  Demo
//
//  Created by Flame Grace on 2017/9/8.
//  Copyright © 2017年 com.flamegrace. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UINavigationBar (QuickCreate)

+ (UIView *)underline:(UIColor *)underlineColor;

+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;

+ (UIButton *)buttonWithAttributeTitle:(NSAttributedString *)attributeTitle target:(id)target action:(SEL)action;

+ (UIButton *)buttonWithImage:(UIImage *)image target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image target:(id)target action:(SEL)action;

@end
