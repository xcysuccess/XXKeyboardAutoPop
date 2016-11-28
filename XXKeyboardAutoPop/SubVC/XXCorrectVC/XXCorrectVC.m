//
//  XXCorrectVC.m
//  XXKeyboardAutoPop
//
//  Created by tomxiang on 05/11/2016.
//  Copyright © 2016 tomxiang. All rights reserved.
//

#import "XXCorrectVC.h"
#import "XXKeyboardManager.h"

@interface XXCorrectVC ()<XXKeyboardManagerShowHiddenNotificationDelegate>
@end

@implementation XXCorrectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [[XXKeyboardManager sharedInstance] setDelegate:self];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- KeyBoardShow/Hidden
- (void)showKeyboardWithRect:(CGRect)keyboardRect
                withDuration:(CGFloat)animationDuration
{
    CGFloat offset = self.textFieldCorrect.frame.size.height + self.textFieldCorrect.frame.origin.y - keyboardRect.origin.y;
    if(offset < 0){
        return;
    }
    [UIView animateWithDuration:animationDuration
                          delay:0.f
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect rect = CGRectMake(0.0f, -offset,self.view.frame.size.width,self.view.frame.size.height);
        self.view.frame = rect;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hiddenKeyboardWithRect:(CGRect)keyboardRect
                  withDuration:(CGFloat)animationDuration
{
    [UIView animateWithDuration:animationDuration
                          delay:0.f
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.textFieldCorrect.frame = self.view.bounds;
    } completion:^(BOOL finished) {
    }];
}
@end
