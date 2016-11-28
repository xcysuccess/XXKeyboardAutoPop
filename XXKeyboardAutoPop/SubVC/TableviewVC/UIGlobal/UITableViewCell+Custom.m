//
//  UITableViewCell+Custom.m
//  XXKit
//
//  Created by tomxiang on 16/3/5.
//  Copyright © 2016年 tomxiang. All rights reserved.
//

#import "UITableViewCell+Custom.h"
#import "XXGlobalColor.h"
#import "UIColorEx.h"

@implementation UITableViewCell (Custom)

- (void) setCustomAccessoryViewEnabled:(BOOL)enabled {
    if (enabled) {
        //self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UIImage* access = [UIImage imageNamed:@"table_arrow.png"];
        //stanfani:手Q5.0 Redesign项目
        //UIImage* accessHighted = LOAD_ICON_USE_POOL_USE_CACHE(@"table_arrow_press.png");
        UIImageView* view = [[UIImageView alloc] initWithImage:access];
        view.image = access;
        self.accessoryView = view;
    } else {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.accessoryView = nil;
    }
}

- (void)updateBackgroundViewInTableView:(UITableView*)tableView atIndexPath:(NSIndexPath*)indexPath
{
    NSInteger row = [indexPath row];
    NSInteger section = [indexPath section];
    NSInteger rows = [tableView.dataSource tableView:tableView numberOfRowsInSection:section];
    
    // QQ5.0 普通状态下用色值代替
    [self setBackgroundColor:QQGLOBAL_COLOR(kTableViewCellBackgroundColorNormal)];
    // 按下背景图
    [self updateSelectedBackgroundViewAtRow:row sectionRows:rows];
}

- (void)updateSelectedBackgroundViewAtRow:(NSInteger)row sectionRows:(NSInteger)rows
{
    // 按下状态，纯色贴图
    // FTS Install Package
    /*if (1) {*/
    UIView* bgView = [[UIView alloc] initWithFrame:CGRectZero];
    [bgView setBackgroundColor:QQGLOBAL_COLOR(kTableViewCellBackgroundColorHighlighted)];

    self.selectedBackgroundView = bgView;
}

- (void)updateMenuBackgroundViewInTableView:(UITableView*)tableView atIndexPath:(NSIndexPath*)indexPath
{
    NSInteger row = [indexPath row];
    NSInteger section = [indexPath section];
    NSInteger rows = [tableView.dataSource tableView:tableView numberOfRowsInSection:section];
    
    [self setBackgroundColor:[UIColor blackColor]];
    
//    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 1)];
//    line.backgroundColor = [UIColor colorWithR:255 G:255 B:255 A:0.2];
//    [self addSubview:line];
    
    // 按下背景图
    [self updateSelectedMenuBackgroundViewAtRow:row sectionRows:rows];
}

- (void)updateSelectedMenuBackgroundViewAtRow:(NSInteger)row sectionRows:(NSInteger)rows
{
    UIView* bgView = [[UIView alloc] initWithFrame:CGRectZero];
    [bgView setBackgroundColor: [UIColor blueColor]];//[UIColor colorWithR:255 G:255 B:255 A:0.2]];
    
    self.selectedBackgroundView = bgView;
}


@end
