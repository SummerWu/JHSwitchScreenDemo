//
//  ViewController.m
//  JHSwitchScreenDemo
//
//  Created by DamonNG on 15/7/13.
//  Copyright (c) 2015年 JiehaoWu. All rights reserved.
//

#import "ViewController.h"
#import "JHRotatoUtil.h"

#define CONTENTVIEW_TOP_ROOTVIEW_MARGIN 40

@interface ViewController ()
{
    UIInterfaceOrientation   _lastOrientation;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateViewConstraints {
    [super updateViewConstraints];
    if (IS_IPHONE6PLUS) {
        
    }
}

//iOS8旋转动作的具体执行
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator: coordinator];
    // 监察者将执行： 1.旋转前的动作  2.旋转后的动作（completion）
    [coordinator animateAlongsideTransition: ^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         if ([JHRotatoUtil isOrientationLandscape]) {
             _lastOrientation = [UIApplication sharedApplication].statusBarOrientation;
             [self p_prepareFullScreen];
         }
         else {
             [self p_prepareSmallScreen];
         }
     } completion: ^(id<UIViewControllerTransitionCoordinatorContext> context) {
     }];
    
}

//iOS7旋转动作的具体执行
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    if (toInterfaceOrientation == UIDeviceOrientationLandscapeRight || toInterfaceOrientation == UIDeviceOrientationLandscapeLeft) {
        _lastOrientation = [UIApplication sharedApplication].statusBarOrientation;
        [self p_prepareFullScreen];
    }
    else {
        [self p_prepareSmallScreen];
    }
}

#pragma mark - Private

// 切换成全屏的准备工作
- (void)p_prepareFullScreen {
    _rotatoButton.titleLabel.text = @"竖屏播放";
    _headerViewHeight.constant = 0;
    _contentViewBottomMargin.constant = 0;
}

// 切换成小屏的准备工作
- (void)p_prepareSmallScreen {
    _rotatoButton.titleLabel.text = @"横屏播放";
    _headerViewHeight.constant = 60;
    _contentViewBottomMargin.constant = 380;
}

#pragma mark - Action Methods
-(IBAction)rotatoButtonTouchUpInside:(id)sender {
    
    if([JHRotatoUtil isOrientationLandscape]) {
        [JHRotatoUtil forceOrientation: UIInterfaceOrientationPortrait];
    }
    else {
        [JHRotatoUtil forceOrientation: UIInterfaceOrientationLandscapeRight];
    }
}

@end
