//
//  RootViewController.m
//  购物车的状态
//
//  Created by HXMAC on 16/5/17.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *lookShopStore = [UIButton buttonWithType:UIButtonTypeCustom];
    lookShopStore.frame = CGRectMake(10, self.view.center.y - 20, self.view.frame.size.width - 20, 40);
    [lookShopStore setTitle:@"购物车" forState:UIControlStateNormal];
    [lookShopStore setTintColor:[UIColor whiteColor]];
    [lookShopStore setBackgroundColor:[UIColor redColor]];
    [lookShopStore addTarget:self action:@selector(goShopView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lookShopStore];
}
- (void)goShopView{
    ViewController *vc = [[ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
