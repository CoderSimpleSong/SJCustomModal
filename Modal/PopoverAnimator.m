//
//  PopoverAnimator.m
//  CustomModal
//
//  Created by 创联 on 2019/3/22.
//  Copyright © 2019年 宋佳. All rights reserved.
//

#import "PopoverAnimator.h"
#import "PresentationController.h"

@interface PopoverAnimator ()<UIViewControllerAnimatedTransitioning>

@property(assign,nonatomic) CGPoint point;
@end

@implementation PopoverAnimator

-(instancetype)init{
    if (self = [super init]) {
        self.direction = FromDirectionTop;
        self.time = 2.0;
    }
    return self;
}

-(void)setDirection:(FromDirection)direction{
    switch (direction) {
        case FromDirectionTop:
            self.point = CGPointMake(0, -[UIScreen mainScreen].bounds.size.height);
            break;
          case FromDirectionDown:
            self.point = CGPointMake(0, [UIScreen mainScreen].bounds.size.height);
            break;
        case FromDirectionLeft:
            self.point = CGPointMake(-[UIScreen mainScreen].bounds.size.width, 0);
            break;
        case FromDirectionRight:
            self.point = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
            break;
        default:
            break;
    }
}

#pragma mark --- UIViewControllerTransitioningDelegate
//目的:自定义弹出的动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    _PresentAnimationing = YES;
    return self;
}
// 目的:自定义消失的动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    _PresentAnimationing = NO;
    return self;
}
 // 目的:改变弹出View的尺寸
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
    PresentationController *presentatinC = [[PresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    presentatinC.toRect = self.PresentedViewFrame;
    return presentatinC;
}
#pragma mark ---UIViewControllerAnimatedTransitioning

//动画时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return self.time;
}
//自定义动画
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    _PresentAnimationing?[self animationForPresentedView:transitionContext]:[self animationForDismissedView:transitionContext];
}


//自定义弹出动画
-(void)animationForPresentedView:(id <UIViewControllerContextTransitioning>)transitionContext{
    // 1.获取弹出的View
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextToViewKey];
    //2.将弹出的View添加到containerView中
    [transitionContext.containerView addSubview:presentedView];
    // 3.执行动画
    presentedView.transform = CGAffineTransformMakeTranslation(self.point.x, self.point.y);
    [UIView animateWithDuration:self.time animations:^{
        presentedView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

//自定义消失动画
-(void)animationForDismissedView:(id <UIViewControllerContextTransitioning>)transitionContext{
    // 1.获取消失的View
    UIView *dismissView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    //2执行动画
    [UIView animateWithDuration:self.time animations:^{
        dismissView.transform = CGAffineTransformMakeTranslation(self.point.x, self.point.y);
    } completion:^(BOOL finished) {
        [dismissView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}


@end
