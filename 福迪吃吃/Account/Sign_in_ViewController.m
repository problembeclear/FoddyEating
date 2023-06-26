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
    
    RecordViewController *recordViewController = [[RecordViewController alloc] init];
    PublishViewController *publishViewController = [[PublishViewController alloc] init];
    ShopViewController *shopViewController = [[ShopViewController alloc] init];
    MineViewController *mineViewController = [[MineViewController alloc] init];
    
    recordViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"记录" image:[[UIImage imageNamed:@"记录.png"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]  selectedImage:[[UIImage imageNamed:@"Frame 59.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    

    publishViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发布" image:[[UIImage imageNamed:@"美食.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Frame 61.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    shopViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"商场" image:[[UIImage imageNamed:@"商场.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Ellipse 94.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    mineViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"我的.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Ellipse 94.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
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
    UITextField *username = [[UITextField alloc] init];
    username.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:username];
    [username mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(240);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(self.scrollView.mas_centerX);
        make.centerY.equalTo(self.scrollView.mas_centerY).multipliedBy(0.7);
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
        make.centerY.equalTo(self.scrollView.mas_centerY).multipliedBy(0.9);
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
    
    
    [self presentViewController:_tabController animated:YES completion:nil];
}

@end
