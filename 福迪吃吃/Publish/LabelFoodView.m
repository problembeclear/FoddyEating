//
//  LabelFoodView.m
//  福迪吃吃
//
//  Created by 张思扬 on 2023/6/29.
//

#import "LabelFoodView.h"
#import "Masonry.h"



@implementation LabelFoodView

- (void)setSelf {
    _buttonRound1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonRound1 setImage:[UIImage imageNamed:@"Ellipse 98.png"] forState:UIControlStateNormal];
    [_buttonRound1 setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    [self addSubview:_buttonRound1];
    [_buttonRound1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(20);
        make.centerY.equalTo(self.mas_centerY).multipliedBy(1.0);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    _buttonFood1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonFood1 setBackgroundImage:[UIImage imageNamed:@"Rectangle 374.png"] forState:UIControlStateNormal];
    [self addSubview:_buttonFood1];
    [_buttonFood1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonRound1.mas_right).with.offset(10);
        make.centerY.equalTo(self.mas_centerY).multipliedBy(1.0);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(90);
    }];
    
    _labelName = [[UILabel alloc] init];
    
    _labelName.font = [UIFont fontWithName:@"Verdana-Bold" size:30];
    _labelName.textColor = [UIColor blackColor];
    [self addSubview:_labelName];
    [_labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonFood1.mas_right).with.offset(10);
        make.top.equalTo(self.buttonFood1.mas_top).with.offset(0);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(40);
    }];
    
    _labelTrans = [[UILabel alloc] init];
    [self addSubview:_labelTrans];
    [_labelTrans mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.labelName.mas_left).with.offset(0);
        make.top.equalTo(self.labelName.mas_bottom).with.offset(0);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(40);
    }];
    
    self.imageFood = [[UIImageView alloc] init];
    [self addSubview:_imageFood];
    [_imageFood mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.labelTrans.mas_right).with.offset(-20);
        make.top.equalTo(self.labelTrans.mas_top).with.offset(10);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    
    self.sub = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.sub setTitle:@"-" forState:UIControlStateNormal];
    self.sub.titleLabel.font = [UIFont systemFontOfSize:30];
    [self addSubview:self.sub];
    [self.sub mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageFood.mas_left).with.offset(30);
        make.centerY.equalTo(self.mas_centerY).multipliedBy(1);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    [self.sub setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    
    
    
    self.textField = [[UITextField alloc] init];
    [self addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sub.mas_right).with.offset(0);
        make.width.equalTo(@40);
        make.top.equalTo(self.sub.mas_top).with.offset(0);
        make.height.equalTo(@30);
    }];
    self.textField.layer.cornerRadius = 10;
    self.textField.clipsToBounds = YES;
    self.textField.text = @"0";
    self.textField.textAlignment = NSTextAlignmentCenter;
    self.textField.backgroundColor = [UIColor systemGray6Color];
    
    self.add = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.add setTitle:@"+" forState:UIControlStateNormal];
    self.add.titleLabel.font = [UIFont systemFontOfSize:30];
    [self addSubview:self.add];
    [self.add mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.textField.mas_right).with.offset(0);
        make.centerY.equalTo(self.mas_centerY).multipliedBy(1);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    
    [self.add setTitleColor: [UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.sub addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.add addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)pressButton:(UIButton*)button {
    NSString *stringNum = [NSString stringWithFormat:@"%@", self.textField.text];
    if ([button isEqual:self.sub]) {
        int num = [stringNum intValue];
        if (num >= 1) {
            num--;
        }
        self.textField.text = [NSString stringWithFormat:@"%d", num];
    } else if ([button isEqual:self.add]) {
        int num = [stringNum intValue];
        num++;
        self.textField.text = [NSString stringWithFormat:@"%d", num];
    }
}
@end
