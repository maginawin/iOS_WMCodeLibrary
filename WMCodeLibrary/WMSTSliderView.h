//
//  WMSTSliderView.h
//  WMCodeLibrary
//
//  Created by wangwendong on 15/3/24.
//  Copyright (c) 2015年 WM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMSTSliderView : UIView

- (void)buildFrontLayerBorderColor:(UIColor*)borderColor bestLayerColor:(UIColor*)bestColor progressColor:(UIColor*)progressColor;

- (void)updateCurren:(CGFloat)current;

@property (nonatomic) CGFloat current;

@end
