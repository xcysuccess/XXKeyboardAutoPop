//
//  UIScreenEx.h
//  XXBase
//
//  Created by tomxiang on 16/1/6.
//  Copyright © 2016年 tomxiang. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifndef __baseUI__UIScreenEx__
#define __baseUI__UIScreenEx__

#import <UIKit/UIKit.h>

#ifdef __cplusplus
extern "C" {
#endif
    int getScreenWidth();
    
    int getScreenHeight();
    
    int getScreenScale();
    
    CGRect getScreenBounds();
    
    CGSize getScreenSize();
    
    
    // 获取状态栏竖边高度
    int getStatusBarHeight();
    
    void setStatusBarHeight(int newH);
    
    CGFloat fitScreenWidthBy6(CGFloat value);
    CGFloat fitScreenHeightBy6(CGFloat value);
    
    CGFloat screenFontSize();

#ifdef __cplusplus
}
#endif

#define SCREEN_WIDTH            getScreenWidth()
#define SCREEN_HEIGHT           getScreenHeight()

#define _size_W_6(value)  fitScreenWidthBy6(value)              //add by erwinkuang
#define _size_H_6(value)  fitScreenHeightBy6(value)             //add by peterhchen

// 这是竖屏的
#define APPLICATION_FRAME_WIDTH       ([UIScreen mainScreen].applicationFrame.size.width)
#define APPLICATION_FRAME_HEIGHT      ([UIScreen mainScreen].applicationFrame.size.height)

#define STATUSBAR_HEIGHT        getStatusBarHeight()
#define APPLICATION_WIDTH       (SCREEN_WIDTH)
#define APPLICATION_HEIGHT      (SCREEN_HEIGHT - STATUSBAR_HEIGHT)

#define FontScreenSize screenFontSize()

#endif
/* defined(__baseUI__UIScreenEx__) */

