//
//  LineObj.h
//  WQImageSelector
//
//  Created by gongweiqiang on 2017/8/16.
//  Copyright © 2017年 gongweiqiang. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface LineObj : NSObject

@property (nonatomic,assign) CGPoint beginP;
@property (nonatomic,assign) CGPoint endP;
@property (nonatomic,strong) UIColor *color;

@end
