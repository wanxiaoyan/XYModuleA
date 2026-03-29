//
//  XY_AViewController.m
//  CodeTest
//
//  Created by 万晓迪 on 2026/3/28.
//

#import "XY_AViewController.h"
#import <XYCoreKit/XYCoreKit.h>

@interface XY_AViewController ()

@end

@implementation XY_AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    [XYNetWorkConfig shareConfig].env = XYNetworkEnvironmentDev;
    
    self.title = @"XYModuleA";

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor systemPinkColor];
    btn.layer.cornerRadius = 4;
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [btn addTarget:self action:@selector(didTapOpenA) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    [NSLayoutConstraint activateConstraints:@[
        [btn.widthAnchor constraintEqualToConstant:50],
        [btn.heightAnchor constraintEqualToConstant:50],
        [btn.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [btn.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
    ]];
}

- (void)didTapOpenA {
    
    id<XYModuleBServiceProtocol> service = [[ServiceManager shared] getService:@protocol(XYModuleBServiceProtocol)];
    [service logModuleName];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
