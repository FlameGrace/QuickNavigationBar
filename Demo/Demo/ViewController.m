//
//  ViewController.m
//  Demo
//
//  Created by Flame Grace on 2017/9/7.
//  Copyright © 2017年 com.flamegrace. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutNavigationBar];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}


- (void)qq
{
    
}

- (void)back
{
    
}

- (void)next
{
    
}

- (void)layoutNavigationBar
{
    [self.navigationBar configTitle:@"Mine" titleColor:[UIColor redColor] font:nil];
    self.navigationBar.underLine = [UINavigationBar underline:[UIColor redColor]];
    [self pushLeftAddButton];
    [self pushRightImage];
}

- (void)pushRightImage
{
    UIButton *btn = [UINavigationBar buttonWithImage:[UIImage imageNamed:@"qq"] target:self action:@selector(qq)];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [self.navigationBar pushRightItem:btn];
}

- (void)pushLeftButton
{
    [self.navigationBar pushLeftItem:[UINavigationBar buttonWithTitle:@"Back" titleColor:nil target:self action:@selector(back)]];
}

- (void)pushRightButton
{
    [self.navigationBar pushRightItem:[UINavigationBar buttonWithTitle:@"Next" titleColor:nil target:self action:@selector(next)]];
}

- (void)pushLeftAddButton
{
    [self pushLeftButton];
    UIButton *btn = [UINavigationBar buttonWithImage:[UIImage imageNamed:@"qq"] target:self action:@selector(qq)];
    btn.frame = CGRectMake(60, 44/2 - 40/2, 40, 40);
    [self.navigationBar.leftView addSubview:btn];
}


@end
