//
//  grayBgView.m
//  mooer
//
//  Created by Smile on 2018/3/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "hiddenBgView.h"

@implementation hiddenBgView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
}

-(void)setContentTable:(UITableView *)contentTable
{
    _contentTable = contentTable;
    [self addSubview:contentTable];
}
-(void)setContent:(UIView *)content
{
    _content = content;
    [self addSubview:content];
    
}

+ (instancetype)BgView
{
    return [[self alloc] init];
}

/**
 *  显示
 */
- (void)show
{
    
    // 1.获得最上面的窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    // 2.添加自己到窗口上
    [window addSubview:self];
    
    // 3.设置自己的位置
    self.frame = window.bounds;
    
    // 通知外界，自己显示了
    if ([self.delegate respondsToSelector:@selector(dropdownBgViewDidShow:)]) {
        [self.delegate dropdownBgViewDidShow:self];
    }
}

/**
 *  销毁
 */
- (void)dismiss
{
    [self removeFromSuperview];
    
    // 通知外界，自己被销毁了
    if ([self.delegate respondsToSelector:@selector(dropdownBgViewDidDismiss:)]) {
        [self.delegate dropdownBgViewDidDismiss:self];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}


@end
