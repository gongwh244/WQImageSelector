//
//  ViewController.m
//  WQImageSelector
//
//  Created by gongweiqiang on 2017/8/13.
//  Copyright © 2017年 gongweiqiang. All rights reserved.
//

#import "ViewController.h"
#import "ZoomImageViewController.h"
#import "PaintDemoViewController.h"
#import "ImagePaintDemoViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)selectImageAction:(id)sender {
    
    ZoomImageViewController *vc = [[ZoomImageViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)paintAction:(id)sender {
    
    PaintDemoViewController *vc = [[PaintDemoViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)imageEditAction:(id)sender {
    ImagePaintDemoViewController *vc = [[ImagePaintDemoViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}


@end
