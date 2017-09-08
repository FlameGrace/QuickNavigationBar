//
//  QuickNavigationBar.m
//
//  Created by Flame Grace on 16/8/15.
//  Copyright © 2016年 com.flamegrace. All rights reserved.
//

#import "QuickNavigationBar.h"

@interface QuickNavigationBar()


@end

@implementation QuickNavigationBar



- (id)init
{
    if(self = [super init])
    {
        self.navigationItem = [[UINavigationItem alloc] init];
        //把导航栏集合添加入导航栏中，设置动画关闭
        [self pushNavigationItem:_navigationItem animated:NO];
        CGRect bounds =  [UIScreen mainScreen].bounds;
        self.frame = CGRectMake(0,0,bounds.size.width,64);
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.navigationItem = [[UINavigationItem alloc] init];
        //把导航栏集合添加入导航栏中，设置动画关闭
        [self pushNavigationItem:_navigationItem animated:NO];
    }
    return self;
}

- (void)setUnderLine:(UIView *)underLine
{
    if(_underLine)
    {
        [_underLine removeFromSuperview];
    }
    _underLine = underLine;
    if(_underLine)
    {
        [self addSubview:_underLine];
    }
}

- (UILabel *)configTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font
{
    if(!font)
    {
        font = [UIFont systemFontOfSize:16.0];
    }
    if(!titleColor)
    {
        titleColor = [UIColor whiteColor];
    }
    UILabel *label = [[UILabel alloc]init];
    label.text = title;
    label.font = font;
    label.frame = CGRectMake(0, 0, 120.0, 30.0);
    label.textColor = titleColor;
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
    return label;
}

@end
