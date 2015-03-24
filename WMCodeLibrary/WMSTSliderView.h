//
//  WMSTSliderView.h
//  WMCodeLibrary
//
//  Created by wangwendong on 15/3/24.
//  Copyright (c) 2015年 WM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMSTSliderView : UIView

/** 
 *  初始化方法
 *  borderColor : 外围框色
 *  bestColor : 最佳范围块的颜色
 *  progressColor : 进度条的颜色
 */
- (void)buildFrontLayerBorderColor:(UIColor*)borderColor bestLayerColor:(UIColor*)bestColor progressColor:(UIColor*)progressColor;


- (void)buildBestLayerBegin:(CGFloat)begin end:(CGFloat)end;

/**
 *  更新进度条的值 
 *  current : 进度条新值
 */
- (void)updateCurrent:(CGFloat)current;

@property (nonatomic) CGFloat current;

@end
