//
//  CustomNavigationBar.m
//  leapmotor
//
//  Created by 李嘉军 on 16/8/15.
//  Copyright © 2016年 Leapmotor. All rights reserved.
//

#import "QuickNavigationBar.h"

@interface QuickNavigationBar()

@property (strong, nonatomic) NSLayoutConstraint *titleWidthCon;
@property (strong, nonatomic) NSLayoutConstraint *leftWidthCon;
@property (strong, nonatomic) NSLayoutConstraint *rightWidthCon;

@property (strong,nonatomic) UIView *leftItem;
@property (strong,nonatomic) UIView *rightItem;

@end

@implementation QuickNavigationBar

- (id)init
{
    if(self = [super init])
    {
        [self initViews];
        self.frame = CGRectMake(0,0,[self screenWidth],64);
    }
    
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self initViews];
    }
    return self;
}

- (void)initViews
{
    self.leftView = [[UIView alloc]init];
    self.rightView = [[UIView alloc]init];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(deviceOrientationDidChange) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}

- (void)pushLeftItem:(UIView *)leftItem
{
    if(_leftItem)
    {
        [_leftItem removeFromSuperview];
    }
    _leftItem = leftItem;
    if(_leftItem)
    {
        if(!self.leftView)
        {
            self.leftView = [[UIView alloc]init];
        }
        [self.leftView addSubview:_leftItem];
        _leftItem.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_leftItem attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.leftView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_leftItem attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.leftView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
        CGFloat width = _leftItem.frame.size.width;
        CGFloat height = _leftItem.frame.size.height;
        if(width<44)
        {
            width = 44;
        }
        if(height<44)
        {
            height = 44;
        }
        ;
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_leftItem attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_leftItem attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height]];
        if(_underLine)
        {
            [self bringSubviewToFront:_underLine];
        }
    }
    
    
}

- (void)pushRightItem:(UIView *)rightItem
{
    if(_rightItem)
    {
        [_rightItem removeFromSuperview];
    }
    _rightItem = rightItem;
    if(_rightItem)
    {
        if(!self.rightView)
        {
            self.rightView = [[UIView alloc]init];
        }
        [self.rightView addSubview:_rightItem];
        _rightItem.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_rightItem attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.rightView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_rightItem attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.rightView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
        CGFloat width = _rightItem.frame.size.width;
        CGFloat height = _rightItem.frame.size.height;
        if(width<44)
        {
            width = 44;
        }
        if(height<44)
        {
            height = 44;
        }
        ;
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_rightItem attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_rightItem attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height]];
        if(_underLine)
        {
            [self bringSubviewToFront:_underLine];
        }
    }
}

- (void)deviceOrientationDidChange
{
    CGRect frame = self.frame;
    frame.size.width = [self screenWidth];
    self.frame = frame;
    CGRect underLineFrame = _underLine.frame;
    underLineFrame.size.width = [self screenWidth];
    _underLine.frame = underLineFrame;
    _titleWidthCon.constant = [self screenWidth]/3.0;
    _leftWidthCon.constant = [self screenWidth]/3.0;
    _rightWidthCon.constant = [self screenWidth]/3.0;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
        _underLine.translatesAutoresizingMaskIntoConstraints = NO;
        CGFloat height = _underLine.frame.size.height;
        if(height<0.5)
        {
            height = 0.5;
        }
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_underLine attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_underLine attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_underLine attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-height]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_underLine attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height]];
    }
}

- (CGFloat)screenWidth
{
    return [[UIScreen mainScreen]bounds].size.width;
}

- (void)setTitleView:(UIView *)titleView
{
    if(_titleView)
    {
        [_titleView removeFromSuperview];
    }
    _titleView = titleView;
    if(_titleView)
    {
        [self addSubview:_titleView];
        _titleView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
        CGFloat width = _titleView.frame.size.width;
        CGFloat height = _titleView.frame.size.height;
        if(width<[self screenWidth]/3)
        {
            width = [self screenWidth]/3;
        }
        if(height<44)
        {
            height = 44;
        }
        self.titleWidthCon = [NSLayoutConstraint constraintWithItem:_titleView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
        [self addConstraint:self.titleWidthCon];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height]];
        if(_underLine)
        {
            [self bringSubviewToFront:_underLine];
        }
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
    self.titleView = label;
    return label;
}


- (void)setLeftView:(UIView *)leftView
{
    if(_leftView)
    {
        [_leftView removeFromSuperview];
    }
    _leftView = leftView;
    if(_leftView)
    {
        [self addSubview:_leftView];
        _leftView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_leftView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_leftView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
        CGFloat width = _leftView.frame.size.width;
        CGFloat height = _leftView.frame.size.height;
        if(width<[self screenWidth]/3.0)
        {
            width = [self screenWidth]/3.0;
        }
        if(height<44)
        {
            height = 44;
        }
        self.leftWidthCon = [NSLayoutConstraint constraintWithItem:_leftView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
        [self addConstraint:self.leftWidthCon];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_leftView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height]];
        if(_underLine)
        {
            [self bringSubviewToFront:_underLine];
        }
    }
}


- (void)setRightView:(UIView *)rightView
{
    if(_rightView)
    {
        [_rightView removeFromSuperview];
    }
    _rightView = rightView;
    if(_rightView)
    {
        [self addSubview:_rightView];
        _rightView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_rightView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_rightView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
        CGFloat width = _rightView.frame.size.width;
        CGFloat height = _rightView.frame.size.height;
        if(width<[self screenWidth]/3.0)
        {
            width = [self screenWidth]/3.0;
        }
        if(height<44)
        {
            height = 44;
        }
        self.rightWidthCon = [NSLayoutConstraint constraintWithItem:_rightView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
        [self addConstraint:self.rightWidthCon];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_rightView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height]];
        if(_underLine)
        {
            [self bringSubviewToFront:_underLine];
        }
    }
}


@end

