//
//  RecordViewController.m
//  福迪吃吃
//
//  Created by 张思扬 on 2023/6/26.
//

#import "RecordViewController.h"

@interface RecordViewController ()

@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backImage"]];
    backImage.frame = CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height - 133);
    [self.view addSubview:backImage];
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
