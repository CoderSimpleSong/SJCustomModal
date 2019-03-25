//
//  PopoverAnimator.h
//  CustomModal
//
//  Created by 创联 on 2019/3/22.
//  Copyright © 2019年 宋佳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, FromDirection) {
    FromDirectionTop,
    FromDirectionDown,
    FromDirectionLeft,
    FromDirectionRight
};

@interface PopoverAnimator : NSObject <UIViewControllerTransitioningDelegate>

@property(assign,nonatomic)CGRect PresentedViewFrame;
@property(assign,nonatomic)FromDirection direction;
@property(assign,nonatomic)NSTimeInterval time;
@property(assign,nonatomic,readonly,getter=isPresentAnimationing)BOOL PresentAnimationing;
@end

NS_ASSUME_NONNULL_END
