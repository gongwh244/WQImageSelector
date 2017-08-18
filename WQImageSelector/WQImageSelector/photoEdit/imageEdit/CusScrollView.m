//
//  CusScrollView.m
//  WQImageSelector
//
//  Created by gongweiqiang on 2017/8/17.
//  Copyright © 2017年 gongweiqiang. All rights reserved.
//

#import "CusScrollView.h"

@implementation CusScrollView

- (BOOL)touchesShouldBegin:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view{
    return YES;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view{
    return NO;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches) {
        CGPoint p = [touch locationInView:self];
        NSLog(@"x = %f,y = %f",p.x,p.y);
    }
}

@end
