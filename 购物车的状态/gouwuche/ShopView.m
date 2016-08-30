//
//  ShopView.m
//  购物车的状态
//
//  Created by HXMAC on 16/5/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ShopView.h"


@implementation ShopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self CreateView];
    }
    return self;
}

- (void)CreateView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 30) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor purpleColor];
    _tableView.contentInset=UIEdgeInsetsMake(-64, 0, 0, 0);
    [self addSubview:_tableView];
 
    UIButton *moveAll = [UIButton buttonWithType:UIButtonTypeCustom];
    moveAll.frame = CGRectMake(0, _tableView.frame.size.height, 100, 30);
    [moveAll setTitle:@"全部删除" forState:UIControlStateNormal];
    [moveAll setBackgroundColor:[UIColor redColor]];
    moveAll.tag = 100;
    [moveAll addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:moveAll];
    
    UIButton *totalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    totalButton.frame = CGRectMake(_tableView.frame.size.width - 100, _tableView.frame.size.height, 100, 30);
    totalButton.tag = 101;
    [totalButton setTitle:@"结算" forState:UIControlStateNormal];
    [totalButton setBackgroundColor:[UIColor redColor]];
    [totalButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:totalButton];
    
    _allPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.center.x - 50, _tableView.frame.size.height, 100, 30)];
    _allPriceLabel.textAlignment = NSTextAlignmentCenter;
    _allPriceLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_allPriceLabel];
}
- (void)buttonClick:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(shopButtonClick:)]) {
        [self.delegate performSelector:@selector(shopButtonClick:) withObject:sender];
    }
}
@end
