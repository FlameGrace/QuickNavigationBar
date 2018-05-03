//
//  QuickNavigationBarVC.m
//
//  Created by Flame Grace on 2017/7/31.
//  Copyright © 2017年 com.flamegrace. All rights reserved.
//

#import "QuickNavigationBarVC.h"

@interface QuickNavigationBarVC ()

@end

@implementation QuickNavigationBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (QuickNavigationBar *)navigationBar
{
    if(!_navigationBar)
    {
        CGRect bounds =  [UIScreen mainScreen].bounds;
        _navigationBar = [[QuickNavigationBar alloc]initWithFrame:CGRectMake(0, 0, bounds.size.width, 64)];
        [self.view addSubview:_navigationBar];
    }
    return _navigationBar;
}

@end
