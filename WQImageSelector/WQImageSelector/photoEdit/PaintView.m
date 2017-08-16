//
//  PaintView.m
//  WQImageSelector
//
//  Created by gongweiqiang on 2017/8/16.
//  Copyright © 2017年 gongweiqiang. All rights reserved.
//

#import "PaintView.h"
#import "LineObj.h"

@implementation PaintView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.lineArr = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)cleanPaintView{
    [self.lineArr removeAllObjects];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
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
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint loc = [touches.anyObject locationInView:self];
    
    LineObj *line = [LineObj new];
    line.beginP = loc;
    line.endP = loc;
    [self.lineArr addObject:line];
    
    _tmpP = loc;
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint loc = [touches.anyObject locationInView:self];
    
    LineObj *line = LineObj.new;
    line.beginP = _tmpP;
    line.endP = loc;
    [self.lineArr addObject:line];
    
    _tmpP = loc;
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint loc = [touches.anyObject locationInView:self];
    
    LineObj *line = LineObj.new;
    line.beginP = _tmpP;
    line.endP = loc;
    [self.lineArr addObject:line];
    
    [self setNeedsDisplay];
}

@end
