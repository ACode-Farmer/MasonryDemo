//
//  RootTableViewController.m
//  TestMasonry
//
//  Created by 汪杰 on 2017/7/27.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import "RootTableViewController.h"

@interface RootTableViewController ()

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            [self pushToViewController:@"Test1ViewController"];
            break;
        case 1:
            [self pushToViewController:@"Test2ViewController"];
            break;
        case 2:
            [self pushToViewController:@"Test3ViewController"];
            break;
        case 3:
            [self pushToViewController:@"Test4TableViewController"];
            break;
        default:
            break;
    }
    
}

- (void)pushToViewController:(NSString *)vcString{
    Class vc = NSClassFromString(vcString);
    [self.navigationController pushViewController:[vc new] animated:YES];
}

@end
