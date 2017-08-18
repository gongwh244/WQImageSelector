//
//  EditImageView.h
//  WQImageSelector
//
//  Created by gongweiqiang on 2017/8/17.
//  Copyright © 2017年 gongweiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LineObj.h"

typedef void(^resultBlock)(BOOL isSuc);

@interface EditImageView : UIImageView

@property (nonatomic,strong) NSMutableArray *lineArr;
@property (nonatomic,assign) CGPoint tmpP;


- (void)saveImageResultHandle:(resultBlock)result;

@property (nonatomic,copy) resultBlock myBlock;
@end
