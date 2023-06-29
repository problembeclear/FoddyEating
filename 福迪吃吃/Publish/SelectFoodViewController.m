//
//  SelectFoodViewController.m
//  福迪吃吃
//
//  Created by 张思扬 on 2023/6/27.
//

#import "SelectFoodViewController.h"
#import "Masonry.h"
#import "MenuViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface SelectFoodViewController ()
@property (strong, nonatomic) UIButton *buttonBreakfast;
@property (strong, nonatomic) UIButton *buttonLunch;
@property (strong, nonatomic) UIButton *buttonDinner;
@property (strong, nonatomic) UIButton *buttonAdd;
@property (strong, nonatomic) UITextField *searchField;
@property (strong, nonatomic) UIButton *buttonLast;
@property (strong, nonatomic) UIButton *buttonMain;
@property (strong, nonatomic) UIButton *buttonMeat;
@property (strong, nonatomic) UIButton *buttonSnack;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UILabel *labelMeal;
@end

@implementation SelectFoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *viewTitle = [[UIView alloc] init];
    viewTitle.backgroundColor = [UIColor whiteColor];
    viewTitle.frame = CGRectMake(0, 0, WIDTH, 140);
    [self.view addSubview:viewTitle];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *buttonReturn = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonReturn setImage:[UIImage imageNamed:@"返回 5.png"] forState:UIControlStateNormal];
    [self.view addSubview:buttonReturn];
    [buttonReturn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(30);
        make.top.equalTo(self.view).with.offset(100);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    [buttonReturn addTarget:self action:@selector(pressReturn) forControlEvents:UIControlEventTouchUpInside];
    
    

    CGFloat buttonWidth = ([UIScreen mainScreen].bounds.size.width - 120.0)/4.0;
    _buttonBreakfast = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonBreakfast setTitle:@"早餐" forState:UIControlStateNormal];
    _buttonBreakfast.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
    [_buttonBreakfast setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonBreakfast setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
    [_buttonBreakfast addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonBreakfast];
    [_buttonBreakfast mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(60);
        make.top.equalTo(buttonReturn.mas_top).with.offset(0);
        make.width.mas_equalTo(buttonWidth);
        make.height.mas_equalTo(50);
    }];
    

    _buttonLunch = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonLunch setTitle:@"午餐" forState:UIControlStateNormal];
    _buttonLunch.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:30];
    [_buttonLunch setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonLunch setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
    [_buttonLunch addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonLunch];
    [_buttonLunch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonBreakfast.mas_right).with.offset(0);
        make.top.equalTo(buttonReturn.mas_top).with.offset(0);
        make.width.mas_equalTo(buttonWidth);
        make.height.mas_equalTo(50);
    }];
    _buttonLunch.selected = YES;


    _buttonDinner = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonDinner setTitle:@"晚餐" forState:UIControlStateNormal];
    _buttonDinner.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
    [_buttonDinner setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonDinner setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
    [_buttonDinner addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonDinner];
    [_buttonDinner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonLunch.mas_right).with.offset(0);
        make.top.equalTo(buttonReturn.mas_top).with.offset(0);
        make.width.mas_equalTo(buttonWidth);
        make.height.mas_equalTo(50);
    }];

    _buttonAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonAdd setTitle:@"加餐" forState:UIControlStateNormal];
    _buttonAdd.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
    [_buttonAdd setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonAdd setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
    [_buttonAdd addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonAdd];
    [_buttonAdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonDinner.mas_right).with.offset(0);
        make.top.equalTo(buttonReturn.mas_top).with.offset(0);
        make.width.mas_equalTo(buttonWidth);
        make.height.mas_equalTo(50);
    }];
    
    
    self.searchField = [[UITextField alloc] init];
    [self.view addSubview:_searchField];
    [_searchField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(50);
        make.top.equalTo(self.buttonBreakfast.mas_bottom).with.offset(10);
        make.width.mas_equalTo(WIDTH - 100);
        make.height.mas_equalTo(40);
    }];
    
    UIImageView *imageSearch = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"搜索 1.png"]];
    imageSearch.frame = CGRectMake(0, 0, 40, 40);
    _searchField.backgroundColor = [UIColor whiteColor];
    self.searchField.leftView = imageSearch;
    self.searchField.leftViewMode = UITextFieldViewModeAlways;
    
    _searchField.layer.cornerRadius = 20;
    _searchField.layer.masksToBounds = YES;
    _searchField.layer.borderWidth = 1.0;
    _searchField.layer.borderColor = [UIColor blackColor].CGColor;
    
    _searchField.placeholder = @"搜索想发布的食物吧～";
    _searchField.textAlignment = NSTextAlignmentCenter;
    
    CGFloat widthLarge = ([UIScreen mainScreen].bounds.size.width - 80.0)/4.0;
    _buttonLast = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonLast setTitle:@"最近选择" forState:UIControlStateNormal];
    [_buttonLast setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonLast setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
    [_buttonLast setBackgroundImage:[UIImage imageNamed:@"Line 01"] forState:UIControlStateSelected];
    [self.view addSubview:_buttonLast];
    [_buttonLast mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(40);
        make.top.equalTo(self.searchField.mas_bottom).with.offset(20);
        make.width.mas_equalTo(widthLarge);
        make.height.mas_equalTo(50);
    }];
    _buttonLast.selected = YES;
    
    _buttonMain = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonMain setTitle:@"主食" forState:UIControlStateNormal];
    [_buttonMain setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonMain setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
    [_buttonMain setBackgroundImage:[UIImage imageNamed:@"Line 01"] forState:UIControlStateSelected];
    [self.view addSubview:_buttonMain];
    [_buttonMain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonLast.mas_right).with.offset(0);
        make.top.equalTo(self.searchField.mas_bottom).with.offset(20);
        make.width.mas_equalTo(widthLarge);
        make.height.mas_equalTo(50);
    }];
    
    _buttonMeat = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonMeat setTitle:@"肉蛋菜奶" forState:UIControlStateNormal];
    [_buttonMeat setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonMeat setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
    [_buttonMeat setBackgroundImage:[UIImage imageNamed:@"Line 01"] forState:UIControlStateSelected];
    [self.view addSubview:_buttonMeat];
    [_buttonMeat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonMain.mas_right).with.offset(0);
        make.top.equalTo(self.searchField.mas_bottom).with.offset(20);
        make.width.mas_equalTo(widthLarge);
        make.height.mas_equalTo(50);
    }];
    
    _buttonSnack = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonSnack setTitle:@"零食" forState:UIControlStateNormal];
    [_buttonSnack setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonSnack setTitleColor:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
    [_buttonSnack setBackgroundImage:[UIImage imageNamed:@"Line 01"] forState:UIControlStateSelected];
    [self.view addSubview:_buttonSnack];
    [_buttonSnack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buttonMeat.mas_right).with.offset(0);
        make.top.equalTo(self.searchField.mas_bottom).with.offset(20);
        make.width.mas_equalTo(widthLarge);
        make.height.mas_equalTo(50);
    }];
    [_buttonLast addTarget:self action:@selector(pressFoodType:) forControlEvents:UIControlEventTouchUpInside];
    [_buttonMain addTarget:self action:@selector(pressFoodType:) forControlEvents:UIControlEventTouchUpInside];
    [_buttonMeat addTarget:self action:@selector(pressFoodType:) forControlEvents:UIControlEventTouchUpInside];
    [_buttonSnack addTarget:self action:@selector(pressFoodType:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 300, WIDTH, 400)];
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = YES;
    _scrollView.alwaysBounceVertical = NO;
    _scrollView.alwaysBounceHorizontal = NO;
    _scrollView.scrollEnabled = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(WIDTH * 4, 0);
    
    for (int i = 0; i < 6; i++) {
        UIButton *buttonFirstPage = [UIButton buttonWithType:UIButtonTypeCustom];
        [buttonFirstPage setBackgroundImage:[UIImage imageNamed:@"Rectangle 310.png"] forState:UIControlStateNormal];
        [buttonFirstPage setBackgroundImage:[UIImage imageNamed:@"Rectangle 309.png"] forState:UIControlStateSelected];
        NSString *stringFoodName = [NSString stringWithFormat:@"Last%d.png", i];
        [buttonFirstPage setImage:[UIImage imageNamed:stringFoodName] forState:UIControlStateNormal];
        buttonFirstPage.tag = i + 100;
        [buttonFirstPage addTarget:self action:@selector(selectFood:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:buttonFirstPage];
        if (i <= 2) {
            [buttonFirstPage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.scrollView.mas_left).with.offset(15 + i * 120);
                make.top.equalTo(self.scrollView.mas_top).with.offset(0);
                make.width.mas_equalTo(120);
                make.height.mas_equalTo(150);
            }];
        } else if (i > 2) {
            [buttonFirstPage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.scrollView.mas_left).with.offset(15 + (i-3) * 120);
                make.top.equalTo(self.scrollView.mas_top).with.offset(160);
                make.width.mas_equalTo(120);
                make.height.mas_equalTo(150);
            }];
        }
    }
    UIImageView *whiteBackImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Rectangle 125.png"]];
    [self.view addSubview:whiteBackImage];
    [whiteBackImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(23);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-30);
        make.width.mas_equalTo(WIDTH - 46);
        make.height.equalTo(@62);
    }];
    UIButton *buttonBackImage = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonBackImage setBackgroundImage:[UIImage imageNamed:@"Rectangle 126.png"] forState:UIControlStateNormal];
    [buttonBackImage setTitle:@"去发布" forState:UIControlStateNormal];
    buttonBackImage.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:25];
    [buttonBackImage setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonBackImage addTarget:self action:@selector(pressSend) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonBackImage];
    [buttonBackImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(whiteBackImage.mas_right).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-30);
        make.width.mas_equalTo(139);
        make.height.equalTo(@62);
    }];
    UIImageView *foddyImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"foddyImage.png"]];
    [self.view addSubview:foddyImage];
    [foddyImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(whiteBackImage.mas_left).with.offset(20);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-30);
        make.width.mas_equalTo(66);
        make.height.equalTo(@86);
    }];
    
    _labelMeal = [[UILabel alloc] init];
    [self.view addSubview:_labelMeal];
    [_labelMeal mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(whiteBackImage.mas_right).with.offset(-60);
        make.centerY.equalTo(whiteBackImage.mas_centerY).multipliedBy(1.0);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
    _labelMeal.text = @"午餐选择";
    _labelMeal.textColor = [UIColor blackColor];
    _labelMeal.font = [UIFont fontWithName:@"Verdana-Bold" size:25];
    
    //设置主食
    UIButton *buttonSecondPage1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonSecondPage1 setBackgroundImage:[UIImage imageNamed:@"Rectangle 310.png"] forState:UIControlStateNormal];
    [buttonSecondPage1 setBackgroundImage:[UIImage imageNamed:@"Rectangle 309.png"] forState:UIControlStateSelected];
    [buttonSecondPage1 setImage:[UIImage imageNamed:@"Last0.png"] forState:UIControlStateNormal];
    [buttonSecondPage1 addTarget:self action:@selector(selectFood:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:buttonSecondPage1];
    [buttonSecondPage1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollView.mas_left).with.offset(15 + WIDTH);
        make.top.equalTo(self.scrollView.mas_top).with.offset(0);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(150);
    }];
    
    UIButton *buttonSecondPage = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonSecondPage setBackgroundImage:[UIImage imageNamed:@"Rectangle 310.png"] forState:UIControlStateNormal];
    [buttonSecondPage setBackgroundImage:[UIImage imageNamed:@"Rectangle 309.png"] forState:UIControlStateSelected];
    [buttonSecondPage setImage:[UIImage imageNamed:@"Last1.png"] forState:UIControlStateNormal];
    [buttonSecondPage addTarget:self action:@selector(selectFood:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:buttonSecondPage];
    [buttonSecondPage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonSecondPage1.mas_right).with.offset(0);
        make.top.equalTo(self.scrollView.mas_top).with.offset(0);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(150);
    }];
    
    //设置肉蛋菜奶
    for (int i = 0; i < 9; i++) {
        UIButton *buttonThirdPage = [UIButton buttonWithType:UIButtonTypeCustom];
        [buttonThirdPage setBackgroundImage:[UIImage imageNamed:@"Rectangle 310.png"] forState:UIControlStateNormal];
        [buttonThirdPage setBackgroundImage:[UIImage imageNamed:@"Rectangle 309.png"] forState:UIControlStateSelected];
        NSString *stringFoodName = [NSString stringWithFormat:@"Meat%d.png", i];
        [buttonThirdPage setImage:[UIImage imageNamed:stringFoodName] forState:UIControlStateNormal];
        buttonThirdPage.tag = i + 100;
        [buttonThirdPage addTarget:self action:@selector(selectFood:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:buttonThirdPage];
        if (i <= 2) {
            UILabel* meatOrMilk = [[UILabel alloc] init];
            [_scrollView addSubview:meatOrMilk];
            meatOrMilk.text = @"肉类/奶类";
            meatOrMilk.textColor = [UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0];
            [meatOrMilk mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.scrollView.mas_left).with.offset(20+ WIDTH*2);
                make.top.equalTo(self.scrollView.mas_top).with.offset(10);
                make.width.equalTo(@90);
                make.height.equalTo(@30);
            }];
            
            UIButton *buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
            [buttonRight setImage:[UIImage imageNamed:@"Vector.png"] forState:UIControlStateNormal];
            [_scrollView addSubview:buttonRight];
            [buttonRight mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.scrollView.mas_right).with.offset(-20+ WIDTH*3);
                make.top.equalTo(self.scrollView.mas_top).with.offset(10);
                make.width.equalTo(@40);
                make.height.equalTo(@40);
            }];
            
            
            [buttonThirdPage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.scrollView.mas_left).with.offset(15 + i * 120 + WIDTH*2);
                make.top.equalTo(meatOrMilk.mas_bottom).with.offset(0);
                make.width.mas_equalTo(120);
                make.height.mas_equalTo(150);
            }];
        } else if (i <= 5) {
            UILabel* vegetable = [[UILabel alloc] init];
            [_scrollView addSubview:vegetable];
            vegetable.text = @"蔬菜";
            vegetable.textColor = [UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0];
            [vegetable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.scrollView.mas_left).with.offset(20 + WIDTH*2);
                make.top.equalTo(self.scrollView.mas_top).with.offset(200);
                make.width.equalTo(@90);
                make.height.equalTo(@30);
            }];
            
            UIButton *buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
            [buttonRight setImage:[UIImage imageNamed:@"Vector.png"] forState:UIControlStateNormal];
            [_scrollView addSubview:buttonRight];
            [buttonRight mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.scrollView.mas_right).with.offset(-20 + WIDTH*3);
                make.top.equalTo(vegetable.mas_top).with.offset(0);
                make.width.equalTo(@40);
                make.height.equalTo(@40);
            }];
            
            [buttonThirdPage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.scrollView.mas_left).with.offset(15 + (i-3) * 120 + WIDTH*2);
                make.top.equalTo(vegetable.mas_bottom).with.offset(0);
                make.width.mas_equalTo(120);
                make.height.mas_equalTo(150);
            }];
        } else if (i <= 8) {
            UILabel* egg = [[UILabel alloc] init];
            [_scrollView addSubview:egg];
            egg.text = @"豆类/蛋类";
            egg.textColor = [UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0];
            [egg mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.scrollView.mas_left).with.offset(20 + WIDTH*2);
                make.top.equalTo(self.scrollView.mas_top).with.offset(400);
                make.width.equalTo(@90);
                make.height.equalTo(@30);
            }];
            
            UIButton *buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
            [buttonRight setImage:[UIImage imageNamed:@"Vector.png"] forState:UIControlStateNormal];
            [_scrollView addSubview:buttonRight];
            [buttonRight mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.scrollView.mas_right).with.offset(-20 + WIDTH*3);
                make.top.equalTo(egg.mas_top).with.offset(0);
                make.width.equalTo(@40);
                make.height.equalTo(@40);
            }];
            
            [buttonThirdPage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.scrollView.mas_left).with.offset(15 + (i-3) * 120 + WIDTH*2);
                make.top.equalTo(egg.mas_bottom).with.offset(10);
                make.width.mas_equalTo(120);
                make.height.mas_equalTo(150);
            }];
        }
    }
    
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == 0) {
        [self pressFoodType:self.buttonLast];
    } else if (scrollView.contentOffset.x == WIDTH) {
        [self pressFoodType:self.buttonMain];
    } else if (scrollView.contentOffset.x == WIDTH * 2) {
        [self pressFoodType:self.buttonMeat];
    } else {
        [self pressFoodType:self.buttonSnack];
    }
}
- (void)pressFoodType:(UIButton*)button {
    if ([button isEqual:self.buttonLast]) {
        self.buttonLast.selected = YES;
        self.buttonMain.selected = NO;
        self.buttonMeat.selected = NO;
        self.buttonSnack.selected = NO;
        [self.scrollView setContentOffset:CGPointMake(0, 0)];
    } else if ([button isEqual:self.buttonMain]) {
        self.buttonLast.selected = NO;
        self.buttonMain.selected = YES;
        self.buttonMeat.selected = NO;
        self.buttonSnack.selected = NO;
        [self.scrollView setContentOffset:CGPointMake(WIDTH, 0)];
    } else if ([button isEqual:self.buttonMeat]) {
        self.buttonLast.selected = NO;
        self.buttonMain.selected = NO;
        self.buttonMeat.selected = YES;
        self.buttonSnack.selected = NO;
        [self.scrollView setContentOffset:CGPointMake(WIDTH * 2, 0)];
    } else {
        self.buttonLast.selected = NO;
        self.buttonMain.selected = NO;
        self.buttonMeat.selected = NO;
        self.buttonSnack.selected = YES;
        [self.scrollView setContentOffset:CGPointMake(WIDTH * 3, 0)];
    }
}
- (void)buttonEvent:(UIButton*)button {
    if ([button isEqual:self.buttonBreakfast]) {
        if (button.selected == NO) {
            self.buttonBreakfast.selected = YES;
            self.buttonLunch.selected = NO;
            self.buttonDinner.selected = NO;
            self.buttonAdd.selected = NO;
            self.buttonBreakfast.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:30];
            self.buttonLunch.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
            self.buttonDinner.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
            self.buttonAdd.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
        }
        
    } else if ([button isEqual:self.buttonLunch]) {
        if (button.selected == NO) {
            self.buttonBreakfast.selected = NO;
            self.buttonLunch.selected = YES;
            self.buttonDinner.selected = NO;
            self.buttonAdd.selected = NO;
            self.buttonBreakfast.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
            self.buttonLunch.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:30];
            self.buttonDinner.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
            self.buttonAdd.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
        }
        
    } else if ([button isEqual:self.buttonDinner]) {
        if (button.selected == NO) {
            self.buttonBreakfast.selected = NO;
            self.buttonLunch.selected = NO;
            self.buttonDinner.selected = YES;
            self.buttonAdd.selected = NO;
            self.buttonBreakfast.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
            self.buttonLunch.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
            self.buttonDinner.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:30];
            self.buttonAdd.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
        }
        
    } else {
        if (button.selected == NO) {
            self.buttonBreakfast.selected = NO;
            self.buttonLunch.selected = NO;
            self.buttonDinner.selected = NO;
            self.buttonAdd.selected = YES;
            self.buttonBreakfast.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
            self.buttonLunch.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
            self.buttonDinner.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
            self.buttonAdd.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:30];
        }
        
    }
}

- (void)selectFood:(UIButton*)button {
    button.selected = !button.selected;
    
}
- (void)pressReturn {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void) pressSend {
    MenuViewController *menu = [[MenuViewController alloc] init];
    [self presentViewController:menu animated:YES completion:nil];
}
@end
