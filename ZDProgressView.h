//
//  ZDProgressView.h
//  PE
//
//  Created by 杨志达 on 14-6-20.
//  Copyright (c) 2014年 PE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDProgressView : UIView

@property (nonatomic,strong) NSString *text;
@property (nonatomic,strong) UIFont *textFont;
@property (nonatomic,assign) CGFloat progress;
@property (nonatomic,assign) NSInteger cornerRadius;
@property (nonatomic,assign) NSInteger borderWidth;

@property (nonatomic,strong) UIColor *noColor;
@property (nonatomic,strong) UIColor *prsColor;

@property (nonatomic,strong) UILabel *oneLabel;

@property (nonatomic,strong) UILabel *twoLabel;

@property (nonatomic,strong) UIView *oneView;

@property (nonatomic,strong) UIView *twoView;


- (void)finishedProgress:(double )finished andAllProgress:(double)All andFinishedProgressStr:(double) finishedStr andAllprogressStr:(double)allProgressStr;
@end
