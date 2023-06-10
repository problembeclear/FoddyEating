//
//  Sign_in_ViewController.m
//  福迪吃吃
//
//  Created by 张思扬 on 2023/6/8.
//

#import "Sign_in_ViewController.h"
#import "Masonry.h"
#import "FoddyController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface Sign_in_ViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl* pageControl;
@end

@implementation Sign_in_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:115.0/255 green:71.0/255 blue:253.0/255 alpha:1];
    
    [self initScrollView];
    [self labelTitle];
    [self imageViewOnly];
    [self textFieldUsername];
    [self textFieldPassword];
    [self buttonEntrance];
    
}
- (void) initScrollView {
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    self.scrollView.contentSize = CGSizeMake(WIDTH*2, 0);
    [self.view addSubview:_scrollView];
    _scrollView.delegate = self;
    
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.alwaysBounceVertical = NO;
    self.scrollView.alwaysBounceHorizontal = NO;
    self.scrollView.pagingEnabled = YES;
    
    
    
    
    
    
    
    _pageControl = [[UIPageControl alloc]init];
    [self.scrollView addSubview:_pageControl];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scrollView.mas_centerX);
        make.bottom.equalTo(self.scrollView.mas_bottom).with.offset(-10);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(10);
    }];
    
    _pageControl.numberOfPages = 2;
    
    _pageControl.currentPage = 0;
    
    [_pageControl.layer setCornerRadius:20];
    
    [_pageControl setBackgroundColor: [UIColor clearColor]];
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    
    [self.scrollView addSubview:_pageControl];
    

}
- (void) labelTitle {
    UILabel* labelParents = [[UILabel alloc] init];
    labelParents.text = @"Parents Access";
    
    
}
- (UIImageView*) imageViewOnly {
    UIImageView *imageViewOnly = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    [self.scrollView addSubview:imageViewOnly];
    [imageViewOnly mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(120);
        make.left.equalTo(self.scrollView).with.offset(WIDTH/2.0-60.0);
        make.top.equalTo(self.scrollView).with.offset(HEIGHT*0.2);
    }];
    return imageViewOnly;
}
- (UITextField*) textFieldUsername {
    UITextField *username = [[UITextField alloc] init];
    username.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:username];
    [username mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(240);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(self.scrollView.mas_centerX);
        make.centerY.equalTo(self.scrollView.mas_centerY).multipliedBy(0.9);
    }];
    username.clipsToBounds = YES;
    username.layer.cornerRadius = 10;
    UILabel *labelUsername = [[UILabel alloc] init];
    labelUsername.text = @"账 号";
    labelUsername.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:labelUsername];
    [labelUsername mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
        make.left.equalTo(username).with.offset(0);
        make.bottom.equalTo(username).with.offset(-50);
    }];
    return username;
}

- (UITextField*) textFieldPassword {
    UITextField *password = [[UITextField alloc] init];
    password.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:password];
    [password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(240);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(self.scrollView.mas_centerX);
        make.centerY.equalTo(self.scrollView.mas_centerY).multipliedBy(1.2);
    }];
    password.clipsToBounds = YES;
    password.layer.cornerRadius = 10;
    
    UILabel *labelPassword = [[UILabel alloc] init];
    labelPassword.text = @"密 码";
    labelPassword.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:labelPassword];
    [labelPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
        make.left.equalTo(password).with.offset(0);
        make.bottom.equalTo(password).with.offset(-50);
    }];
    return password;
}
- (UIButton*) buttonEntrance {
    UIButton *buttonEntrance = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollView addSubview:buttonEntrance];
    [buttonEntrance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(60);
        make.centerX.equalTo(self.scrollView.mas_centerX);
        make.centerY.equalTo(self.scrollView.mas_centerY).multipliedBy(1.5);
    }];
    [buttonEntrance setImage:[UIImage imageNamed:@"xiangyoujiantou.png"] forState:UIControlStateNormal];
    [buttonEntrance addTarget:self action:@selector(goToFoddy) forControlEvents:UIControlEventTouchUpInside];
    return buttonEntrance;
}

- (void) goToFoddy {
    FoddyController* foddyController = [[FoddyController alloc] init];
    foddyController.modalPresentationStyle = UIModalPresentationFullScreen;
    foddyController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    [self presentViewController:foddyController animated:YES completion:nil];
    
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];

}

@end
