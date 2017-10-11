 //
//  ZDProgressView.m
//  PE
//
//  Created by 杨志达 on 14-6-20.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import "ZDProgressView.h"

@interface ZDProgressView()
{
    double aa;
    double bb;
    CGRect midFrame;
}
@end

@implementation ZDProgressView

- (id)initWithFrame:(CGRect)frame
{
    midFrame = frame;
    self = [super initWithFrame:frame];
    if (self) {
        [self zdInit];
        
    }
    return self;
}

//- (void)setFrame:(CGRect)frame
//{
//    [super setFrame:frame];
//}
- (void)finishedProgress:(double)finished andAllProgress:(double)All andFinishedProgressStr:(double)finishedStr andAllprogressStr:(double)allProgressStr
{
    //    bb = a;
    bb = midFrame.size.width * (finished/All);
    double firstW = midFrame.size.width * (finished/All);
    double secondW = midFrame.size.width * (1-(finished/All));
    self.layer.cornerRadius = midFrame.size.height/2;
    self.oneView.frame = CGRectMake(0, 0, firstW, midFrame.size.height);
    self.oneView.layer.cornerRadius = midFrame.size.height/2;
    self.oneLabel.frame = self.oneView.frame;
    self.oneLabel.layer.cornerRadius = midFrame.size.height/2;
    self.oneLabel.layer.masksToBounds = YES;
    self.oneLabel.text = [NSString stringWithFormat:@"%0.f",finishedStr];

    self.twoView.frame = CGRectMake(0, 0, midFrame.size.width, midFrame.size.height);
    self.twoView.layer.cornerRadius = midFrame.size.height/2;

    self.twoLabel.frame = CGRectMake(CGRectGetMaxX(self.oneLabel.frame)+ (midFrame.size.width - CGRectGetMaxX(self.oneLabel.frame)) / 2, 0, 30, midFrame.size.height);
    self.twoLabel.layer.cornerRadius = midFrame.size.height/2;
    self.twoLabel.layer.masksToBounds = YES;
    self.twoLabel.text = [NSString stringWithFormat:@"%0.f",allProgressStr];

    
    
    UIBezierPath *bgPath = [[UIBezierPath alloc] init];
    [bgPath moveToPoint:CGPointMake(midFrame.size.width - midFrame.size.height/2, midFrame.size.height/2)];
    [bgPath addLineToPoint:CGPointMake(midFrame.size.height/2, midFrame.size.height/2)];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(midFrame.size.height/2, midFrame.size.height/2)];
    [path addLineToPoint:CGPointMake(midFrame.size.width - midFrame.size.height/2, midFrame.size.height/2)];
}

- (void)zdInit
{
    self.borderWidth = 1;

    
    self.twoView = [[UIView alloc] init];
    self.twoView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
    self.oneView.layer.cornerRadius = midFrame.size.height/2;
    self.oneLabel.layer.cornerRadius = midFrame.size.height/2;
    self.oneLabel.layer.masksToBounds = YES;

    [self addSubview:self.twoView];
    
    self.twoLabel = [[UILabel alloc] init];
    self.twoLabel.layer.masksToBounds = YES;
    self.twoLabel.backgroundColor = [UIColor clearColor];
    self.twoLabel.textAlignment = 0;
    
    [self.twoView addSubview:self.twoLabel];
    
    
    self.oneView = [[UIView alloc] init];
    self.oneView.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.oneView];
    
    self.oneLabel = [[UILabel alloc] init];
    self.oneLabel.layer.masksToBounds = YES;
    self.oneLabel.layer.cornerRadius = 5;
    self.oneLabel.textAlignment = 1;
    self.oneLabel.backgroundColor = [UIColor  clearColor];
    self.oneLabel.textColor = [UIColor whiteColor];
    [self.oneView addSubview:self.oneLabel];
    


}


- (void)setProgress:(CGFloat)progress
{
    aa = progress;
//第一种 不怎么大气
    [UIView animateWithDuration:0.1 animations:^{
       self.oneView.frame = CGRectMake(0, 0, bb-(bb - 1), self.frame.size.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.6 animations:^{
           self.oneView.frame = CGRectMake(0, 0, bb, self.frame.size.height);
        } completion:^(BOOL finished) {

            [UIView animateWithDuration:0.3 animations:^{
                self.oneView.frame = CGRectMake(0, 0, bb-(bb * (1/2)), self.frame.size.height);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.3 animations:^{
                    self.oneView.frame = CGRectMake(0, 0, bb+ 10, self.frame.size.height);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.3 animations:^{
                        self.oneView.frame = CGRectMake(0, 0, bb -(bb*(1/5)), self.frame.size.height);
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:0.3 animations:^{
                            self.oneView.frame = CGRectMake(0, 0, bb+ 10, self.frame.size.height);
                        } completion:^(BOOL finished) {
                            [UIView animateWithDuration:0.3 animations:^{
                                self.oneView.frame = CGRectMake(0, 0, bb, self.frame.size.height);
                            } completion:^(BOOL finished) {

                            }];
                        }];
                    }];
                }];
//
            }];
        }];
    }];
    //第二种
//        [UIView animateWithDuration:0.1 delay:0.5  usingSpringWithDamping:1 initialSpringVelocity:12 options:UIViewAnimationOptionCurveLinear animations:^{
//        NSLog(@"+++++++++%0.f",self.frame.size.width * aa);
//       self.oneLabel.frame = CGRectMake(0, 0, bb-(bb - 1), self.frame.size.height);
//
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:3 delay:0.5  usingSpringWithDamping:0.4 initialSpringVelocity:15 options:UIViewAnimationOptionAllowUserInteraction animations:^{
//            NSLog(@"+++++++++%0.f",self.frame.size.width * aa);
//            self.oneLabel.frame = CGRectMake(0, 0, bb, self.frame.size.height);
//
//        } completion:^(BOOL finished) {
//
//        }];
//    }];
    //第三种 言简意赅
//    [UIView animateWithDuration:0.1 animations:^{
//        self.oneView.frame = CGRectMake(0, 0, bb-(bb - 1), self.frame.size.height);
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.6 animations:^{
//            self.oneView.frame = CGRectMake(0, 0, bb, self.frame.size.height);
//        } completion:^(BOOL finished) {
//
//
//        }];
//    }];

}


@end
