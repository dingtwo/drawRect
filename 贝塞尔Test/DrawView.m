//
//  DrawView.m
//  贝塞尔Test
//
//  Created by 丁建忠 on 15/12/4.
//  Copyright © 2015年 丁建忠. All rights reserved.
//

#import "DrawView.h"
#import <CoreGraphics/CoreGraphics.h>
@implementation DrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //An opaque type that represents a Quartz 2D drawing environment.

    CGContextRef context = [self creatContextRef];
    
//    [self drawLineWithContext:context];
//    [self drawCycle:context];
//    [self drawBezierWithContext:context];
//    [self drawCurveWithConText:context];
    [self drawShapeWithContext:context];
    


    
}

#pragma mark - 初始化画笔
- (CGContextRef)creatContextRef {
    //一个不透明的Quartz 2D绘画环境,简单理解为一块画板
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置画笔颜色
    //stroke描边
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    //设置画笔宽度
    CGContextSetLineWidth(context, 20);
    //设置填充颜色
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    //设置拐点样式
    //    typedef CF_ENUM(int32_t, CGLineJoin) {
    //        kCGLineJoinMiter, //斜接
    //        kCGLineJoinRound, //圆角
    //        kCGLineJoinBevel //斜角?
    //    };
    CGContextSetLineJoin(context, kCGLineJoinBevel);
    //设置线两端的样式
    //    typedef CF_ENUM(int32_t, CGLineCap) {
    //        kCGLineCapButt, //绘图时在准确的在终点完成
    //        kCGLineCapRound, //线两端以线宽的1/2为半径画弧结束,终点是弧的圆心
    //        kCGLineCapSquare //线两端结束在终点延生线宽的1/2
    //    };
    CGContextSetLineCap(context, kCGLineCapRound);
    return context;
}

#pragma mark - 画线方法1
- (void)drawLineOneWithContext:(CGContextRef)context {
    //1.设置一个点数组
    CGPoint point[] = {CGPointMake(0, 0), CGPointMake(100, 100), CGPointMake(20, 300)};
    //2.将几个点连接成线
    CGContextAddLines(context, point, 3);
    //3.绘制描边
    CGContextStrokePath(context);
}


#pragma mark - 画线方法2
- (void)drawLineTwoWithContext:(CGContextRef)context {
    //1.设置起始点
    CGContextMoveToPoint(context, 50, 50);
    //2.添加点来连线
    CGContextAddLineToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 150, 50);
    //3.绘制
    CGContextStrokePath(context);
}


#pragma mark - 画线方法3
- (void)drawLineThreeWithContext:(CGContextRef)context {
    //画线方法3:使用路径来画线
    CGMutablePathRef path = CGPathCreateMutable();
    //1.设置起点
    //CGAffineTransformIdentity 的作用是将 UIView 的 transform 恢复到初始状态，然后将透明度设为1。
    CGPathMoveToPoint(path, &CGAffineTransformIdentity, 0, 100);
    //2.添加下一个点
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 100, 100);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 150, 50);
    //3.给画笔设置路径
    CGContextAddPath(context, path);
    //4.绘制
    CGContextStrokePath(context);
}


#pragma mark - 画圆弧
- (void)drawCycle:(CGContextRef)context {
    //画圆
    //参数1:画笔
    //参数2:圆心x
    //参数3:圆心y
    //参数4:半径
    //参数5:开始角度
    //参数6:结束角度
    //参数7:0顺时针,1逆时针
    //画弧修改首尾角度即可
    CGContextAddArc(context, 100, 100, 50, M_PI, M_PI*2, 1);
    CGContextStrokePath(context);
}
#pragma mark - 绘制贝塞尔曲线
- (void)drawBezierWithContext:(CGContextRef)context {
    CGContextMoveToPoint(context, 100, 100);
    //端点p1和p2是弧线的控制点，类似photeshop中钢笔工具控制曲线
    //    void CGContextAddArcToPoint(
    //                                CGContextRef c,
    //                                CGFloat x1,  //端点1的x坐标
    //                                CGFloat y1,  //端点1的y坐标
    //                                CGFloat x2,  //端点2的x坐标
    //                                CGFloat y2,  //端点2的y坐标
    //                                CGFloat radius //半径
    //                                )；
    CGContextAddArcToPoint(context, 0, 50, 100, 200, 150);
    CGContextAddArcToPoint(context, 100, 200, 50, 50, 150);
    CGContextStrokePath(context);
}
#pragma mark - 绘制三次函数曲线
- (void)drawCurveWithConText:(CGContextRef)context {
/*
    CGContextMoveToPoint(context, 100, 100);
    //void CGContextAddCurveToPoint (
    //                               CGContextRef c,
    //                               CGFloat cp1x, //控制点1 x坐标
    //                               CGFloat cp1y, //控制点1 y坐标
    //                               CGFloat cp2x, //控制点2 x坐标
    //                               CGFloat cp2y, //控制点2 y坐标
    //                               CGFloat x,  //直线的终点 x坐标
    //                               CGFloat y  //直线的终点 y坐标
    //                               );
    CGContextAddCurveToPoint(context, 0, 50, 320, 200, 200, 200);
    CGContextStrokePath(context);
*/
//    //通过三次函数曲线画圆弧
//    CGContextMoveToPoint(context, 100, 100);
//    CGContextAddCurveToPoint(context, 100, 200, 200, 200, 200, 100);
//    CGContextStrokePath(context);
    //二次曲线
    CGContextMoveToPoint(context, 100, 100);
    //void CGContextAddQuadCurveToPoint (
    //                                   CGContextRef c,
    //                                   CGFloat cpx,  //控制点 x坐标
    //                                   CGFloat cpy,  //控制点 y坐标
    //                                   CGFloat x,  //直线的终点 x坐标
    //                                   CGFloat y  //直线的终点 y坐标
    //                                   );
    CGContextAddQuadCurveToPoint(context, 0, 50, 200, 200);
    CGContextStrokePath(context);
}
#pragma mark - 画矩形,椭圆,多边形
- (void)drawShapeWithContext:(CGContextRef)context {
    //矩形
    CGContextAddRect(context, CGRectMake(100, 100, 100, 50));
    CGContextStrokePath(context);
    
    //椭圆  基于矩形创建,长宽相等的话是圆
    CGContextAddEllipseInRect(context, CGRectMake(200, 200, 50, 50));
    CGContextStrokePath(context);
    
    //多边形通过路径实现
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, &CGAffineTransformIdentity, 100, 100);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 150, 50);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 200, 200);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 50, 300);
    CGPathCloseSubpath(path);
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
}
@end
