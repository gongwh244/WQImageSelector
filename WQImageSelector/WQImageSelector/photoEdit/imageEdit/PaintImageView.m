//
//  PaintImageView.m
//  WQImageSelector
//
//  Created by gongweiqiang on 2017/8/17.
//  Copyright © 2017年 gongweiqiang. All rights reserved.
//

#import "PaintImageView.h"
#import "LineObj.h"

#import "CusScrollView.h"

@interface PaintImageView ()<UIScrollViewDelegate>

@property (nonatomic,strong) CusScrollView *mainScrollView;

@property (nonatomic,strong) UIImage *image;

@end

@implementation PaintImageView



- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
         [self addSubview:self.mainScrollView];
    }
    return self;
}


#pragma mark - setter & getter

- (EditImageView *)imageView{
    if (!_imageView) {
        _imageView = [[EditImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.image.size.height>self.bounds.size.height ? self.image.size.height : self.bounds.size.height)];
        _imageView.image = self.image;
        _imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageView;
}

- (UIImage *)image{
    if (!_image) {
        _image = [UIImage imageNamed:@"joke.jpg"];
    }
    return _image;
}

- (CusScrollView *)mainScrollView{
    if (!_mainScrollView) {
        _mainScrollView = [[CusScrollView alloc] init];
        _mainScrollView.frame = self.bounds;
        _mainScrollView.backgroundColor = [UIColor blackColor];
        _mainScrollView.maximumZoomScale = 3.0;
        _mainScrollView.minimumZoomScale = 1.0;
        _mainScrollView.delegate = self;
        
        _mainScrollView.canCancelContentTouches = YES;
        _mainScrollView.delaysContentTouches = NO;
//        _mainScrollView.scrollEnabled = NO;
//        _mainScrollView.userInteractionEnabled = NO;
//        [_mainScrollView becomeFirstResponder];
        
        
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.contentSize = self.imageView.bounds.size;
        [_mainScrollView addSubview:self.imageView];
        self.imageView.center = self.mainScrollView.center;
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleAction:)];
        doubleTap.numberOfTapsRequired = 2;
        [_mainScrollView addGestureRecognizer:doubleTap];
    }
    return _mainScrollView;
}



- (void)doubleAction:(UITapGestureRecognizer *)tap{
    CGFloat scale = self.mainScrollView.zoomScale;
    if (scale == 1.0f) {
        scale = 2.0f;
    }else if(scale == 2.0f){
        scale = 1.0f;
    }else{
        scale = 2.0f;
    }
    [self.mainScrollView setZoomScale:scale animated:YES];
}
#pragma mark - scroll Delegate
#pragma mark - ScrollView Delegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
//    NSLog(@"x = %f",scrollView.contentSize.width);
//    NSLog(@"y = %f",scrollView.contentSize.height);
    CGFloat xcenter = scrollView.center.x , ycenter = scrollView.center.y;
    //目前contentsize的width是否大于原scrollview的contentsize，如果大于，设置imageview中心x点为contentsize的一半，
    //    以固定imageview在该contentsize中心。如果不大于说明图像的宽还没有超出屏幕范围，可继续让中心x点为屏幕中点，此种情况确保图像在屏幕中心。
    xcenter = scrollView.contentSize.width > scrollView.frame.size.width ? scrollView.contentSize.width/2 : xcenter;
    ycenter = scrollView.contentSize.height > scrollView.frame.size.height ? scrollView.contentSize.height/2 : ycenter;
    [self.imageView setCenter:CGPointMake(xcenter, ycenter)];
}



@end
