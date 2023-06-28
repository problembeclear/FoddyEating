//
//  SelectFoodViewController.m
//  福迪吃吃
//
//  Created by 张思扬 on 2023/6/27.
//

#import "SelectFoodViewController.h"
#import "Masonry.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface SelectFoodViewController ()
@property (strong, nonatomic) UIButton *buttonBreakfast;
@property (strong, nonatomic) UIButton *buttonLunch;
@property (strong, nonatomic) UIButton *buttonDinner;
@property (strong, nonatomic) UIButton *buttonAdd;
@property (strong, nonatomic) UITextField *searchField;
@end

@implementation SelectFoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *buttonReturn = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonReturn setImage:[UIImage imageNamed:@"返回 5.png"] forState:UIControlStateNormal];
    [self.view addSubview:buttonReturn];
    [buttonReturn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(30);
        make.top.equalTo(self.view).with.offset(40);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    

//    CGFloat buttonWidth = ([UIScreen mainScreen].bounds.size.width - 80.0)/4.0;
//    _buttonBreakfast = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_buttonBreakfast setTitle:@"早餐" forState:UIControlStateNormal];
//    [_buttonBreakfast setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_buttonBreakfast setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
//    [_buttonBreakfast addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_buttonBreakfast];
//    [_buttonBreakfast mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).with.offset(40);
//        make.top.equalTo(self.view).with.offset(120);
//        make.width.mas_equalTo(buttonWidth);
//        make.height.mas_equalTo(50);
//    }];
//    _buttonBreakfast.selected = YES;
//
//    _buttonLunch = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_buttonLunch setTitle:@"午餐" forState:UIControlStateNormal];
//    [_buttonLunch setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_buttonLunch setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
//    [_buttonLunch addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_buttonLunch];
//    [_buttonLunch mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.buttonBreakfast.mas_right).with.offset(0);
//        make.top.equalTo(self).with.offset(120);
//        make.width.mas_equalTo(buttonWidth);
//        make.height.mas_equalTo(50);
//    }];
//
//
//
//    _buttonDinner = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_buttonDinner setTitle:@"晚餐" forState:UIControlStateNormal];
//    [_buttonDinner setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_buttonDinner setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
//    [_buttonDinner addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_buttonDinner];
//    [_buttonDinner mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.buttonLunch.mas_right).with.offset(0);
//        make.top.equalTo(self.view).with.offset(120);
//        make.width.mas_equalTo(buttonWidth);
//        make.height.mas_equalTo(50);
//    }];
//
//    _buttonAdd = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_buttonAdd setTitle:@"加餐" forState:UIControlStateNormal];
//    [_buttonAdd setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_buttonAdd setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
//    [_buttonAdd addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_buttonAdd];
//    [_buttonAdd mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.buttonDinner.mas_right).with.offset(0);
//        make.top.equalTo(self.view).with.offset(120);
//        make.width.mas_equalTo(buttonWidth);
//        make.height.mas_equalTo(50);
//    }];
    
    
    self.searchField = [[UITextField alloc] init];
    [self.view addSubview:_searchField];
    self.searchField.frame = CGRectMake(50, 130, WIDTH - 100, 40);
//    [_searchField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).with.offset(50);
//        make.top.equalTo(self.buttonAdd.mas_right).with.offset(10);
//        make.width.mas_equalTo(WIDTH - 100);
//        make.height.mas_equalTo(40);
//    }];
    UIImageView *imageSearch = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"搜索 1.png"]];
    imageSearch.frame = CGRectMake(0, 0, 40, 40);
    self.searchField.leftView = imageSearch;
    self.searchField.leftViewMode = UITextFieldViewModeAlways;
    
    
}
- (void)buttonEvent:(UIButton*)button {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
