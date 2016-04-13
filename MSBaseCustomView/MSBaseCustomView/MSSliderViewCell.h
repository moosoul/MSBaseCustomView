//
//  MSSliderViewCell.h
//  MSBaseCustomView
//
//  Created by moosoul on 4/13/16.
//  Copyright © 2016 moosoul. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MSSliderViewCell;

@protocol MSSliderViewCellDelegate <NSObject>

- (void)ms_sliderViewCell:(MSSliderViewCell *)cell didSelectedTitleButton:(UIButton *)sender;

@end

@interface MSSliderViewCell : UICollectionViewCell

//!@brief 文字标题，实际上设置的是attributeString
@property (nonatomic, copy) NSString *title;

//!@brief 是否显示下划线
@property (nonatomic, assign) BOOL showUnderline;

//!@brief 下划线颜色
@property (nonatomic, strong) UIColor *underlineColor;

//!@brief 下划线高度
@property (nonatomic, assign) CGFloat underlineHeight;

//!@brief 下划线宽度
@property (nonatomic, assign) CGFloat underlineWidth;

//!@brief 按钮选中
@property (nonatomic, assign) BOOL titleButtonSelected;

//!@brief delegate
@property (nonatomic, weak) id<MSSliderViewCellDelegate> delegate;

//!@brief 设置文字颜色
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;

//!@brief 设置字体大小
//- (void)setTitleFontSize:(CGFloat)fontSize forState:(UIControlState)state;

//!brief 字体大小
@property (nonatomic, assign) CGFloat fontSize;

//!@brief 选中状态是否加粗字体
@property (nonatomic, assign) BOOL selectedFontSizeBold;


//!@brief 设置背景色
- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

@end
