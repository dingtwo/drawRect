//
//  ViewController.m
//  贝塞尔Test
//
//  Created by 丁建忠 on 15/12/4.
//  Copyright © 2015年 丁建忠. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    CGRect rect = CGRectMake(50, 50, 50, 50);
//    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
//    //CALayer的子类
//    CAShapeLayer *layer = [CAShapeLayer new];
//    //轮廓的颜色
//    layer.strokeColor = [UIColor greenColor].CGColor;
//    //填充颜色
//    layer.fillColor = [UIColor yellowColor].CGColor;
//    //轮廓线宽度
//    layer.lineWidth = 1;
//    //路径
//    layer.path = bezierPath.CGPath;
//    layer.frame = rect;
//    [bezierPath moveToPoint:CGPointMake(100, 0)];
//    [self.view.layer addSublayer:layer];
    self.view.backgroundColor = [UIColor whiteColor];
    DrawView *drawView = [[DrawView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:drawView];
    //    DJZBezierPathView *pathView = [[DJZBezierPathView alloc] initWithFrame:CGRectMake(0, 200, CGRectGetWidth(self.view.frame), 200)];
//    pathView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:pathView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
