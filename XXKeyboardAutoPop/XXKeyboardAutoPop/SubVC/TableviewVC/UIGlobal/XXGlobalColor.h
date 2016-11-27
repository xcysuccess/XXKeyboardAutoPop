//
//  XXGlobalColor.h
//  XXKit
//
//  Created by tomxiang on 16/3/5.
//  Copyright © 2016年 tomxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define QQGLOBAL_COLOR(type) static_colorTable[type]

// tableView
typedef enum GlobalColor: NSUInteger {
    kColorInvalid = 0,                                  // 色值起始点（不能用）

// tableView
    kTableViewSeparatorColor,                           // tableView分割线颜色
    kTableViewCellBackgroundColorNormal,                // cell 背景颜色（普通）
    kTableViewCellBackgroundColorHighlighted,           // cell 背景颜色（高亮）
    kTableViewCellUnreadBackgroundColorNormal,          // cell 背景颜色（未读）（普通）
    kTableViewCellTextLabelTextColorNormal,             // cell textLabel字体颜色（普通）（也用于昵称）
    kTableViewCellTextLabelTextColorHighlighted,        // cell textLabel字体颜色（高亮）
    kTableViewCellDetailTextLabelTextColorNormal,       // cell detailTextLabel字体颜色（普通）
    kTableViewCellDetailTextLabelTextColorHighlighted,  // cell detailTextLabel字体颜色（高亮）
    kTableViewCellDetailTextLabelTextColorDisabled,     // cell detailTextLabel字体颜色（禁用、无效）
    kTableViewCellTimeColorNormal,                      // cell time颜色（普通）
    kTableViewCellTimeColorHighlighted,                 // cell time颜色（高亮）
    kTableViewCellVipNicknameColorNormal,               // cell vip会员昵称颜色（普通）
    kTableViewCellVipNicknameColorHighlighted,          // cell vip会员昵称颜色（高亮）
    kTableViewCellHeadCellBackgroundColor,              // cell 好友列表分组头部色值（普通）
    kTableViewCellHeadCellBackgroundColorHighlighted,   // cell 好友列表分组头部色值（高亮）
    kTableViewCellNormalCellBackgroundColor,            // cell 好友列表成员色值（普通）
    kTableViewCellNormalCellBackgroundColorHighlighted, // cell 好友列表成员色值（高亮)
    
    kMaxColorCount
} GlobalColor;

extern UIColor* static_colorTable[];

@interface XXGlobalColor : NSObject

- (void)setConfigValues:(NSDictionary*) config;

@end