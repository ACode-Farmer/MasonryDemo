//
//  AutoHeightTableViewCell.m
//  TestMasonry
//
//  Created by 汪杰 on 2017/7/28.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import "AutoHeightTableViewCell.h"

@interface AutoHeightTableViewCell()

@property (nonatomic,strong) UIImageView *avatar;
@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UIImageView *imageV;

@end

@implementation AutoHeightTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews{
    [self.contentView wj_addSuviews:@[self.avatar,self.name,self.imageV,self.details]];
    
    [_avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(10);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_avatar);
        make.left.equalTo(_avatar.mas_right).offset(20);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(21);
    }];
    
    [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.top.equalTo(_avatar.mas_bottom).offset(10);
        //priorityHigh()要有，不然会警告
        make.height.equalTo(_imageV.mas_width).priorityHigh();
    }];
    [_details mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_imageV);
        make.top.equalTo(_imageV.mas_bottom).offset(10);
        //高度不超过500，根据自身需求赋值就好
        make.height.mas_lessThanOrEqualTo(500);
        /*这个一定要有,也就是说底部控件需要五个约束条件
         *最后一个条件为相对contentView的约束
         */
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        //这个一定要有，其实和test1中用containerView撑起来scollView的contentSize差不多
        //make.left.right.top.bottom.equalTo(self);
        //作用同上
        make.edges.equalTo(self).insets(UIEdgeInsetsZero);
    }];
}

- (UIImageView *)avatar{
    if (_avatar == nil) {
        _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Funny"]];
    }
    return _avatar;
}

- (UILabel *)name{
    if (_name == nil) {
        _name = [UILabel new];
        _name.text = @"来啊，来啊，互相伤害啊！";
    }
    return _name;
}

- (UIImageView *)imageV{
    if (_imageV == nil) {
        _imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BigFunny"]];
        _imageV.backgroundColor = kGrayColor;
        _imageV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageV;
}

- (UILabel *)details{
    if (_details == nil) {
        _details = [UILabel new];
        _details.numberOfLines = 0;
    }
    return _details;
}

@end
