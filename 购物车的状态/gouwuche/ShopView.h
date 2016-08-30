//
//  ShopView.h
//  购物车的状态
//
//  Created by HXMAC on 16/5/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShopViewDelegate <NSObject>

- (void)shopButtonClick:(UIButton *)sender;

@end

@interface ShopView : UIView
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,weak)id<ShopViewDelegate> delegate;
@property (nonatomic,strong)UILabel *allPriceLabel;
@end
