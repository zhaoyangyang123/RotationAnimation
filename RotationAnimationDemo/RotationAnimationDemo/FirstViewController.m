//
//  FirstViewController.m
//  RotationAnimationDemo
//
//  Created by 赵扬扬 on 17/1/10.
//  Copyright © 2017年 赵扬扬. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *loadImageView;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)start:(id)sender {
    
    CABasicAnimation *animation = [ CABasicAnimation
                                   animationWithKeyPath: @"transform" ];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    
    //围绕Z轴旋转，垂直与屏幕 顺时针旋转(1.0, 0.0, 0.0, M_PI) 逆时针旋转(M_PI, 0.0, 0.0, 1.0)
    animation.toValue = [ NSValue valueWithCATransform3D:
                         
                         CATransform3DMakeRotation(1.0/*M_PI*/, 0.0, 0.0, /*1.0*/M_PI)];
    // 旋转速度控制
    animation.duration = 0.15;
    //旋转效果累计，先转180度，接着再旋转180度，从而实现360旋转
    animation.cumulative = YES;
    animation.repeatCount = 1000;
    
    //在图片边缘添加一个像素的透明区域，去图片锯齿
    //    CGRect imageRrect = CGRectMake(0, 0, self.navView.rightBtn.frame.size.width, self.navView.rightBtn.frame.size.height);
    //    UIGraphicsBeginImageContext(imageRrect.size);
    //    [self.navView.rightBtn.imageView.image drawInRect:CGRectMake(1,1,self.navView.rightBtn.frame.size.width-2,self.navView.rightBtn.frame.size.height-2)];
    //    self.navView.rightBtn.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    
    [self.loadImageView.layer addAnimation:animation forKey:nil];
    
}

- (IBAction)stop:(id)sender {
    [self.loadImageView.layer removeAllAnimations];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
