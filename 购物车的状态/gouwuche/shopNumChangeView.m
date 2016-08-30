//
//  shopNumChangeView.m
//  购物车的状态
//
//  Created by HXMAC on 16/5/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "shopNumChangeView.h"

#import "EditShopImageView.h"

@implementation shopNumChangeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame andIndexPath:(NSIndexPath *)indexPath{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView:indexPath];
    }
    return self;
}
- (void)createView:(NSIndexPath *)indexPath{
    _moveImageView = [[EditShopImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [_moveImageView setImage:[UIImage imageNamed:@"move.png"]];
    _moveImageView.userInteractionEnabled = YES;
    _moveImageView.tag = 100 + indexPath.row;
    _moveImageView.type = moveShopType;
    [self addSubview:_moveImageView];
    
    _numLabel = [[UILabel alloc]initWithFrame:CGRectMake(_moveImageView.frame.size.width + 5, 0, 30, self.frame.size.height)];
    _numLabel.textAlignment = NSTextAlignmentCenter;
    _numLabel.textColor = [UIColor blackColor];
    [_numLabel setFont:[UIFont systemFontOfSize:14]];
    [self addSubview:_numLabel];
    
    _addImageView = [[EditShopImageView alloc]initWithFrame:CGRectMake(_numLabel.frame.origin.x + _numLabel.frame.size.width + 5, 0, 30, 30)];
    [_addImageView setImage:[UIImage imageNamed:@"add.png"]];
    _addImageView.userInteractionEnabled = YES;
    [_addImageView setTag:200+indexPath.row];
    _addImageView.type = addShopType;
    [self addSubview:_addImageView];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeNum:)];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeNum:)];

    [_moveImageView addGestureRecognizer:tap1];
    [_addImageView addGestureRecognizer:tap2];
}
- (void)changeNum:(UITapGestureRecognizer *)tap{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(numChangeView:andShopNumChangeView:)]) {
        [self.delegate performSelector:@selector(numChangeView:andShopNumChangeView:) withObject:tap.view withObject:self];
    }
}
@end
