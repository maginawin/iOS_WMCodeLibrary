//
//  WMDrawLayerVC.m
//  WMCodeLibrary
//
//  Created by wangwendong on 15/3/14.
//  Copyright (c) 2015年 WM. All rights reserved.
//

#import "WMDrawLayerVC.h"

@interface WMDrawLayerVC ()

// row 1
@property (nonatomic, strong) CALayer* mLayer;
@property (nonatomic, strong) UIView* mView;

// row 2
@property (nonatomic, strong) CALayer* topLayer;
@property (nonatomic, strong) CALayer* bottomLayer;
@property (nonatomic, strong) CALayer* leftLayer;
@property (nonatomic, strong) CALayer* rightLayer;
@property (nonatomic, strong) CALayer* frontLayer;
@property (nonatomic, strong) CALayer* backLayer;

@end

@implementation WMDrawLayerVC

//row 2
const CGFloat kSize = 100;
const CGFloat kPanScale = 1. / 100;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildViews];
}

// 初始化视图
- (void)buildViews {
    switch (_row) {
        case 0:
            [self addDrawLayerViewWithFrame:self.view.bounds];
            break;
        case 1:
            [self buildView1];
            break;
        case 2:
            [self buildRow2Views];
            break;
        case 3:
            [self buildRow3Views];
            break;
        case 4:
            [self buildRow4Views];
        default:
            break;
    }
}

// row 0
- (void)addDrawLayerViewWithFrame:(CGRect)frame {
    WMDrawLayerView* mView = [[WMDrawLayerView alloc] initWithFrame:frame];
    
    [self.view addSubview:mView];
}

// row 1
- (void)buildView1 {
    _mLayer = [CALayer layer];
    _mLayer.backgroundColor = [UIColor redColor].CGColor;
    _mLayer.frame = CGRectMake(100, 100, 20, 20);
    [self.view.layer addSublayer:_mLayer];
    
    _mView = [[UIView alloc] initWithFrame:CGRectMake(200, 100, 20, 20)];
    _mView.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:_mView];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(drop:)]];

//    [CATransaction setAnimationDuration:4];
}

- (void)drop:(UIGestureRecognizer*)sender {
    [_mLayer setPosition:CGPointMake(200, 250)];

    _mView.center = CGPointMake(100, 250);
}

// row 2
- (void)buildRow2Views {
    CATransform3D transform;
    transform = CATransform3DMakeTranslation(0, -kSize/2, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1.0, 0, 0);
    self.topLayer = [self layerWithColor:[UIColor redColor] transform:transform];
}


- (CALayer*)layerWithColor:(UIColor*)color transform:(CATransform3D)transform {
    CALayer* layer = [CALayer layer];
    layer.backgroundColor = [color CGColor];
    layer.bounds = CGRectMake(0, 0, kSize, kSize);
    layer.position = self.view.center;
    layer.transform = transform;
    [self.view.layer addSublayer:layer];
    return layer;
}

//static CATransform3D MakePerspectiveTransform() {
//    CATransform3D perspective = CATransform3DIdentity;
//    perspective.m34 = -1. / 200.;
//    return perspective;
//}

// row 3
- (void)buildRow3Views {
    CALayer* layer = [CALayer layer];
    layer.frame = CGRectMake(100, 100, 100, 100);
    layer.cornerRadius = 10;
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.borderWidth = 5;
    layer.shadowOpacity = 0.5;
    layer.shadowOffset = CGSizeMake(3, 3);
    [self.view.layer addSublayer:layer];
}

// row 4
- (void)buildRow4Views {
    WMCircleLayer* circleLayer = [WMCircleLayer new];
    circleLayer.radius = 19;
    circleLayer.frame = self.view.frame;
    [self.view.layer addSublayer:circleLayer];
}


@end
