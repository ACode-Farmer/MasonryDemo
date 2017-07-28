//
//  Test1ViewController.m
//  TestMasonry
//
//  Created by 汪杰 on 2017/7/27.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import "Test1ViewController.h"

@interface Test1ViewController ()

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) UIView *containerView;

@property (nonatomic,strong) UIView *redView;

@property (nonatomic,strong) UIView *yellowView;

@property (nonatomic,strong) UIView *blueView;

@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"ScrollView"];
    
    [self initSubviews];
    [self addMasonry];
    
}

- (void)initSubviews{
    _scrollView = [UIScrollView new];
    [self.view addSubview:_scrollView];
    _containerView = [UIView new];
    _containerView.backgroundColor = [UIColor lightGrayColor];
    [_scrollView addSubview:_containerView];
    
    _redView = [UIView new];
    _redView.backgroundColor = [UIColor redColor];
    _yellowView = [UIView new];
    _yellowView.backgroundColor = [UIColor yellowColor];
    _blueView = [UIView new];
    _blueView.backgroundColor = [UIColor blueColor];
    
    [_containerView wj_addSuviews:@[_redView,_yellowView,_blueView]];
}

- (void)addMasonry{
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsZero);
    }];
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_scrollView).insets(UIEdgeInsetsZero);
        //这一句一定要有，有看网上是不要这一句的，不知道他们是怎么实现的
        make.width.equalTo(_scrollView);
    }];
    CGFloat space = 10;
    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(_containerView);
        make.height.equalTo(_redView.mas_width).multipliedBy(0.5);
    }];
    [_yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_redView.mas_bottom).offset(space);
        make.left.right.equalTo(_containerView);
        make.height.equalTo(_yellowView.mas_width).multipliedBy(0.5);
    }];
    [_blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_yellowView.mas_bottom).offset(space);
        make.left.right.equalTo(_containerView);
        make.height.mas_equalTo(screen_height);
        //这一句也一定要有
        make.bottom.equalTo(_containerView).offset(-space);
    }];
}

@end
