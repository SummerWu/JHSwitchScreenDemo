//
//  ViewController.h
//  JHSwitchScreenDemo
//
//  Created by DamonNG on 15/7/13.
//  Copyright (c) 2015年 JiehaoWu. All rights reserved.
//

#import <UIKit/UIKit.h>

//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPhone 6 plus
#define IS_IPHONE6PLUS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
//判断是否为iPhone 6
#define IS_IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
//判断是否为iPhone 4/4S
#define IS_IPHONE4 ([UIScreen mainScreen].bounds.size.height <= 480)
//判断是否为Retina屏幕
#define IS_RETINA ([UIScreen mainScreen].scale == 2)


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView     *headerView;
@property (weak, nonatomic) IBOutlet UIView     *contentView;
@property (weak, nonatomic) IBOutlet UIButton   *rotatoButton;



@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewBottomMargin;
@end

