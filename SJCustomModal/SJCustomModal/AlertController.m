//
//  AlertController.m
//  CustomModal
//
//  Created by 创联 on 2019/3/22.
//  Copyright © 2019年 宋佳. All rights reserved.
//

#import "AlertController.h"

@interface AlertController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLab;

@end

@implementation AlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.view.layer.cornerRadius = 5.0;
    self.view.layer.masksToBounds = YES;
    
}
- (IBAction)cancel:(UIButton *)sender {
    if (self.isSure) {
        self.isSure(NO);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)sure:(UIButton *)sender {
    if (self.isSure) {
        self.isSure(YES);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
