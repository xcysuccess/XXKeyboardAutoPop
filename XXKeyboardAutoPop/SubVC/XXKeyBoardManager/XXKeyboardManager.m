//
//  XXKeyboardManager.m
//  XXKeyboardAutoPop
//
//  Created by tomxiang on 05/11/2016.
//  Copyright © 2016 tomxiang. All rights reserved.
//

#import "XXKeyboardManager.h"

@implementation XXKeyboardManager

+ (XXKeyboardManager *) sharedInstance{
    static dispatch_once_t onceToken;
    static XXKeyboardManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [XXKeyboardManager new];
    });
    return manager;
}

- (instancetype) init{
    if(self = [super init]){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark- Keyboard Show/Hidden
- (void)keyboardWillShow:(NSNotification *)notification {
    /*
     Reduce the size of the text view so that it's not obscured by the keyboard.
     Animate the resize so that it's in sync with the appearance of the keyboard.
     */
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the origin of the keyboard when it's displayed.
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    // Get the top of the keyboard as the y coordinate of its origin in self's view's coordinate system. The bottom of the text view's frame should align with the top of the keyboard's final position.
    CGRect keyboardRect = [aValue CGRectValue];

    // Get the duration of the animation.
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(showKeyboardWithRect:withDuration:)] ) {
        [self.delegate showKeyboardWithRect:keyboardRect withDuration:animationDuration];
    }
}


- (void)keyboardWillHide:(NSNotification *)notification {
    /*
     Reduce the size of the text view so that it's not obscured by the keyboard.
     Animate the resize so that it's in sync with the appearance of the keyboard.
     */
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the origin of the keyboard when it's displayed.
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    // Get the top of the keyboard as the y coordinate of its origin in self's view's coordinate system. The bottom of the text view's frame should align with the top of the keyboard's final position.
    CGRect keyboardRect = [aValue CGRectValue];
    
    // Get the duration of the animation.
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(hiddenKeyboardWithRect:withDuration:)] ) {
        [self.delegate hiddenKeyboardWithRect:keyboardRect withDuration:animationDuration];
    }
}

@end
