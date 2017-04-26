//
//  MSTabBar.h
//  MSTabBar
//
//  Created by 邦农 on 17/4/25.
//  Copyright © 2017年 CoderMSZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^publishBtnClick)();

@interface MSTabBar : UITabBar

@property(nonatomic,copy)publishBtnClick publishBtnClick;

@end
