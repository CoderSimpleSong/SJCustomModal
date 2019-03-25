//
//  ViewController.m
//  CustomModal
//
//  Created by 创联 on 2019/3/22.
//  Copyright © 2019年 宋佳. All rights reserved.
//

#define SJScreenW [UIScreen mainScreen].bounds.size.width
#define SJScreenH [UIScreen mainScreen].bounds.size.height


#import "ViewController.h"
#import "AlertController.h"
#import "PopoverAnimator.h"

@interface ViewController ()
@property(strong,nonatomic)PopoverAnimator *animator;
@property(strong,nonatomic)AlertController *alert;
@end

@implementation ViewController

-(PopoverAnimator *)animator{
    if (!_animator) {
        _animator = [[PopoverAnimator alloc]init];
        //这个是弹出视图的弹出位置
        _animator.PresentedViewFrame = CGRectMake(60, (SJScreenH - 100) * 0.5, SJScreenW - 120, 100);
        _animator.time = 0.5;
    }
    return _animator;
}
-(AlertController *)alert{
    if (!_alert) {
        _alert = [[AlertController alloc]init];
    }
    return _alert;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
}
- (IBAction)fromTop:(UIButton *)sender {
    self.alert.isSure = ^(BOOL isSure) {
        if (isSure) {
            NSLog(@"从上方弹框--点击了确定");
        }else{
            NSLog(@"从上方弹框--点击了取消");
        }
    };
    self.alert.modalPresentationStyle = UIModalPresentationCustom;
    self.alert.transitioningDelegate = self.animator;
    self.animator.direction = FromDirectionTop;
    [self presentViewController:self.alert animated:YES completion:nil];
}
- (IBAction)frmoDown:(UIButton *)sender {
    self.alert.isSure = ^(BOOL isSure) {
        if (isSure) {
            NSLog(@"从下方弹框--点击了确定");
        }else{
            NSLog(@"从下方弹框--点击了取消");
        }
    };
    self.alert.modalPresentationStyle = UIModalPresentationCustom;
    self.alert.transitioningDelegate = self.animator;
    self.animator.direction = FromDirectionDown;
    [self presentViewController:self.alert animated:YES completion:nil];
}
- (IBAction)fromLeft:(UIButton *)sender {
    self.alert.isSure = ^(BOOL isSure) {
        if (isSure) {
            NSLog(@"从左方弹框--点击了确定");
        }else{
            NSLog(@"从左方弹框--点击了取消");
        }
    };
    self.alert.modalPresentationStyle = UIModalPresentationCustom;
    self.alert.transitioningDelegate = self.animator;
    self.animator.direction = FromDirectionLeft;
    [self presentViewController:self.alert animated:YES completion:nil];
}
- (IBAction)frmoRight:(UIButton *)sender {
    self.alert.isSure = ^(BOOL isSure) {
        if (isSure) {
            NSLog(@"从右方弹框--点击了确定");
        }else{
            NSLog(@"从右方弹框--点击了取消");
        }
    };
    self.alert.modalPresentationStyle = UIModalPresentationCustom;
    self.alert.transitioningDelegate = self.animator;
    self.animator.direction = FromDirectionRight;
    [self presentViewController:self.alert animated:YES completion:nil];
}


@end
