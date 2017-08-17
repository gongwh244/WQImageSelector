//
//  ImagePaintDemoViewController.m
//  WQImageSelector
//
//  Created by gongweiqiang on 2017/8/17.
//  Copyright © 2017年 gongweiqiang. All rights reserved.
//

#import "ImagePaintDemoViewController.h"
#import "PaintImageView.h"

@interface ImagePaintDemoViewController ()
@property (strong, nonatomic)  PaintImageView *paintImageVIew;

@end

@implementation ImagePaintDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.paintImageVIew = [[PaintImageView alloc] initWithFrame:CGRectMake(0, 51, Screen_width, Screen_height - 51)];
    [self.view addSubview:self.paintImageVIew];
    
}

- (void)saveImageToPhone{
    [self.paintImageVIew.imageView saveImage];
}


- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cleanAction:(id)sender {
//    [self.paintImageVIew cleanPaintView];
    [self saveImageToPhone];
}


@end
