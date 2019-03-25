//
//  PresentationController.m
//  CustomModal
//
//  Created by 创联 on 2019/3/22.
//  Copyright © 2019年 宋佳. All rights reserved.
//

#define SJScreenW [UIScreen mainScreen].bounds.size.width
#define SJScreenH [UIScreen mainScreen].bounds.size.height

#import "PresentationController.h"
#import "UIView+Frame.h"

@interface PresentationController ()
//蒙版
@property (strong,nonatomic)UIView *coverV;

@end

@implementation PresentationController
-(UIView *)coverV{
    if (_coverV == nil) {
        _coverV = [[UIView alloc]init];
        [self.containerView insertSubview:self.coverV atIndex:0];
    }
    return _coverV;
}
-(instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController{
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    if (self) {
        [self autoScrollViewContentSize];
    }
    
    return self;
}
-(void)autoScrollViewContentSize{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardHidn:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)keyBoardShow:(NSNotification *)noti{
    CGFloat duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect keyBoardF = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    [UIView animateWithDuration:duration animations:^{
        self.presentedView.y = (SJScreenH-keyBoardF.size.height-self.toRect.size.height)*0.5;
    }];
}
-(void)keyBoardHidn:(NSNotification *)noti{
    CGFloat duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration animations:^{
        self.presentedView.y = self.toRect.origin.y;
    }];
}
-(void)containerViewWillLayoutSubviews{
    [super containerViewWillLayoutSubviews];
    self.presentedView.frame = self.toRect;
    [self setupCoverView];
}
-(void)setupCoverView{
    self.coverV.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
    self.coverV.frame = self.containerView.bounds;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCover:)];
    [self.coverV addGestureRecognizer:tap];
}
-(void)tapCover:(UITapGestureRecognizer *)tap{
    [self.coverV removeFromSuperview];
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    NSLog(@"presentationController   死了");
}
@end
