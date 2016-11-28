//
//  SecondViewCell.h
//  XXKeyboardAutoPop
//
//  Created by tomxiang on 03/11/2016.
//  Copyright © 2016 tomxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXTextField.h"

@interface SecondViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleName;
@property (weak, nonatomic) IBOutlet XXTextField *contentTextField;

@end
