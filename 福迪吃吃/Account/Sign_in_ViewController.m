//
//  Sign_in_ViewController.m
//  福迪吃吃
//
//  Created by 张思扬 on 2023/6/8.
//

#import "Sign_in_ViewController.h"
#import "Masonry.h"
#import "RecordViewController.h"
#import "PublishViewController.h"
#import "ShopViewController.h"
#import "MineViewController.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface Sign_in_ViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl* pageControl;
@property (nonatomic, strong) UITabBarController *tabController;
@property (nonatomic, strong) UITextField *password;
@property (nonatomic, strong) UITextField *username;
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
    [self buttonSignUpAndModify];
    [self buttonAccept];
    
}
- (void) initScrollView {
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    self.scrollView.contentSize = CGSizeMake(WIDTH*2, 0);
    [self.view addSubview:_scrollView];
    self.scrollView.delegate = self;
    
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
    
    RecordViewController *recordViewController = [[RecordViewController alloc] init];
    PublishViewController *publishViewController = [[PublishViewController alloc] init];
    ShopViewController *shopViewController = [[ShopViewController alloc] init];
    MineViewController *mineViewController = [[MineViewController alloc] init];
    
    recordViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"记录" image:[[UIImage imageNamed:@"记录.png"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]  selectedImage:[[UIImage imageNamed:@"Frame 59.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    publishViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发布" image:[[UIImage imageNamed:@"美食.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Frame 61.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    shopViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"商场" image:[[UIImage imageNamed:@"商场.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Frame 68.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    mineViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"我的.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Frame 69.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    NSDictionary *recordNomal = [NSDictionary dictionaryWithObject: [UIColor grayColor] forKey:NSForegroundColorAttributeName];
    NSDictionary *recordSelected = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0] forKey:NSForegroundColorAttributeName];
    [[UITabBarItem appearance] setTitleTextAttributes:recordNomal forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:recordSelected forState:UIControlStateSelected];
    
    
    UINavigationController *record = [[UINavigationController alloc] initWithRootViewController:recordViewController];
    UINavigationController *publish = [[UINavigationController alloc] initWithRootViewController:publishViewController];
    UINavigationController *shop = [[UINavigationController alloc] initWithRootViewController:shopViewController];
    UINavigationController *mine = [[UINavigationController alloc] initWithRootViewController:mineViewController];
    
    UINavigationBarAppearance* appear = [[UINavigationBarAppearance alloc] init];
    [appear configureWithOpaqueBackground];
    appear.backgroundColor = [UIColor whiteColor];
    appear.shadowColor = [UIColor purpleColor];
    
    record.navigationBar.standardAppearance = appear;
    record.navigationBar.scrollEdgeAppearance = appear;
    
    publish.navigationBar.standardAppearance = appear;
    publish.navigationBar.scrollEdgeAppearance = appear;
    
    shop.navigationBar.standardAppearance = appear;
    shop.navigationBar.scrollEdgeAppearance = appear;
    
    mine.navigationBar.standardAppearance = appear;
    mine.navigationBar.scrollEdgeAppearance = appear;
    
    NSArray *arrayForTabbar = @[record, publish, shop, mine];
    

    _tabController = [[UITabBarController alloc] init];
    _tabController.viewControllers = arrayForTabbar;
    //背景色
    _tabController.tabBar.backgroundColor = [UIColor whiteColor];
    //透明度
    _tabController.tabBar.translucent = NO;
    //呈现风格
    _tabController.modalPresentationStyle = UIModalPresentationFullScreen;
    //初始所在界面
    _tabController.selectedIndex = 0;
}
- (void) labelTitle {
    UILabel* labelParents = [[UILabel alloc] init];
    labelParents.text = @"Parents Access";
    
    
}
- (UIImageView*) imageViewOnly {
    UIImageView *imageViewOnly = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Ellipse 2.png"]];
    [self.scrollView addSubview:imageViewOnly];
    [imageViewOnly mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(120);
        make.left.equalTo(self.scrollView).with.offset(WIDTH/2.0-60.0);
        make.top.equalTo(self.scrollView).with.offset(HEIGHT*0.1);
    }];
    return imageViewOnly;
}
- (UITextField*) textFieldUsername {
    _username = [[UITextField alloc] init];
    _username.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:_username];
    [_username mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(240);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(self.scrollView.mas_centerX);
        make.centerY.equalTo(self.scrollView.mas_centerY).multipliedBy(0.7);
    }];
    _username.clipsToBounds = YES;
    _username.layer.cornerRadius = 10;
    _username.textAlignment = NSTextAlignmentCenter;
    _username.delegate = self;
    _username.returnKeyType = UIReturnKeyDone;
    
    UILabel *labelUsername = [[UILabel alloc] init];
    labelUsername.text = @"账 号";
    labelUsername.font = [UIFont boldSystemFontOfSize:20];
    labelUsername.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:labelUsername];
    [labelUsername mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
        make.left.equalTo(self.username).with.offset(0);
        make.bottom.equalTo(self.username).with.offset(-50);
    }];
    return self.username;
}

- (UITextField*) textFieldPassword {
    _password = [[UITextField alloc] init];
    _password.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:_password];
    [_password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(240);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(self.scrollView.mas_centerX);
        make.centerY.equalTo(self.scrollView.mas_centerY).multipliedBy(0.9);
    }];
    _password.clipsToBounds = YES;
    _password.layer.cornerRadius = 10;
    _password.textAlignment = NSTextAlignmentCenter;
    [_password setSecureTextEntry:YES];
    _password.delegate = self;
    _password.returnKeyType = UIReturnKeyDone;
    
    UILabel *labelPassword = [[UILabel alloc] init];
    labelPassword.text = @"密 码";
    labelPassword.font = [UIFont boldSystemFontOfSize:20];
    labelPassword.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:labelPassword];
    [labelPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
        make.left.equalTo(self.password).with.offset(0);
        make.bottom.equalTo(self.password).with.offset(-50);
    }];
    return self.password;
}
- (void)buttonSignUpAndModify {
    UIButton *buttonSignUp = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonSignUp setTitle:@"快速注册" forState:UIControlStateNormal];
    [buttonSignUp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.scrollView addSubview:buttonSignUp];
    [buttonSignUp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.password.mas_left).with.offset(5);
        make.top.equalTo(self.password.mas_bottom).with.offset(10);
        make.width.equalTo(@90);
        make.height.equalTo(@30);
    }];
    
    UIButton *buttonModify = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonModify setTitle:@"忘记密码" forState:UIControlStateNormal];
    [buttonModify setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.scrollView addSubview:buttonModify];
    [buttonModify mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.password.mas_right).with.offset(-5);
        make.top.equalTo(self.password.mas_bottom).with.offset(10);
        make.width.equalTo(@90);
        make.height.equalTo(@30);
    }];
}
- (void)buttonAccept {
    UIButton *buttonAccept = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonAccept setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [buttonAccept setImage:[UIImage imageNamed:@"Ellipse 52.png"] forState:UIControlStateSelected];
    [buttonAccept setTitle:@"已阅读并同意服务协议和隐私保护指引" forState:UIControlStateNormal];
    buttonAccept.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.scrollView addSubview:buttonAccept];
    [buttonAccept mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(1.0);
        make.top.equalTo(self.password.mas_bottom).with.offset(50);
        make.width.mas_equalTo(240);
        make.height.equalTo(@30);
    }];
    buttonAccept.selected = YES;
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
    
    [self presentViewController:_tabController animated:YES completion:nil];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //使虚拟键盘回收
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
