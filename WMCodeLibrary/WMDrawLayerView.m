//
//  WMDrawLayerView.m
//  WMCodeLibrary
//
//  Created by wangwendong on 15/3/14.
//  Copyright (c) 2015年 WM. All rights reserved.
//

#import "WMDrawLayerView.h"

@implementation WMDrawLayerView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer setNeedsDisplay];
        [self.layer setContentsScale:[[UIScreen mainScreen] scale]];
    }
    return self;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    UIGraphicsPushContext(ctx);
    [[UIColor whiteColor] set];
    UIRectFill(layer.bounds);
    
    UIFont* font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    UIColor* color = [UIColor blackColor];
    
    NSMutableParagraphStyle* style = [NSMutableParagraphStyle new];
    [style setAlignment:NSTextAlignmentCenter];
    
    NSDictionary* attribs = @{NSFontAttributeName: font, NSForegroundColorAttributeName: color, NSParagraphStyleAttributeName: style};
    NSAttributedString* text = [[NSAttributedString alloc] initWithString:@"Pushing The Limits" attributes:attribs];
    
    [text drawInRect:CGRectInset([layer bounds], 10, 100)];
    UIGraphicsPopContext();
}

@end
