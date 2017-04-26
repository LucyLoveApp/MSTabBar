//
//  MSTabBar.m
//  MSTabBar
//
//  Created by 邦农 on 17/4/25.
//  Copyright © 2017年 CoderMSZhang. All rights reserved.
//

#import "MSTabBar.h"

@interface MSTabBar()
/** 发布按钮 */
@property(nonatomic,strong)UIButton *publishBtn;

@end

@implementation MSTabBar

/**
 *初始化方法
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIButton *pubBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [pubBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        pubBtn.backgroundColor = [UIColor colorWithRed:1.0 green:130/255.0 blue:0 alpha:1.0];
        [pubBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:pubBtn];
        
        self.publishBtn = pubBtn;
    }
    return self;
}

/**
 *重新布局子控件
*/
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    //设置发布按钮的frame
    CGFloat btnW = self.publishBtn.currentBackgroundImage.size.width;
    CGFloat btnH = self.publishBtn.currentBackgroundImage.size.height;
    CGRect btnFrame = self.publishBtn.frame;
    btnFrame.size = CGSizeMake(btnW, btnH);
    //如若美工图片做到位，图片设置成按钮的backgroundImage，这里不需要修改尺寸
    btnFrame.size = CGSizeMake(50, height-10);
    self.publishBtn.frame = btnFrame;
    self.publishBtn.center = CGPointMake(width*0.5, height*0.5);
    
    //布局其他UITabBarButtonItem控件的frame
    CGFloat itemY = 0;
    CGFloat itemW = width/5.0;
    CGFloat itemH = height;
    NSInteger index = 0;
    for (UIView *item in self.subviews) {
        
        if (![item isKindOfClass:[UIControl class]] || item == self.publishBtn) continue;
        
        /**
         *计算frame的x
         *
         */
        CGFloat itemX = itemW*(index > 1 ? (index+1):index);
        item.frame = CGRectMake(itemX, itemY, itemW, itemH);
        
        index++;
    }
    
    
    
}

/** 发布按钮的点击事件 */
-(void)btnClick
{
    if (self.publishBtnClick)
    {
        self.publishBtnClick();
    }
}

@end
