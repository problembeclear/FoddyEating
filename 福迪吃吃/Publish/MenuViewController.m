//
//  MenuViewController.m
//  福迪吃吃
//
//  Created by 张思扬 on 2023/6/28.
//

#import "MenuViewController.h"
#import "Masonry.h"
#import "LabelFoodView.h"
#import "SuccessViewController.h"
@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *labelHead = [[UILabel alloc] init];
    labelHead.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60);
    labelHead.backgroundColor = [UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0];
    labelHead.text = @"发布菜单";
    labelHead.textAlignment = NSTextAlignmentCenter;
    labelHead.textColor = [UIColor whiteColor];
    labelHead.font = [UIFont fontWithName:@"Verdana-Bold" size:30];
    [self.view addSubview:labelHead];
    
    UILabel *labelMain = [[UILabel alloc] init];
    labelMain.text = @"主食";
    labelMain.textColor = [UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0];
    labelMain.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
    [self.view addSubview:labelMain];
    [labelMain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(30);
        make.top.equalTo(labelHead.mas_bottom).with.offset(10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
    }];

    
    LabelFoodView *cellView1 = [[LabelFoodView alloc] init];
    [cellView1 setSelf];
    [self.view addSubview:cellView1];
    [cellView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.top.equalTo(labelMain.mas_bottom).with.offset(0);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.height.mas_equalTo(120);
    }];
    //设置cellView
    [cellView1.buttonFood1 setImage:[UIImage imageNamed:@"IMG_4343 1-2.png"] forState:UIControlStateNormal];
    cellView1.labelName.text = @"米饭";
    cellView1.labelTrans.text = @"50g米饭 = 1";
    cellView1.imageFood.image = [UIImage imageNamed:@"IMG_4343 1-2.png"];
    
    
    UILabel *labelMeat = [[UILabel alloc] init];
    labelMeat.text = @"肉蛋菜奶";
    labelMeat.textColor = [UIColor colorWithRed:107/255.0 green:68/255.0 blue:255/255.0 alpha:1.0];
    labelMeat.font = [UIFont fontWithName:@"Verdana-Bold" size:20];
    [self.view addSubview:labelMeat];
    [labelMeat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelMain.mas_left).with.offset(0);
        make.top.equalTo(cellView1.mas_bottom).with.offset(0);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
    }];
    
    LabelFoodView *cellView2 = [[LabelFoodView alloc] init];
    [cellView2 setSelf];
    [self.view addSubview:cellView2];
    [cellView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.top.equalTo(labelMeat.mas_bottom).with.offset(0);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.height.mas_equalTo(120);
    }];
    //设置cellView
    [cellView2.buttonFood1 setImage:[UIImage imageNamed:@"IMG_3605 4.png"] forState:UIControlStateNormal];
    cellView2.labelName.text = @"卷心菜";
    cellView2.labelTrans.text = @"50g卷心菜=1";
    cellView2.imageFood.image = [UIImage imageNamed:@"IMG_3605 4.png"];
    
    LabelFoodView *cellView3 = [[LabelFoodView alloc] init];
    [cellView3 setSelf];
    [self.view addSubview:cellView3];
    [cellView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.top.equalTo(cellView2.mas_bottom).with.offset(0);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.height.mas_equalTo(120);
    }];
    //设置cellView
    [cellView3.buttonFood1 setImage:[UIImage imageNamed:@"duixia.png"] forState:UIControlStateNormal];
    cellView3.labelName.text = @"对虾";
    cellView3.labelTrans.text = @"50g对虾 = 1";
    cellView3.imageFood.image = [UIImage imageNamed:@"duixia.png"];
    
    UIButton *buttonForSend = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonForSend setBackgroundImage:[UIImage imageNamed:@"Rectangle 307.png"] forState:UIControlStateNormal];
    [buttonForSend setTitle:@"发 布" forState:UIControlStateNormal];
    buttonForSend.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:30];
    [buttonForSend setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:buttonForSend];
    [buttonForSend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-20);
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(1.0);
        make.width.equalTo(@300);
        make.height.equalTo(@70);
    }];
    [buttonForSend addTarget:self action:@selector(presentSucceed) forControlEvents:UIControlEventTouchUpInside];
}
- (void)presentSucceed {
    SuccessViewController *success = [[SuccessViewController alloc] init];
    [self presentViewController:success animated:YES completion:nil];
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
