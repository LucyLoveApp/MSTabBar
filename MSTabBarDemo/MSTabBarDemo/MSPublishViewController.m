//
//  MSPublishViewController.m
//  MSTabBar
//
//  Created by 邦农 on 17/4/25.
//  Copyright © 2017年 CoderMSZhang. All rights reserved.
//

#import "MSPublishViewController.h"

@interface MSPublishViewController ()

@end

@implementation MSPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景图
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"DefaultBg"]];
    [self setupCancelBtn];
}

//底部的取消按钮
-(void)setupCancelBtn
{
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    CGFloat btnW = 50;
    CGFloat btnH = 34;
    
    UIButton *pubBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [pubBtn setImage:[UIImage imageNamed:@"camera_close_highlighted"] forState:UIControlStateNormal];
    [pubBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    pubBtn.frame = CGRectMake(0, 0, btnW, btnH);
    pubBtn.center = CGPointMake(width*0.5, height-44*0.5);
    [self.view addSubview:pubBtn];
}

-(void)btnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
