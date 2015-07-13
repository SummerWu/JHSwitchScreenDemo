//
//  JHRotatoUtil.h
//  JHSwitchScreenDemo
//
//  Created by DamonNG on 15/7/13.
//  Copyright (c) 2015年 JiehaoWu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JHRotatoUtil : NSObject

/**
 *  切换横竖屏
 *
 *  @param orientation ：UIInterfaceOrientation
 */
+ (void)forceOrientation: (UIInterfaceOrientation)orientation;

/**
 *  判断是否竖屏
 *
 *  @return 布尔值
 */
+ (BOOL)isOrientationLandscape;

@end
