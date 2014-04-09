//
//  FBCDViewController.m
//  PopUpAnimationTest
//
//  Created by Xinqi Chan on 14-4-8.
//  Copyright (c) 2014年 Xinqi Chan. All rights reserved.
//

#import "FBCDViewController.h"

@interface FBCDViewController (){
    CALayer *layer;
    BOOL tag;
    int index;
}
@end

@implementation FBCDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _btn1.layer.transform = CATransform3DMakeScale(0.90, 0.90, 1);
    _btn2.layer.transform = CATransform3DMakeScale(0.90, 0.90, 1);
    _btn3.layer.transform = CATransform3DMakeScale(0.90, 0.90, 1);
    _btn4.layer.transform = CATransform3DMakeScale(0.90, 0.90, 1);
    _btn5.layer.transform = CATransform3DMakeScale(0.90, 0.90, 1);
    _btn6.layer.transform = CATransform3DMakeScale(0.90, 0.90, 1);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
 
}

- (IBAction)start:(id)sender {
    
}

-(void)animationDidStart:(CAAnimation *)anim{
    UIButton *btn;
    switch (index) {
        case 0:
            btn = _btn1;
            break;
        case 1:
            btn = _btn2;
            break;
        case 2:
            btn = _btn3;
            break;
        case 3:
            btn = _btn4;
            break;
        case 4:
            btn = _btn5;
            break;
        case 5:
            btn = _btn6;
            break;
        default:
            break;
    }
    [btn setBackgroundImage:[UIImage imageNamed:@"BetRedBall.png"] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    if (index < 6) {
        index ++;
    }
}


-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        UIButton *btn;
        switch (index) {
            case 1:
                btn = _btn2;
                break;
            case 2:
                btn = _btn3;
                break;
            case 3:
                btn = _btn4;
                break;
            case 4:
                btn = _btn5;
                break;
            case 5:
                btn = _btn6;
                break;
            default:
                break;
        }
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
        animation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        animation.autoreverses = YES;
        animation.duration = 0.1;
        animation.delegate = self;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.repeatCount = 3;
        [btn.layer addAnimation:animation forKey:@"pulseAnimation"];
    }
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.type == UIEventSubtypeMotionShake) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
        animation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        animation.delegate = self;
        animation.autoreverses = YES;
        animation.duration = 0.1;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.repeatCount = 3;
        [_btn1.layer addAnimation:animation forKey:@"pulseAnimation"];
    }
}

-(void)animationAndChangeImage:(UIView*)btn{
}
@end
