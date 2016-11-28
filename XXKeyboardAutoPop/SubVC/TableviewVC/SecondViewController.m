//
//  SecondViewController.m
//  XXKeyboardAutoPop
//
//  Created by tomxiang on 03/11/2016.
//  Copyright © 2016 tomxiang. All rights reserved.
//

#import "SecondViewController.h"
#import "UITableView+Global.h"
#import "UIScreenEx.h"
#import "SecondViewCell.h"
#import "XXKeyboardManager.h"

@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource,XXKeyboardManagerShowHiddenNotificationDelegate>
@property(nonatomic,strong) UITableView *baseTableView;
@property(nonatomic,strong) UITableViewCell *activeCell;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [[XXKeyboardManager sharedInstance] setDelegate:self];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - keyboard show hide notification
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadView
{
    [super loadView];
    
    _baseTableView = [UITableView commonPlainStyledTableView:self dataSource:self frame:self.view.bounds];
    [_baseTableView registerNib:[UINib nibWithNibName:NSStringFromClass([SecondViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SecondViewCell class])];
    [self.view addSubview:_baseTableView];
    _baseTableView.contentInset = UIEdgeInsetsZero;
    _baseTableView.scrollIndicatorInsets = UIEdgeInsetsZero;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fingerTapped:)];
    [self.view addGestureRecognizer:singleTap];
}

#pragma mark- 键盘消失
-(void)fingerTapped:(UITapGestureRecognizer *)gestureRecognizer{
    [self.view endEditing:YES];
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

#pragma mark- Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _size_H_6(44);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark- DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;              // Default is 1 if not implemented
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SecondViewCell class]) forIndexPath:indexPath];
    if (cell == nil) {
        cell = (SecondViewCell*)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass([SecondViewCell class])];
    }
    __weak __typeof(self) weakSelf = self;
    cell.contentTextField.notifyEvent = ^(XXTextField *textField, XXTextFieldEvent event){
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        if(event == XXTextFieldEventBegin){
            strongSelf.activeCell = cell;
        }
    };
    cell.titleName.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.contentTextField.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}


#pragma mark- Keyboard
/*
 * 键盘要显示的时候
 */
- (void)showKeyboardWithRect:(CGRect)keyboardRect
                withDuration:(CGFloat)animationDuration{
    
    CGSize kbSize = keyboardRect.size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    _baseTableView.contentInset = contentInsets;
    _baseTableView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    
    if (!CGRectContainsPoint(aRect, _activeCell.frame.origin) ) {
        [_baseTableView scrollRectToVisible:_activeCell.frame animated:YES];
    }
}

/*
 * 键盘要消失的时候
 */
- (void)hiddenKeyboardWithRect:(CGRect)keyboardRect
                  withDuration:(CGFloat)animationDuration{
    _baseTableView.contentInset = UIEdgeInsetsZero;
    _baseTableView.scrollIndicatorInsets = UIEdgeInsetsZero;
}
@end
