//
//  WMSliderViewController.m
//  WMCodeLibrary
//
//  Created by wangwendong on 15/3/24.
//  Copyright (c) 2015年 WM. All rights reserved.
//

#import "WMSliderViewController.h"

@interface WMSliderViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation WMSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    NSLog(@"%lf, %lf", _scrollView.frame.origin.x, _scrollView.frame.origin.y);
}

@end
