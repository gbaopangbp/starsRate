//
//  RateView.m
//  starRate
//
//  Created by tirostiros on 15/7/10.
//  Copyright (c) 2015年 cn.com.buslink. All rights reserved.
//

#import "RateView.h"

#define ButtonLength 30
#define AllHeitht 50


@interface RateView()
@property (strong, nonatomic)NSMutableArray *buttonArray;
@property (assign, nonatomic)NSInteger selectButtonTag;
@end

@implementation RateView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init{
    self = [self initWithDeaultStar:0 andisModify:YES];
    return self;
}

-(instancetype)initWithDeaultStar:(NSInteger)starNum andisModify:(BOOL)isModify{
    self = [super init];
    if (self) {
        self.selectButtonTag = starNum;
        self.frame = CGRectMake(0, 100, ButtonLength * 10, AllHeitht);
        self.backgroundColor = [UIColor grayColor];
        
        _buttonArray = [[NSMutableArray alloc] init];
        for (int i = 1; i < 6; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setImage:[UIImage imageNamed:@"star_empty"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"star_full"] forState:UIControlStateSelected];
            button.tag = i;
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.frame = CGRectMake(ButtonLength/2 + (i-1)*2*ButtonLength, 10, ButtonLength, ButtonLength);
            [self addSubview:button];
            [self.buttonArray addObject:button];
            
            if (i <= starNum) {
                button.selected = YES;
            }
        }
        //为no时，只是做显示用，不能评级
        if (!isModify) {
            self.userInteractionEnabled = NO;
        }
    }
    return self;
}

- (void)buttonClick:(UIButton*)button{
    __weak RateView *weakSelf = self;

    if (button.tag > self.selectButtonTag) {
        [UIView animateWithDuration:1.0f animations:^{
            NSInteger start = (self.selectButtonTag == 0)?1:self.selectButtonTag;
            for (NSInteger i = start; i <= button.tag; i ++) {
                UIButton *button = weakSelf.buttonArray[i-1];
                button.selected = YES;
            }
        }];
    }else{
        [UIView animateWithDuration:1.0f animations:^{
            for (NSInteger i = self.selectButtonTag; i > button.tag; i--) {
                UIButton *button = weakSelf.buttonArray[i-1];
                button.selected = NO;
            }
        }];

    }
    self.selectButtonTag = button.tag;
    
    if([self.delegate respondsToSelector:@selector(rateView:clikInex:)]){
        [self.delegate rateView:self clikInex:button.tag];
    }
}

@end
