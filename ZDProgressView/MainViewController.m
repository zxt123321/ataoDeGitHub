//
//  MainViewController.m
//  ZDProgressView
//
//  Created by Yangzhida on 14-6-20.
//  Copyright (c) 2014年 PV. All rights reserved.
//

#import "MainViewController.h"
#import "ZDProgressView.h"


@interface MainViewController ()

@property (nonatomic,strong) ZDProgressView *zdProgressView;

@end

@implementation MainViewController

#pragma mark - zdProgressViewInit
- (void)zdProgressViewInit
{
//test*************************
    double a = 50;
    double b= 100;
//test*************************

    
    self.zdProgressView = [[ZDProgressView alloc] initWithFrame:CGRectMake(10, 200, 300, 25)];
    [self.zdProgressView finishedProgress:a andAllProgress:b andFinishedProgressStr:a andAllprogressStr:b];
    self.zdProgressView.progress = a/b;
    [self.view addSubview:self.zdProgressView];
    
    

}


#pragma mark - view load
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self zdProgressViewInit];
}


@end
