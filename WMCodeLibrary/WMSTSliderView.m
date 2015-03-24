//
//  WMSTSliderView.m
//  WMCodeLibrary
//
//  Created by wangwendong on 15/3/24.
//  Copyright (c) 2015年 WM. All rights reserved.
//

#import "WMSTSliderView.h"

@interface WMSTSliderView()

@property (nonatomic, strong) CAShapeLayer* progressLayer;
@property (nonatomic, strong) UIBezierPath* progressPath;
@property (nonatomic, strong) CALayer* frontLayer;
@property (nonatomic, strong) CALayer* bestLayer;

@end

@implementation WMSTSliderView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self buildBasic];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self buildBasic];
    }
    return self;
}

- (void)buildBasic {
    [self buildFrontLayerBorderColor:[UIColor redColor] bestLayerColor:[UIColor magentaColor] progressColor:[UIColor yellowColor]];
    
    [self buildBestLayerBegin:0.4 end:0.6];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self updateCurrent:0.54];
    });
}

- (void)buildFrontLayerBorderColor:(UIColor*)borderColor bestLayerColor:(UIColor*)bestColor progressColor:(UIColor*)progressColor {
    self.layer.cornerRadius = self.bounds.size.height / 2;
    self.layer.masksToBounds = YES;
    self.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    _frontLayer = [CALayer layer];
    _frontLayer.frame = self.bounds;
    _frontLayer.borderColor = borderColor.CGColor;
    _frontLayer.borderWidth = 1;
    _frontLayer.cornerRadius = self.bounds.size.height / 2;
    _frontLayer.shadowColor = borderColor.CGColor;
    _frontLayer.shadowOffset = CGSizeZero;
    _frontLayer.shadowOpacity = 1.0;
    _frontLayer.shadowRadius = 1;
    [self.layer addSublayer:_frontLayer];
    _bestLayer = [CALayer layer];
    _bestLayer.frame = CGRectZero;
    _bestLayer.backgroundColor = [UIColor magentaColor].CGColor;
    _bestLayer.opacity = 0.8;
    [self.layer addSublayer:_bestLayer];
    
    [self buildProgressLayerColor:progressColor];
}

// 最佳值的取值范围 0.0 - 1.0
- (void)buildBestLayerBegin:(CGFloat)begin end:(CGFloat)end {
    CGFloat width = (end - begin) * self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat x = begin * self.bounds.size.width;
    CGFloat y = 0;
//    NSLog(@"%lf, %lf, %lf, %lf", x, y, width, height);
    CGRect bestRect = CGRectMake(x, y, width, height);
    _bestLayer.frame = bestRect;
}

- (void)buildProgressLayerColor:(UIColor*)progressColor {
    _progressPath = [UIBezierPath bezierPath];
    [_progressPath moveToPoint:CGPointMake(0, self.bounds.size.height / 2)];
    [_progressPath addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height / 2)];
    _progressLayer = [CAShapeLayer layer];
//    _progressLayer.frame = self.layer.bounds;
    _progressLayer.path = _progressPath.CGPath;
//    _progressLayer.borderColor = [UIColor clearColor].CGColor;
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
    _progressLayer.strokeColor = [UIColor purpleColor].CGColor;
    _progressLayer.lineWidth = self.bounds.size.height;
    _progressLayer.strokeStart = 0.0;
    _progressLayer.strokeEnd = 0.0;
    _current = 0.0;
    [self.layer insertSublayer:_progressLayer below:_frontLayer];
}

// 更新进度条的值
- (void)updateCurrent:(CGFloat)current {
    dispatch_async(dispatch_get_main_queue(), ^ {
        [UIView animateWithDuration:0.2 animations:^ {
            _progressLayer.strokeEnd = current;
        }];
    });
    _current = current;
}

@end
