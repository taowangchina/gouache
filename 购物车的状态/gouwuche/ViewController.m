//
//  ViewController.m
//  购物车的状态
//
//  Created by HXMAC on 16/5/12.
//  Copyright © 2016年 Apple. All rights reserved.
//
#import "ViewController.h"
#import "ShopModel.h"
#import "ShopView.h"
#import "ShopTableViewCell.h"
#import "shopNumChangeView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,ShopViewDelegate,numChangeViewDelegate>
{
    NSMutableArray *_dataArray;
    ShopView *shopview;
    float allPrice;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"购物车";
    allPrice = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    _dataArray = [NSMutableArray array];
    for (int i = 0; i < 4; i ++) {
        ShopModel *model = [[ShopModel alloc]init];
        model.shopName = [NSString stringWithFormat:@"商品%d",i];
        model.shopPrice = i * 2 + 10;
        model.shopNum = 3;
        [_dataArray addObject:model];
        allPrice = allPrice + model.shopNum * model.shopPrice;
    }
    shopview = [[ShopView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height - 40 - (_dataArray.count * 50 + 30), self.view.frame.size.width, _dataArray.count * 50 + 30)];
    shopview.tableView.delegate = self;
    shopview.tableView.dataSource = self;
    shopview.delegate = self;
    [self.view addSubview:shopview];
    shopview.allPriceLabel.text = [NSString stringWithFormat:@"%.f",allPrice];
}
- (void)viewWillAppear:(BOOL)animated{
}
- (void)shopButtonClick:(UIButton *)sender{
    if (sender.tag == 100) {
        NSLog(@"全部删除");
        allPrice = 0;
        [_dataArray removeAllObjects];
        [shopview.tableView reloadData];
        shopview.allPriceLabel.text = [NSString stringWithFormat:@"%.f",allPrice];
    }else{
        NSLog(@"结算");
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (ShopTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIDE = @"cellIdentifier";
    ShopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIDE];
    ShopModel *model = [_dataArray objectAtIndex:indexPath.row];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ShopTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor orangeColor];
        shopNumChangeView *numView = [[shopNumChangeView alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 100, 10, 100, 30) andIndexPath:indexPath];
        numView.delegate = self;
        numView.numLabel.text = [NSString stringWithFormat:@"%d",model.shopNum];
        [cell addSubview:numView];
    }
    cell.shopPrice.text = [NSString stringWithFormat:@"%.1f",model.shopPrice * model.shopNum];
    cell.shopNameLabel.text = model.shopName;

    return cell;
}
- (void)numChangeView:(EditShopImageView *)shopImageView andShopNumChangeView:(shopNumChangeView *)shopNumView{
    if (shopImageView.type == moveShopType) {
        if ([shopNumView.numLabel.text intValue] == 1) {
            ShopModel *model = [_dataArray objectAtIndex:shopImageView.tag - 100];
            model.shopNum --;
            allPrice = allPrice - model.shopPrice;
            [_dataArray removeObjectAtIndex:shopImageView.tag - 100];
            [shopview.tableView reloadData];
        }else{
            ShopModel *model = [_dataArray objectAtIndex:shopImageView.tag - 100];
            model.shopNum --;
            allPrice = allPrice - model.shopPrice;
            [_dataArray replaceObjectAtIndex:shopImageView.tag - 100 withObject:model];
            [shopview.tableView reloadData];
        }
    }else{
        ShopModel *model = [_dataArray objectAtIndex:shopImageView.tag - 200];
        model.shopNum ++;
        allPrice = allPrice + model.shopPrice;
        [_dataArray replaceObjectAtIndex:shopImageView.tag - 200 withObject:model];
        [shopview.tableView reloadData];
    }
    shopview.allPriceLabel.text = [NSString stringWithFormat:@"%.f",allPrice];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
