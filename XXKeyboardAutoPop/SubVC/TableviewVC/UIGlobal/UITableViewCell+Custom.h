//
//  UITableViewCell+Custom.h
//  XXKit
//
//  Created by tomxiang on 16/3/5.
//  Copyright © 2016年 tomxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Custom)

- (void) setCustomAccessoryViewEnabled:(BOOL)enabled;

- (void)updateBackgroundViewInTableView:(UITableView*)tableView atIndexPath:(NSIndexPath*)indexPath;

- (void)updateSelectedBackgroundViewAtRow:(NSInteger)row sectionRows:(NSInteger)rows;

- (void)updateMenuBackgroundViewInTableView:(UITableView*)tableView atIndexPath:(NSIndexPath*)indexPath;

@end
