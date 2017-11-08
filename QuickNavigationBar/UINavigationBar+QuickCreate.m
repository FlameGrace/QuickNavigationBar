//
//  UINavigationBar+QuickCreate.m
//  Demo
//
//  Created by Flame Grace on 2017/9/8.
//  Copyright © 2017年 com.flamegrace. All rights reserved.
//

#import "UINavigationBar+QuickCreate.h"

@implementation UINavigationBar (QuickCreate)

+ (UIView *)underline:(UIColor *)underlineColor
{
    CGRect bounds =  [UIScreen mainScreen].bounds;
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 64-0.5, bounds.size.width, 0.5)];
    if(underlineColor)
    {
        lineView.backgroundColor = underlineColor;
    }
    return lineView;
}

+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action
{
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setFrame:CGRectMake(0,0, 44*2, 44)];
    [back setTitle:title forState:UIControlStateNormal];
    if(!titleColor)
    {
        titleColor = [UIColor blueColor];
    }
    [back setTitleColor:titleColor forState:UIControlStateNormal];
    [back addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return back;
}

+ (UIButton *)buttonWithAttributeTitle:(NSAttributedString *)attributeTitle target:(id)target action:(SEL)action
{
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setFrame:CGRectMake(0,0, 44*2, 44)];
    [back setAttributedTitle:attributeTitle forState:UIControlStateNormal];
    [back addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return back;
}

+ (UIButton *)buttonWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setFrame:CGRectMake(0,0, 44, 44)];
    [back setImage:image forState:UIControlStateNormal];
    [back addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return back;
}


@end
