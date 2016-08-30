//
//  shopNumChangeView.h
//  购物车的状态
//
//  Created by HXMAC on 16/5/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditShopImageView.h"


@class shopNumChangeView;
@protocol numChangeViewDelegate <NSObject>

- (void)numChangeView:(EditShopImageView *)shopImageView andShopNumChangeView:(shopNumChangeView *)shopNumView;

@end

@interface shopNumChangeView : UIView


@property (nonatomic,strong)UILabel *numLabel;
@property (nonatomic,strong)EditShopImageView *addImageView;
@property (nonatomic,strong)EditShopImageView *moveImageView;
@property (nonatomic,weak)id<numChangeViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame andIndexPath:(NSIndexPath *)indexPath;

@end
