//
//  EditShopImageView.h
//  购物车的状态
//
//  Created by HXMAC on 16/5/16.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,EditShopType){
    addShopType = 0,
    moveShopType
};

@interface EditShopImageView : UIImageView
@property (nonatomic,assign)EditShopType type;
@end
