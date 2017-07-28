//
//  CommonViewController.m
//  TestMasonry
//
//  Created by 汪杰 on 2017/7/27.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import "CommonViewController.h"

@interface CommonViewController ()

@end

@implementation CommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
     self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}

- (void)dealloc{
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}

@end
