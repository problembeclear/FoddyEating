//
//  PublishView.m
//  福迪吃吃
//
//  Created by 张思扬 on 2023/6/27.
//

#import "PublishView.h"
#import "Masonry.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface PublishView ()
@property (strong, nonatomic) UIScrollView *scrollViewMeal;
@property (strong, nonatomic) UIButton *buttonBreakfast;
@property (strong, nonatomic) UIButton *buttonLunch;
@property (strong, nonatomic) UIButton *buttonDinner;
@property (strong, nonatomic) UIButton *buttonAdd;
@end

@implementation PublishView
- (void)setSelf {
    self.backgroundColor = [UIColor whiteColor];
    [self setTitleBar];
    [self setControlButton];
    [self setScrollView];
}
- (void)setTitleBar {
    UILabel *labelTitle = [[UILabel alloc] init];
    labelTitle.text = @"餐食发布";
    labelTitle.font = [UIFont fontWithName:@"Verdana-Bold" size:30];
    [self addSubview:labelTitle];
    [labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(30);
        make.top.equalTo(self).with.offset(40);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(80);
    }];
    UIButton *buttonHead = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonHead setImage:[UIImage imageNamed:@"Ellipse 2.png"] forState:UIControlStateNormal];
    [self addSubview:buttonHead];
    [buttonHead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-20);
        make.top.equalTo(self).with.offset(50);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
}
- (void)setControlButton {
    CGFloat buttonWidth = ([UIScreen mainScreen].bounds.size.width - 80.0)/4.0;
    _buttonBreakfast = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonBreakfast setTitle:@"早餐" forState:UIControlStateNormal];
    [_buttonBreakfast setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonBreakfast setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
    [_buttonBreakfast addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_buttonBreakfast];
    [_buttonBreakfast mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(40);
        make.top.equalTo(self).with.offset(120);
        make.width.mas_equalTo(buttonWidth);
        make.height.mas_equalTo(50);
    }];
    _buttonBreakfast.selected = YES;
    
    _buttonLunch = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonLunch setTitle:@"午餐" forState:UIControlStateNormal];
    [_buttonLunch setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonLunch setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
    [_buttonLunch addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_buttonLunch];
    [_buttonLunch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonBreakfast.mas_right).with.offset(0);
        make.top.equalTo(self).with.offset(120);
        make.width.mas_equalTo(buttonWidth);
        make.height.mas_equalTo(50);
    }];
    
    
    
    _buttonDinner = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonDinner setTitle:@"晚餐" forState:UIControlStateNormal];
    [_buttonDinner setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonDinner setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
    [_buttonDinner addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_buttonDinner];
    [_buttonDinner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonLunch.mas_right).with.offset(0);
        make.top.equalTo(self).with.offset(120);
        make.width.mas_equalTo(buttonWidth);
        make.height.mas_equalTo(50);
    }];
    
    _buttonAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonAdd setTitle:@"加餐" forState:UIControlStateNormal];
    [_buttonAdd setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonAdd setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
    [_buttonAdd addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_buttonAdd];
    [_buttonAdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonDinner.mas_right).with.offset(0);
        make.top.equalTo(self).with.offset(120);
        make.width.mas_equalTo(buttonWidth);
        make.height.mas_equalTo(50);
    }];
}
- (void)buttonEvent:(UIButton*)button {
    if ([button isEqual:self.buttonBreakfast]) {
        if (button.selected == NO) {
            self.buttonBreakfast.selected = YES;
            self.buttonLunch.selected = NO;
            self.buttonDinner.selected = NO;
            self.buttonAdd.selected = NO;
        }
        
    } else if ([button isEqual:self.buttonLunch]) {
        if (button.selected == NO) {
            self.buttonBreakfast.selected = NO;
            self.buttonLunch.selected = YES;
            self.buttonDinner.selected = NO;
            self.buttonAdd.selected = NO;
        }
        
    } else if ([button isEqual:self.buttonDinner]) {
        if (button.selected == NO) {
            self.buttonBreakfast.selected = NO;
            self.buttonLunch.selected = NO;
            self.buttonDinner.selected = YES;
            self.buttonAdd.selected = NO;
        }
        
    } else {
        if (button.selected == NO) {
            self.buttonBreakfast.selected = NO;
            self.buttonLunch.selected = NO;
            self.buttonDinner.selected = NO;
            self.buttonAdd.selected = YES;
        }
        
    }
}
- (void)setScrollView {
    self.scrollViewMeal = [[UIScrollView alloc] init];
    
    self.scrollViewMeal.frame = CGRectMake(0, 170, WIDTH, 500);
    [self addSubview:_scrollViewMeal];
    
    _scrollViewMeal.showsVerticalScrollIndicator = NO;
    _scrollViewMeal.showsHorizontalScrollIndicator = NO;
    _scrollViewMeal.alwaysBounceVertical = NO;
    _scrollViewMeal.alwaysBounceHorizontal = NO;
    _scrollViewMeal.scrollEnabled = YES;
    _scrollViewMeal.pagingEnabled = YES;
    _scrollViewMeal.contentSize = CGSizeMake(WIDTH * 4 - 310, 0);
    
    UIImageView *imageBreakfast = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Frame 32.png"]];
    [_scrollViewMeal addSubview:imageBreakfast];
    [imageBreakfast mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollViewMeal).with.offset(50);
        make.top.equalTo(self.scrollViewMeal).with.offset(30);
        make.width.mas_equalTo(WIDTH - 100);
        make.height.mas_equalTo(440);
    }];
    
    UIImageView *imageLunch = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Frame 31.png"]];
    [_scrollViewMeal addSubview:imageLunch];
    [imageLunch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageBreakfast.mas_right).with.offset(20);
        make.top.equalTo(self.scrollViewMeal).with.offset(30);
        make.width.mas_equalTo(WIDTH - 100);
        make.height.mas_equalTo(440);
    }];
    
    UIImageView *imageDinner = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Frame 32.png"]];
    [_scrollViewMeal addSubview:imageDinner];
    [imageDinner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageLunch.mas_right).with.offset(20);
        make.top.equalTo(self.scrollViewMeal).with.offset(30);
        make.width.mas_equalTo(WIDTH - 100);
        make.height.mas_equalTo(440);
    }];
    
    UIImageView *imageAdd = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Frame 31.png"]];
    [_scrollViewMeal addSubview:imageAdd];
    [imageAdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageDinner.mas_right).with.offset(20);
        make.top.equalTo(self.scrollViewMeal).with.offset(30);
        make.width.mas_equalTo(WIDTH - 100);
        make.height.mas_equalTo(440);
    }];
    
    imageBreakfast.userInteractionEnabled = YES;
    imageLunch.userInteractionEnabled = YES;
    imageDinner.userInteractionEnabled = YES;
    imageAdd.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap1)];
    UITapGestureRecognizer* singleTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap2)];
    UITapGestureRecognizer* singleTap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap3)];
    UITapGestureRecognizer* singleTap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap4)];
    [imageBreakfast addGestureRecognizer:singleTap1];
    [imageLunch addGestureRecognizer:singleTap2];
    [imageDinner addGestureRecognizer:singleTap3];
    [imageAdd addGestureRecognizer:singleTap4];
    
}
- (void)handleSingleTap1 {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"presentPublish" object:nil];
}
- (void)handleSingleTap2 {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"presentPublish" object:nil];
}
- (void)handleSingleTap3 {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"presentPublish" object:nil];
}
- (void)handleSingleTap4 {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"presentPublish" object:nil];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

- (void)getInPublish {
    
}
@end
