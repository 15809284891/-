//
//  MYTitleView.m
//  田楷集字sheji
//
//  Created by lixue on 16/9/9.
//  Copyright © 2016年 lixue. All rights reserved.
//

#import "MYTitleView.h"
#import "UIView+LXExtension.h"
@interface MYTitleView()<UITextFieldDelegate>
@property (nonatomic,weak)UITextField *textField;
@end
@implementation MYTitleView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *editImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, (50-20)/2.0, 20, 20)];
        editImage.image = [UIImage imageNamed:@"Edit"];
        [self addSubview:editImage];
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(45, 0, self.width-30, 50)];
        textField.placeholder   = @"请输入要生成的文字";
        textField.returnKeyType = UIReturnKeyDone;
        textField.delegate = self;
        [self addSubview:textField];
        self.textField = textField;
    }
    return self;
}
#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
    [self.textField becomeFirstResponder];
    if (![self.delegate respondsToSelector:@selector(setInputText:)]) {
        [self.delegate push ];
        [self.textField resignFirstResponder];
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"textFieldDidEndEditing");
    [self.textField resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if ([self.delegate respondsToSelector:@selector(setInputText:)]) {
        if (theTextField == self.textField) {
            [theTextField resignFirstResponder];
            [self.delegate setInputText:self.textField.text];

    }
  }
    return YES;
}

@end
