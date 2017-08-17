//
//  EditImageView.h
//  WQImageSelector
//
//  Created by gongweiqiang on 2017/8/17.
//  Copyright © 2017年 gongweiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LineObj.h"

@interface EditImageView : UIImageView

@property (nonatomic,strong) NSMutableArray *lineArr;
@property (nonatomic,assign) CGPoint tmpP;

- (void)cleanPaintView;

- (void)saveImage;

@end
