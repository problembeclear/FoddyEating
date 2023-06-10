//
//  FoddyController.m
//  福迪吃吃
//
//  Created by 张思扬 on 2023/6/9.
//

#import "FoddyController.h"
#import "FoddyView.h"
#import "Masonry.h"

@interface FoddyController ()
@property (strong, nonatomic) FoddyView *foddyView;
@end

@implementation FoddyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.foddyView = [[FoddyView alloc] init];
    [self.foddyView setSelf];
    [self.view addSubview:self.foddyView];
    [self.foddyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(0);
        make.top.equalTo(self.view).with.offset(0);
        make.bottom.equalTo(self.view).with.offset(0);
        make.right.equalTo(self.view).with.offset(0);
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(exitToSignIn) name:@"exitToSign" object:nil];
}

- (void) exitToSignIn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}






@end
