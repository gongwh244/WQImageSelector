//
//  PaintDemoViewController.m
//  WQImageSelector
//
//  Created by jessegong on 2017/8/14.
//  Copyright © 2017年 gongweiqiang. All rights reserved.
//

#import "PaintDemoViewController.h"

@interface PaintDemoViewController ()
@property (weak, nonatomic) IBOutlet UIView *paintView;

@end

@implementation PaintDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}


































- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
