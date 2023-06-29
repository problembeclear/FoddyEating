//
//  LabelFoodView.h
//  福迪吃吃
//
//  Created by 张思扬 on 2023/6/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LabelFoodView : UIView
@property (strong, nonatomic) UILabel *labelName;
@property (strong, nonatomic) UIButton *buttonRound1;
@property (strong, nonatomic) UIButton *buttonFood1;
@property (strong, nonatomic) UILabel *labelTrans;
@property (strong, nonatomic) UIButton *add;
@property (strong, nonatomic) UIButton *sub;
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UIImageView *imageFood;
- (void)setSelf;
@end

NS_ASSUME_NONNULL_END
