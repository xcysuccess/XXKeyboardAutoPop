//
//  XXGlobalColor.m
//  XXKit
//
//  Created by tomxiang on 16/3/5.
//  Copyright © 2016年 tomxiang. All rights reserved.
//

#import "XXGlobalColor.h"

//// 当前皮肤色表
UIColor* static_colorTable[kMaxColorCount];
@interface XXGlobalColor()
@property(nonatomic,strong) NSDictionary *colorKeyDic;


@end
@implementation XXGlobalColor
- (instancetype)init {
    if(self = [super init]) {
        _colorKeyDic = @{
                          @"kTableViewSeparatorColor" : @(kTableViewSeparatorColor),
                          @"kTableViewCellBackgroundColorNormal" : @(kTableViewCellBackgroundColorNormal),
                          @"kTableViewCellBackgroundColorHighlighted" : @(kTableViewCellBackgroundColorHighlighted),
                          @"kTableViewCellUnreadBackgroundColorNormal" : @(kTableViewCellUnreadBackgroundColorNormal),
                          @"kTableViewCellTextLabelTextColorNormal" : @(kTableViewCellTextLabelTextColorNormal),
                          @"kTableViewCellTextLabelTextColorHighlighted" : @(kTableViewCellTextLabelTextColorHighlighted),
                          @"kTableViewCellDetailTextLabelTextColorNormal" : @(kTableViewCellDetailTextLabelTextColorNormal),
                          @"kTableViewCellDetailTextLabelTextColorHighlighted" : @(kTableViewCellDetailTextLabelTextColorHighlighted),
                          @"kTableViewCellDetailTextLabelTextColorDisabled" : @(kTableViewCellDetailTextLabelTextColorDisabled),
                          @"kTableViewCellTimeColorNormal" : @(kTableViewCellTimeColorNormal),
                          @"kTableViewCellTimeColorHighlighted" : @(kTableViewCellTimeColorHighlighted),
                          @"kTableViewCellVipNicknameColorNormal" : @(kTableViewCellVipNicknameColorNormal),
                          @"kTableViewCellVipNicknameColorHighlighted" : @(kTableViewCellVipNicknameColorHighlighted),
                          
                          @"kTableViewCellHeadCellBackgroundColor" : @(kTableViewCellHeadCellBackgroundColor),
                          @"kTableViewCellHeadCellBackgroundColorHighlighted" : @(kTableViewCellHeadCellBackgroundColorHighlighted),
                          @"kTableViewCellNormalCellBackgroundColor" : @(kTableViewCellNormalCellBackgroundColor),
                          @"kTableViewCellNormalCellBackgroundColorHighlighted" : @(kTableViewCellNormalCellBackgroundColorHighlighted),
                          };
    }
    return self;
}

- (void)setColorValue:(NSDictionary*)dict colorKey:(NSString*)key colorType:(int)type
{
    NSString* colorValue = [dict objectForKey:key];
    NSArray* colorArray = [colorValue componentsSeparatedByString:@","];
    unsigned int r, g, b;
    float alpha = 0;
    [[NSScanner scannerWithString:[colorArray objectAtIndex:0]] scanHexInt:&r];
    [[NSScanner scannerWithString:[colorArray objectAtIndex:1]] scanHexInt:&g];
    [[NSScanner scannerWithString:[colorArray objectAtIndex:2]] scanHexInt:&b];
    [[NSScanner scannerWithString:[colorArray objectAtIndex:3]] scanFloat:&alpha];
    
    static_colorTable[type] = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
}

- (void)setConfigValues:(NSDictionary*) config
{
    for(NSString *key in _colorKeyDic) {
        NSNumber *value = _colorKeyDic[key];
        [self setColorValue:config colorKey:key colorType:value.intValue];
    }
    
}

@end