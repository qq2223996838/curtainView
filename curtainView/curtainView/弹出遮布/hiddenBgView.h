//
//  grayBgView.h
//  mooer
//
//  Created by Smile on 2018/3/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class hiddenBgView;

@protocol hiddenBgViewDelegate <NSObject>
@optional
- (void)dropdownBgViewDidDismiss:(hiddenBgView *)menu;
- (void)dropdownBgViewDidShow:(hiddenBgView *)menu;
@end

@interface hiddenBgView : UIView
@property (nonatomic, weak) id<hiddenBgViewDelegate> delegate;

+ (instancetype)BgView;
/**
 *  内容
    可以UITableView
    可以UIView
 */
@property (nonatomic, strong) UITableView *contentTable;
@property (nonatomic, strong) UIView *content;


/**
 *  显示
 */
- (void)show;
/**
 *  销毁
 */
- (void)dismiss;

@end
