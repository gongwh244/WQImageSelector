//
//  EditImageView.m
//  WQImageSelector
//
//  Created by gongweiqiang on 2017/8/17.
//  Copyright © 2017年 gongweiqiang. All rights reserved.
//

#import "EditImageView.h"

@implementation EditImageView



- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.lineArr = [[NSMutableArray alloc] init];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)cleanPaintView{
    [self.lineArr removeAllObjects];
    [self setNeedsDisplay];
}



#pragma mark - Touch Method
- (void)paintImage{
    UIGraphicsBeginImageContext(self.image.size);
    [self.image drawInRect:CGRectMake(0, 0, self.image.size.width, self.image.size.height)];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5);
    CGContextSetLineCap(context, kCGLineCapRound);
    [UIColor.redColor set];
    
    [self.lineArr enumerateObjectsUsingBlock:^(LineObj *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj.color set];
        CGContextMoveToPoint(context, obj.beginP.x, obj.beginP.y);
        CGContextAddLineToPoint(context, obj.endP.x, obj.endP.y);
        CGContextStrokePath(context);
    }];
    
    
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}


- (void)saveImage{
    [self loadImageFinished:self.image];
}

- (void)loadImageFinished:(UIImage *)image
{
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
}


//- (void)drawRect:(CGRect)rect{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 5);
//    CGContextSetLineCap(context, kCGLineCapRound);
//    [UIColor.redColor set];
//    
//    [self.lineArr enumerateObjectsUsingBlock:^(LineObj *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [obj.color set];
//        CGContextMoveToPoint(context, obj.beginP.x, obj.beginP.y);
//        CGContextAddLineToPoint(context, obj.endP.x, obj.endP.y);
//        CGContextStrokePath(context);
//    }];
    
//    UIGraphicsBeginImageContext(self.image.size);
//    [self.image drawInRect:CGRectMake(0, 0, self.image.size.width, self.image.size.height)];
//    
//        CGContextRef context = UIGraphicsGetCurrentContext();
//        CGContextSetLineWidth(context, 5);
//        CGContextSetLineCap(context, kCGLineCapRound);
//        [UIColor.redColor set];
//    
//        [self.lineArr enumerateObjectsUsingBlock:^(LineObj *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            [obj.color set];
//            CGContextMoveToPoint(context, obj.beginP.x, obj.beginP.y);
//            CGContextAddLineToPoint(context, obj.endP.x, obj.endP.y);
//            CGContextStrokePath(context);
//        }];
//    
//    
//    self.image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint loc = [touches.anyObject locationInView:self];
    
    LineObj *line = [LineObj new];
    line.beginP = loc;
    line.endP = loc;
    [self.lineArr addObject:line];
    
    _tmpP = loc;
//    [self setNeedsDisplay];
    [self paintImage];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint loc = [touches.anyObject locationInView:self];
    
    LineObj *line = LineObj.new;
    line.beginP = _tmpP;
    line.endP = loc;
    [self.lineArr addObject:line];
    
    _tmpP = loc;
//    [self setNeedsDisplay];
    [self paintImage];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint loc = [touches.anyObject locationInView:self];
    
    LineObj *line = LineObj.new;
    line.beginP = _tmpP;
    line.endP = loc;
    [self.lineArr addObject:line];
    
//    [self setNeedsDisplay];
    [self paintImage];
}

@end
