//
//  XXKeyboardManager.h
//  XXKeyboardAutoPop
//
//  Created by tomxiang on 05/11/2016.
//  Copyright © 2016 tomxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol XXKeyboardManagerShowHiddenNotificationDelegate <NSObject>

@required
/*
 * 键盘要显示的时候
 */
- (void)showKeyboardWithRect:(CGRect)keyboardRect
                withDuration:(CGFloat)animationDuration;

/*
 * 键盘要消失的时候
 */
- (void)hiddenKeyboardWithRect:(CGRect)keyboardRect
                  withDuration:(CGFloat)animationDuration;

@end

@interface XXKeyboardManager : NSObject

+ (XXKeyboardManager *) sharedInstance;

@property(nonatomic,weak) id<XXKeyboardManagerShowHiddenNotificationDelegate> delegate;

@end
