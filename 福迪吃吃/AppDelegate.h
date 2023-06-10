//
//  AppDelegate.h
//  福迪吃吃
//
//  Created by 张思扬 on 2023/6/7.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
/// 通过AppDelegate是实现旋转，解决部分页面强制旋转
/// 屏幕支持的方法方向
@property (nonatomic, assign) UIInterfaceOrientationMask orientations;

@end

