//
//  ViewController.m
//  XXKeyboardAutoPop
//
//  Created by tomxiang on 01/11/2016.
//  Copyright © 2016 tomxiang. All rights reserved.
//  http://www.jianshu.com/p/2d1c06f2dfa4
//  http://www.cnblogs.com/GarveyCalvin/p/4167759.html

#import "ViewController.h"
#import "XXTextField.h"
#import "SecondViewController.h"
#import "NormalViewController.h"
#import "XXCorrectVC.h"

//#define kAlphaNum @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet XXTextField *textfieldName;
@property (weak, nonatomic) IBOutlet XXTextField *textfieldPwd;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _textfieldName.keyboardType = UIKeyboardTypeDefault;
    _textfieldName.inputType = XXTextFieldTypeOnlyInt;
    _textfieldName.maxLength = 5;
    
    
    _textfieldPwd.inputType = XXTextFieldTypeForbidEmoj;
//    _textfieldName.returnKeyType = UIReturnKeyNext;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rejectAllKeyboard:(UIButton *)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder)
                                               to:nil
                                             from:nil
                                         forEvent:nil];
}
- (IBAction)onPushSecondVC:(id)sender {
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = @"SecondVC!";
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onPushNormalVC:(id)sender {
    NormalViewController *vc = [[NormalViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = @"NormalVC!";
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onPushCorrectVC:(id)sender {
    XXCorrectVC *vc = [[XXCorrectVC alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = @"XXCorrectVC!";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
