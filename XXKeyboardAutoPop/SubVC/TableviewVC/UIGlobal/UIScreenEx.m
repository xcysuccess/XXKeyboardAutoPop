
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wbuiltin-macro-redefined"
#define __FILE__ "UIScreenEx"
#pragma clang diagnostic pop

//
//  UIScreenEx.m
//  XXBase
//
//  Created by tomxiang on 16/1/6.
//  Copyright © 2016年 tomxiang. All rights reserved.
//

#import "UIScreenEx.h"

static int static_statusbarHeight = 0;

int getScreenWidth()
{
    static int s_scrWidth = 0;
    if (s_scrWidth == 0){
        UIScreen* screen = [UIScreen mainScreen];
        CGRect screenFrame = screen.bounds;
        s_scrWidth = MIN(screenFrame.size.width, screenFrame.size.height);
        
        //解决在ipad中app启动时[UIScreen mainScreen].CZ_B_SizeW于768px的问题
        if (s_scrWidth >= 768) {
            s_scrWidth = 320 * (s_scrWidth / 768.0f);
        }
    }
    
    return s_scrWidth;
}

int getScreenHeight()
{
    static int s_scrHeight = 0;
    if (s_scrHeight == 0){
        UIScreen* screen = [UIScreen mainScreen];
        CGRect screenFrame = screen.bounds;
        s_scrHeight = MAX(screenFrame.size.height, screenFrame.size.width);
        
        //解决在ipad中app启动时[UIScreen mainScreen].CZ_B_SizeH于1024x的问题
        if (s_scrHeight >= 1024) {
            s_scrHeight = 480 * (s_scrHeight / 1024.0f);
        }
    }
    return s_scrHeight;
}

int getScreenScale()
{
    static int scale = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scale = [UIScreen mainScreen].scale;
    });
    
    return scale;
}

CGRect getScreenBounds()
{
    return [UIScreen mainScreen].bounds;
}

CGSize getScreenSize()
{
    return [UIScreen mainScreen].bounds.size;
}


int getStatusBarHeight()
{
    if (static_statusbarHeight == 0) {
        CGRect statusBarFrame = [UIApplication sharedApplication].statusBarFrame;
        static_statusbarHeight = MIN(statusBarFrame.size.width, statusBarFrame.size.height);
    }
    return static_statusbarHeight;
}

void setStatusBarHeight(int newH)
{
    static_statusbarHeight = newH;
}

//以iPhone6屏幕宽度为基准
CGFloat fitScreenWidthBy6(CGFloat value)
{
    return (value/375.0f)*getScreenWidth();
}

//以iPhone6屏幕高度为基准
CGFloat fitScreenHeightBy6(CGFloat value)
{
    return (value/667.0f)*getScreenHeight();
}

CGFloat screenFontSize()
{
    //设计师rachel说不再需要32号的字
    //     if(320 == getScreenWidth()) return 16.0f*screenScale();
    return 17.0f;
}

