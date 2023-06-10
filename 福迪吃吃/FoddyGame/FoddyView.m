//
//  FoddyView.m
//  福迪吃吃
//
//  Created by 张思扬 on 2023/6/9.
//

#import "FoddyView.h"
#import "Masonry.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@implementation FoddyView

- (void) setSelf {
    [self imageBackground];
    [self buttonExit];
    [self layoutLeftImageView];
}
- (UIImageView*) imageBackground {
    UIImageView* imageBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    [self addSubview:imageBackground];
    [imageBackground mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(0);
        make.top.equalTo(self).with.offset(0);
        make.bottom.equalTo(self).with.offset(0);
    }];
    return imageBackground;
}

- (UIButton*) buttonExit {
    UIButton* buttonExit = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:buttonExit];
    [buttonExit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(45);
        make.height.mas_equalTo(45);
        make.right.equalTo(self).with.offset(-30);
        make.top.equalTo(self).with.offset(20);
    }];
    [buttonExit setImage:[UIImage imageNamed:@"tuichu.png"] forState:UIControlStateNormal];
    [buttonExit addTarget:self action:@selector(exitToSign) forControlEvents:UIControlEventTouchUpInside];
    return buttonExit;
}
- (void) exitToSign {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"exitToSign" object:nil];
}

- (void) layoutLeftImageView {
    UIImageView *stateView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"state.png"]];
    [self addSubview:stateView];
    [stateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(WIDTH * 0.08);
        make.top.equalTo(self).with.offset(30);
        make.width.mas_equalTo(WIDTH * 0.5);
        make.height.mas_equalTo(HEIGHT * 0.15);
    }];
    
    UIButton* buttonFeeding = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:buttonFeeding];
    [buttonFeeding mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(stateView).with.offset(0);
        make.top.equalTo(self).with.offset(30 + HEIGHT * 0.15 + HEIGHT * 0.1);
        make.width.mas_equalTo(HEIGHT * 0.12);
        make.height.mas_equalTo(HEIGHT * 0.15);
    }];
    [buttonFeeding setImage:[UIImage imageNamed:@"weiyang.png"] forState:UIControlStateNormal];
    
    UIButton* buttonClothes = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:buttonClothes];
    [buttonClothes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(stateView).with.offset(0);
        make.top.equalTo(buttonFeeding).with.offset(HEIGHT * 0.2);
        make.width.mas_equalTo(HEIGHT * 0.12);
        make.height.mas_equalTo(HEIGHT * 0.15);
    }];
    [buttonClothes setImage:[UIImage imageNamed:@"zhuangban.png"] forState:UIControlStateNormal];
    
    UIButton* buttonFriends = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:buttonFriends];
    [buttonFriends mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(stateView).with.offset(0);
        make.top.equalTo(buttonClothes).with.offset(HEIGHT * 0.2);
        make.width.mas_equalTo(HEIGHT * 0.12);
        make.height.mas_equalTo(HEIGHT * 0.15);
    }];
    [buttonFriends setImage:[UIImage imageNamed:@"haoyou.png"] forState:UIControlStateNormal];
}
@end
