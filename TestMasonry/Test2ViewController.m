//
//  Test2ViewController.m
//  TestMasonry
//
//  Created by 汪杰 on 2017/7/27.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import "Test2ViewController.h"

@interface Test2ViewController ()

@property (nonatomic,strong) UIView *firstView;

@property (nonatomic,strong) UIView *secondView;

@property (nonatomic,strong) UIView *thirdView;

@property (nonatomic,strong) UIView *fourthView;

@end

@implementation Test2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"多控件居中"];
    [self initFourView];
    [self setupFirstView];
    [self setupSecondView];
    [self setupThirdView];
    [self setupFourthView];
}

- (void)initFourView{
    _firstView = [UIView new];
    _secondView = [UIView new];
    _thirdView = [UIView new];
    _fourthView = [UIView new];
    NSArray<UIView *> *views = @[_firstView,_secondView,_thirdView,_fourthView];
    [views enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.backgroundColor = [UIColor grayColor];
        [self.view addSubview:obj];
    }];
    [_firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    [_secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_firstView.mas_bottom).offset(10);
        make.height.mas_equalTo(100);
    }];
    [_thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(_secondView.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(0.5*screen_width-5, 300));
    }];
    [_fourthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(_thirdView);
        make.left.equalTo(_thirdView.mas_right).offset(10);
        make.right.equalTo(self.view);
    }];
}

- (void)setupFirstView{
    UIView *view1 = [UIView viewWithBackgroundColor:kRedColor];
    UIView *view2 = [UIView viewWithBackgroundColor:kYellowColor];
    UIView *view3 = [UIView viewWithBackgroundColor:kBlueColor];
    NSArray *subviews = @[view1,view2,view3];
    [_firstView wj_addSuviews:subviews];
    //固定相对间距
    [subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(_firstView);
    }];
    
}

- (void)setupSecondView{
    UIView *view1 = [UIView viewWithBackgroundColor:kRedColor];
    UIView *view2 = [UIView viewWithBackgroundColor:kYellowColor];
    UIView *view3 = [UIView viewWithBackgroundColor:kBlueColor];
    NSArray *subviews = @[view1,view2,view3];
    [_secondView wj_addSuviews:subviews];
    //固定宽度
    [subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:100 leadSpacing:10 tailSpacing:10];
    [subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(_secondView);
    }];
}

- (void)setupThirdView{
    UIView *view1 = [UIView viewWithBackgroundColor:kRedColor];
    UIView *view2 = [UIView viewWithBackgroundColor:kYellowColor];
    UIView *view3 = [UIView viewWithBackgroundColor:kBlueColor];
    NSArray *subviews = @[view1,view2,view3];
    [_thirdView wj_addSuviews:subviews];
    //固定相对间距
    [subviews mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_thirdView);
    }];
}
- (void)setupFourthView{
    UIView *view1 = [UIView viewWithBackgroundColor:kRedColor];
    UIView *view2 = [UIView viewWithBackgroundColor:kYellowColor];
    UIView *view3 = [UIView viewWithBackgroundColor:kBlueColor];
    NSArray *subviews = @[view1,view2,view3];
    [_fourthView wj_addSuviews:subviews];
    //固定高度
    [subviews mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedItemLength:100 leadSpacing:10 tailSpacing:10];
    [subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_fourthView);
    }];
}

@end
