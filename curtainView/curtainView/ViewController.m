//
//  ViewController.m
//  curtainView
//
//  Created by Smile on 2018/3/21.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "hiddenBgView.h"

@interface ViewController ()<hiddenBgViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *But = [[UIButton alloc]init];
    But.frame = CGRectMake(50,50,80,40);
    [But setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [But setTitle:@"点击弹出视图" forState:UIControlStateNormal];
    But.titleLabel.textAlignment = NSTextAlignmentCenter;
    But.backgroundColor = [UIColor whiteColor];
    [But.titleLabel setFont:[UIFont fontWithName:@"STHeitiSC-Medium" size:12]];
    [But addTarget:self action:@selector(ButMethods) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:But];
}

- (void)ButMethods
{
    UIView * yellowView = [[UIView alloc]initWithFrame:CGRectMake(100,200,100,100)];
    yellowView.backgroundColor = [UIColor yellowColor];
    
    hiddenBgView *hiddenBg = [hiddenBgView BgView];
    hiddenBg.delegate = self;
    hiddenBg.content = yellowView;
    [hiddenBg show];
    return;
}

#pragma mark - hiddenBgViewDelegate
/**
 *  弹出视图被销毁了
 */
- (void)dropdownBgViewDidDismiss:(hiddenBgView *)menu
{
    return;
}

/**
 *  弹出视图显示了
 */
- (void)dropdownBgViewDidShow:(hiddenBgView *)menu
{
    return;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
