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
    
    [self.paintImageVIew.imageView saveImageResultHandle:^(BOOL isSuc) {
        if (isSuc) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"message" message:@"保存图片成功" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ac = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:ac];
            [self presentViewController:alert animated:YES completion:nil];
        }else{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"message" message:@"保存图片失败" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ac = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:ac];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}


- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cleanAction:(id)sender {
//    [self.paintImageVIew cleanPaintView];
    [self saveImageToPhone];
}


@end
