//
//  Test4TableViewController.m
//  TestMasonry
//
//  Created by 汪杰 on 2017/7/28.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import "Test4TableViewController.h"
#import "AutoHeightTableViewCell.h"

@interface Test4TableViewController ()

@property (nonatomic,strong) NSArray *data;

@end

@implementation Test4TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"cell自动计算高度"];
    
    //这两行要有哦
    //自动计算tableview的行高
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    //估计高度需赋值，不然就是默认行高
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[AutoHeightTableViewCell class] forCellReuseIdentifier:@"AutoHeightTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AutoHeightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutoHeightTableViewCell"];
    int index = arc4random() % 4;
    cell.details.text = [self.data objectAtIndex:index];
    return cell;
}

- (NSArray *)data{
    if (_data == nil) {
        _data = @[@"真的是滑天下之大稽!!!",@"tableView:\nself.tableView.rowHeight = UITableViewAutomaticDimension;\nself.tableView.estimatedRowHeight = 100;",
                  @"cell中间图片:\nmake.height.equalTo(_imageV.mas_width).priorityHigh(),priorityHigh()有无不影响布局，但是没有会警告，所以最好还是加上",
                  @"[self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {\n//这个一定要有，其实和test1中用containerView撑起来scollView的contentSize差不多\
                  make.left.right.top.bottom.equalTo(self);\n\
                  }]"];
    }
    return _data;
}


@end
