//
//  SuccessViewController.m
//  福迪吃吃
//
//  Created by 张思扬 on 2023/6/29.
//

#import "SuccessViewController.h"

@interface SuccessViewController ()

@end

@implementation SuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageSu = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Success.png"]];
    imageSu.frame = CGRectMake(80, 220, [UIScreen mainScreen].bounds.size.width - 160, [UIScreen mainScreen].bounds.size.width - 160);
    [self.view addSubview:imageSu];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 440, [UIScreen mainScreen].bounds.size.width - 160, [UIScreen mainScreen].bounds.size.width - 160)];
    label.text = @"发布成功";
    label.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    
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
