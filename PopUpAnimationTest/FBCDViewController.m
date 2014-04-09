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
	_imageView.layer.transform = CATransform3DMakeScale(0.90, 0.90, 1);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender {
    
}

-(void)animationDidStart:(CAAnimation *)anim{
    NSArray *views = self.view.subviews;
    UIView *v = [views objectAtIndex:index];
    if ([[v class] isSubclassOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton*)v;
        if (btn.tag == 0) {
            [btn setBackgroundImage:[UIImage imageNamed:@"BetRedBall.png"] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else{
            [btn setBackgroundImage:[UIImage imageNamed:@"BetGrayBall.png"] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        if (index < 6) {
            index ++;
        }else{
            index = 0;
        }
    }
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
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
        // It has shaked
        [CATransaction begin];
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
        animation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        animation.delegate = self;
        animation.autoreverses = YES;
        animation.duration = 0.3;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.repeatCount = 2;
        [_btn1.layer addAnimation:animation forKey:@"pulseAnimation"];
        [_btn2.layer addAnimation:animation forKey:@"pulseAnimation"];
        [_btn3.layer addAnimation:animation forKey:@"pulseAnimation"];
        [_btn4.layer addAnimation:animation forKey:@"pulseAnimation"];
        [_btn5.layer addAnimation:animation forKey:@"pulseAnimation"];
        [_btn6.layer addAnimation:animation forKey:@"pulseAnimation"];
        [CATransaction commit];
    }
}

-(void)animationAndChangeImage:(UIView*)btn{
}
@end
