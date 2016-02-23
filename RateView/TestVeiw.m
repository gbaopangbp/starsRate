//
//  TestVeiw.m
//  ReviewDemo
//
//  Created by cm on 16/2/23.
//  Copyright © 2016年 cm. All rights reserved.
//

#import "TestVeiw.h"

@interface TestVeiw ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonColletion;
@property (assign, nonatomic)NSInteger selectButtonTag;
@property (strong, nonatomic) NSMutableArray *buttonArray;

@end

@implementation TestVeiw

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        UIView *containerView = [[[UINib nibWithNibName:@"TestView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        containerView.frame = self.bounds;
        [self addSubview:containerView];
        [self buttonClick:_buttonColletion.lastObject];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [self initWithFrame:frame deaultStar:5 andisModify:YES];
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame deaultStar:(NSInteger)starNum andisModify:(BOOL)isModify{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectButtonTag = starNum;
        self.backgroundColor = [UIColor grayColor];
        
        _buttonArray = [NSMutableArray array];
        NSInteger width = frame.size.width/16;
        for (int i = 1; i < 6; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [button setImage:[UIImage imageNamed:@"star_empty"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"star_full"] forState:UIControlStateSelected];
            button.tag = i;
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.frame = CGRectMake((3*(i-1)+1)*width, (frame.size.height - width*2)/2, width*2, width*2);
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

- (IBAction)buttonClick:(UIButton *)sender {
    __weak TestVeiw *weakSelf = self;
    
    if (sender.tag > self.selectButtonTag) {
        [UIView animateWithDuration:0.5f animations:^{
            NSInteger start = (self.selectButtonTag == 0)?1:self.selectButtonTag;
            for (NSInteger i = start; i <= sender.tag; i ++) {
                UIButton *button = weakSelf.buttonColletion[i-1];
                button.selected = YES;
            }
        }];
    }else{
        [UIView animateWithDuration:0.5f animations:^{
            for (NSInteger i = self.selectButtonTag; i > sender.tag; i--) {
                UIButton *button = weakSelf.buttonColletion[i-1];
                button.selected = NO;
            }
        }];
        
    }
    self.selectButtonTag = sender.tag;
    
    if([self.delegate respondsToSelector:@selector(rateView:clickIndex:)]){
        [self.delegate rateView:self clickIndex:sender.tag];
    }
}

- (NSArray*)buttonColletion{
    if (!_buttonColletion) {
        return _buttonArray;
    } else {
        return _buttonColletion;
    }
}


@end
