//
//  UIView+Extensions.m
//  TestMasonry
//
//  Created by 汪杰 on 2017/7/27.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import "UIView+Extensions.h"

@implementation UIView (Extensions)

- (void)wj_addSuviews:(NSArray *)subviews{
    if (subviews == nil) {
        return;
    }
    [subviews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addSubview:obj];
    }];
}

+ (UIView *)viewWithBackgroundColor:(UIColor *)bgColor{
    UIView *view = [UIView new];
    view.backgroundColor = bgColor;
    return view;
}

@end
