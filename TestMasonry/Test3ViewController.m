//
//  Test3ViewController.m
//  TestMasonry
//
//  Created by 汪杰 on 2017/7/28.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import "Test3ViewController.h"

@interface Test3ViewController ()

@property (nonatomic,strong) UIView *firstView;

@property (nonatomic,strong) UIView *secondView;


@end

@implementation Test3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"并列排序"];
    [self setupFirstView];
    [self setupSecondView];
}

- (void)setupFirstView{
    _firstView = [UIView new];
    _firstView.backgroundColor = kBlueColor;
    [self.view addSubview:_firstView];
    [_firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    
    UIView *containerView = [UIView new];
    [_firstView addSubview:containerView];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    NSArray<UIButton *> *buttons = @[btn1,btn2,btn3];
    [buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.layer.cornerRadius = 5.f;
        [obj setTitle:@"btn" forState:0];
        obj.layer.borderColor = [UIColor whiteColor].CGColor;
        obj.layer.borderWidth = 1.f;
        [containerView addSubview:obj];
    }];
    //这个是水平排布子控件，MASAxisTypeHorizontal水平，FixedSpacing相对间距，leadSpacing头间距，tailSpacing尾间距
    //还有个方法FixedItemLength，是固定子控件宽度或高度的
    [buttons mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:0 tailSpacing:0];
    [buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(containerView);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    //有这个约束来控制整体的位置
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        //宽度无需添加，子控件会把它撑开
        make.height.top.centerX.equalTo(_firstView);
    }];
}

- (void)setupSecondView{
    _secondView = [UIView new];
    _secondView.backgroundColor = kBlueColor;
    [self.view addSubview:_secondView];
    [_secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_firstView.mas_bottom).offset(20);
        make.height.mas_equalTo(100);
    }];
    
    UIView *containerView = [UIView viewWithBackgroundColor:kRedColor];
    [_secondView addSubview:containerView];
    UIView *leftView = [UIView viewWithBackgroundColor:[UIColor whiteColor]];
    leftView.layer.cornerRadius = 10.f;
    UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [centerBtn setTitle:@"老牛座中央" forState:0];
    centerBtn.backgroundColor = kGreenColor;
    UILabel *rightLabel = [UILabel new];
    rightLabel.text = @"互相伤害";
    [containerView wj_addSuviews:@[leftView,centerBtn,rightLabel]];
 
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.equalTo(containerView);
        make.width.height.mas_equalTo(20);
    }];
    [centerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftView.mas_right);
        make.right.equalTo(rightLabel.mas_left);
        make.centerY.equalTo(containerView);
        make.width.mas_lessThanOrEqualTo(100);
    }];
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(centerBtn.mas_right);
        make.centerY.right.equalTo(containerView);
        make.height.mas_equalTo(21);
        make.width.mas_lessThanOrEqualTo(100);
    }];
    //有这个约束来控制整体的位置
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        //宽度无需添加，子控件会把它撑开
        make.center.equalTo(_secondView);
        make.height.mas_equalTo(50);
    }];
}

@end
