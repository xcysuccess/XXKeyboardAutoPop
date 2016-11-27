//
//  NSString+Ex.h
//  XXUtility
//
//  Created by tomxiang on 16/1/5.
//  Copyright © 2016年 tomxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (other)
-(NSRange)firstRangeOfEmojiInRange:(NSRange)searchRange;
-(NSString *)stringByTrim;
- (CGSize)sizeForString:(NSString *)string font:(UIFont*) font;
@end

@interface NSString(NSData)
+ (NSString*)convertFromNSData:(NSData*)data;
@end

@interface NSData(NSString)
+ (NSData*)convertFromNSString:(NSString*)str;
@end

@interface NSString(PingYin)

- (NSString *) pinyinString;                     //  首字母
- (NSString *) pinyinFullString;                 //  全部拼音
- (NSString *) pinyinFullStringAndRangeInfo:(NSMutableArray *)rangeArry;
- (NSString *) pinyinStringWithOtherCharacters;  //  首字母并包含其他字符
- (NSString*)sortedCharacter;

@end