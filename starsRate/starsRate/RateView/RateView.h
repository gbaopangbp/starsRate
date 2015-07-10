//
//  RateView.h
//  starRate
//
//  Created by tirostiros on 15/7/10.
//  Copyright (c) 2015年 cn.com.buslink. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RateView;
@protocol RateViewProtocol <NSObject>
@optional
- (void)rateView:(RateView*)rateView clikInex:(NSInteger)index;

@end

@interface RateView : UIView
@property(weak,nonatomic)id<RateViewProtocol>delegate;
/**
 *  <#Description#>
 *
 *  @param starNum 默认显示几星
 *  @param isShow  yes全部显示，no显示默认几星，并且不能操作
 *
 *  @return 
 */
-(instancetype)initWithDeaultStar:(NSInteger)starNum andisModify:(BOOL)isModify;

- (void)setPostion:(CGPoint)postion;

@end


