//
//  XXTextField.m
//  XXKeyboardAutoPop
//
//  Created by tomxiang on 02/11/2016.
//  Copyright © 2016 tomxiang. All rights reserved.
//

#import "XXTextField.h"

#define isIPhone ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define isIPad   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

@implementation NSString (XXTextField)

-(BOOL) isTextFieldMatchWithRegularExpression:(NSString *)exporession{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",exporession];
    return [predicate evaluateWithObject:self];
}
-(BOOL) isTextFieldIntValue{
    return [self isTextFieldMatchWithRegularExpression:@"[-]{0,1}[0-9]*"];
}
-(BOOL) isTextFieldUnsignedIntValue{
    return [self isTextFieldMatchWithRegularExpression:@"[0-9]+"];
}
-(BOOL) isTextFieldEmoji{
    //因为emoji一直在更新，这个不行
    assert(0);
}
@end

@interface XXTextField()<UITextFieldDelegate>
@property(nonatomic,copy) NSString *lastContentText;
@end

@implementation XXTextField

-(instancetype)init{
    if (self = [super init]) {
        [self initDefault];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        [self initDefault];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self initDefault];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) initDefault{
    [self initData];
    [self setDelegate:self];
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

}

-(void) initData{
    _maxLength = INT_MAX;
    _maxBytesLength = INT_MAX;
}

#pragma mark- UITextField
- (void)textFieldDidChange:(UITextField *)textField
{
    NSString *toBeString = textField.text;
    NSLog(@"toBeString:%@",toBeString);
    
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制,防止中文被截断
    if (!position){
        //---字符处理
        if (toBeString.length > _maxLength){
            //中文和emoj表情存在问题，需要对此进行处理
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, _maxLength)];
            textField.text = [toBeString substringWithRange:rangeRange];
        }
        
        //---字节处理
        NSInteger bytesCount = strlen([textField.text UTF8String]);
        if (bytesCount > _maxBytesLength) {
            textField.text = _lastContentText;
        }
    }
}
/**
 *  验证字符串是否符合
 *
 *  @param string 字符串
 *
 *  @return 是否符合
 */
- (BOOL)validateInputString:(NSString *)string textField:(UITextField *)textField{
    switch (self.inputType) {
        case XXTextFieldTypeOnlyUnsignInt:{
            return [string isTextFieldIntValue];
        }
            break;
        case XXTextFieldTypeOnlyInt:{
            return [string isTextFieldUnsignedIntValue];
        }
            break;
        case XXTextFieldTypeForbidEmoj:{
            if ([[[textField textInputMode] primaryLanguage] isEqualToString:@"emoji"] || ![[textField textInputMode] primaryLanguage]){
                return NO;
            }
        }
        default:
            break;
    }
    return YES;
}
-(void)setInputType:(XXTextFieldType)inputType{
    _inputType = inputType;
    switch (self.inputType) {
        case XXTextFieldTypeOnlyUnsignInt:
        case XXTextFieldTypeOnlyInt:
        {
            [self setKeyboardType:UIKeyboardTypeNumberPad];
        }
            break;
        default:{
            [self setKeyboardType:UIKeyboardTypeDefault];
        }
            break;
    }
}

#pragma mark- UITextField Delegate
// return NO to disallow editing.
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

// became first responder
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if(_notifyEvent){
        _notifyEvent(self,XXTextFieldEventBegin);
    }
}

// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if(_notifyEvent){
        _notifyEvent(self,XXTextFieldEventFinish);
    }
}

// return NO to not change text
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString * inputString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    //限制字节数
    if ([inputString length] > 0){
        NSInteger len = strlen([inputString UTF8String]);
        if (len > _maxBytesLength){
            return NO;
        }
        else {
            _lastContentText = inputString;
            return  YES;
        }
    }
    
    if(inputString.length > 0){
        BOOL ret = [self validateInputString:inputString textField:textField];
        if (ret && _inputCharacter) {
            _inputCharacter(self, string);
        }
        return ret;
    }
    if (_inputCharacter) {
        _inputCharacter(self, string);
    }
    return YES;
}

// called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}

// called when 'return' key pressed. return NO to ignore.
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(_isResignKeyboardWhenTapReturn){
        [textField resignFirstResponder];
    }
    return YES;
}

@end