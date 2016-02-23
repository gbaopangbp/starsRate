//
//  TestVeiw.h
//  ReviewDemo
//
//  Created by cm on 16/2/23.
//  Copyright © 2016年 cm. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestVeiw;
@protocol RateViewProtocol <NSObject>
@optional
- (void)rateView:(TestVeiw*)rateView clickIndex:(NSInteger)index;

@end

@interface TestVeiw : UIView
@property(weak,nonatomic) id<RateViewProtocol>delegate;

@end
