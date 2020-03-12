//
//  ViewController.m
//  podTest
//
//  Created by 신승환 on 2020/03/11.
//  Copyright © 2020 신승환. All rights reserved.
//

#import "ViewController.h"
#import <KCPLib-Utils.h>

@interface ViewController ()

@property (strong, nonatomic) UILabel *networkLabel;
@property (strong, nonatomic) NSString *strNetwork;
@property (strong, nonatomic) KCPLib_Utils *kcpUtils;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _kcpUtils = [[KCPLib_Utils alloc] init];
    
    [_kcpUtils startNetworkMonitoring];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _kcpUtils.networkStatus = [_kcpUtils getCurNetworkStatus];
    [self initView];
    
}


- (void)initView
{
    CGRect rtLbl = CGRectZero;
    rtLbl.size = CGSizeMake(300, 50);
    rtLbl.origin = CGPointMake((self.view.frame.size.width / 2) - (rtLbl.size.width / 2), 150);
    _networkLabel = [[UILabel alloc] initWithFrame:rtLbl];
    [_networkLabel setTextAlignment:NSTextAlignmentCenter];
    [_networkLabel setBackgroundColor:[UIColor systemBlueColor]];
    [_networkLabel setText:[_kcpUtils convertToString:_kcpUtils.networkStatus]];
    
    [self.view addSubview:_networkLabel];
    
}



@end
