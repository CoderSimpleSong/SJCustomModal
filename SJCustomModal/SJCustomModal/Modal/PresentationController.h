//
//  PresentationController.h
//  CustomModal
//
//  Created by 创联 on 2019/3/22.
//  Copyright © 2019年 宋佳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PresentationController : UIPresentationController
/***被弹出试图的frame***/
@property(assign,nonatomic)CGRect toRect;
@end

NS_ASSUME_NONNULL_END
