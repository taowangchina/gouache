//
//  ShopModel.h
//  购物车的状态
//
//  Created by HXMAC on 16/5/12.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopModel : NSObject
@property (nonatomic,strong)NSString *shopName;
@property (nonatomic,assign)int shopNum;
@property (nonatomic,assign)float shopPrice;
@end
