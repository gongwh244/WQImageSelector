//
//  PaintView.h
//  WQImageSelector
//
//  Created by gongweiqiang on 2017/8/16.
//  Copyright © 2017年 gongweiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaintView : UIView

@property (nonatomic,strong) NSMutableArray *lineArr;
@property (nonatomic,assign) CGPoint tmpP;

- (void)cleanPaintView;

@end
