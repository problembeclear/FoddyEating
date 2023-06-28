//
//  PublishViewController.m
//  福迪吃吃
//
//  Created by 张思扬 on 2023/6/26.
//

#import "PublishViewController.h"
#import "PublishView.h"
#import "Masonry.h"
#import "SelectFoodViewController.h"

@interface PublishViewController ()

@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    PublishView *publishView = [[PublishView alloc] init];
    [publishView setSelf];
    
    [self.view addSubview:publishView];
    [publishView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(0);
        make.right.equalTo(self.view).with.offset(0);
        make.top.equalTo(self.view).with.offset(0);
        make.bottom.equalTo(self.view).with.offset(0);
    }];
    [[NSNotificationCenter defaultCenter] addObserver: self selector:@selector(presentPublish) name:@"presentPublish" object:nil];
}
- (void)presentPublish {
    SelectFoodViewController *foodController = [[SelectFoodViewController alloc] init];
    foodController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:foodController animated:YES completion:nil];
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
