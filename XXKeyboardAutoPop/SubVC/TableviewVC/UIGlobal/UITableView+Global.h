//
//  UITableView+Global.h
//  XXKit
//
//  Created by tomxiang on 16/3/5.
//  Copyright © 2016年 tomxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Global)

// styleGrouped的tableView，某些ios版本下，这类tableView会有系统的默认底图，要把它去掉
+ (UITableView*)commonGroupStyledTableView:(id <UITableViewDelegate>)delegate dataSource:(id <UITableViewDataSource>) dataSource frame:(CGRect)frame;
+ (UITableView*)commonPlainStyledTableView:(id <UITableViewDelegate>)delegate dataSource:(id <UITableViewDataSource>) dataSource frame:(CGRect)frame;
+ (UITableView*)commonMenuStyledTableView:(id <UITableViewDelegate>)delegate dataSource:(id <UITableViewDataSource>) dataSource frame:(CGRect)frame;

// 设置分割线默认颜色
- (void)setCurrentThemeSeparatorColor;

// 如果设置了分割线，当table不满屏时，下面会显示多余的分割线，这个接口可以去掉
// 原理是设置了一个透明的footerView，如果有自己的footerView，则不用调用这接口了
- (void)removeExtraSeparatorLine;

@end
