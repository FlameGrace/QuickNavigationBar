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


- (void)delete
{
    
}

- (void)next
{
    
}

- (void)layoutNavigationBar
{
    self.navigationBar.navigationItem.leftBarButtonItem = [UINavigationBar itemWithTitle:@"返回" titleColor:nil target:self action:@selector(delete)];
    self.navigationBar.navigationItem.rightBarButtonItem = [UINavigationBar itemWithTitle:@"下一页" titleColor:nil target:self action:@selector(next)];
    [self.navigationBar configTitle:@"我的" titleColor:[UIColor redColor] font:nil];
    self.navigationBar.underLine = [UINavigationBar underline:[UIColor redColor]];
}

@end
