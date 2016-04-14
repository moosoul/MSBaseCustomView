//
//  MSSliderView.h
//  MSBaseCustomView
//
//  Created by moosoul on 4/13/16.
//  Copyright © 2016 moosoul. All rights reserved.
//

#import "MSBaseCustomView.h"
@class MSSliderView;

@protocol MSSliderViewDelegate <NSObject>

- (void)ms_sliderView:(MSSliderView *)customView didSelectItemAtIndexPath:(NSIndexPath *)indexPath didDeSelectItemAtIndexPath:(NSIndexPath *)deSelectIndexPath;

@end

@interface MSSliderView : MSBaseCustomView

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *datasource;

//!@brief 默认选中项的index
@property (nonatomic, assign) NSInteger defaultSelectedIndex;

//!@brief 点击之后的滚动位置默认 UICollectionViewScrollPositionCenteredHorizontally
@property (nonatomic, assign) UICollectionViewScrollPosition scrollPosition;

//!@brief 点击之后是否显示滚动动画 默认 YES
@property (nonatomic, assign) BOOL scrollAnimated;

//!@brief 默认的文字颜色, 默认lightGrayColor
@property (nonatomic, strong) UIColor *normalTitleColor;

//!@brief 默认的文字大小 默认为 14.0f
@property (nonatomic, assign) CGFloat fontSize;

//!@brief 选中状态是否加粗字体
@property (nonatomic, assign) BOOL selectedFontSizeBold;

//!@brief 选中状态的字体大小 默认等于normalFontSize, 刷新的时候存在bug暂时屏蔽
//@property (nonatomic, assign) CGFloat selectedFontSize;

//!@brief 选中状态的字体加粗多少 0.0为不加粗,默认不加粗
//@property (nonatomic, assign) CGFloat selectedFontWeight;



//!@brief 选中状态的文字颜色, 默认blackColor
@property (nonatomic, strong) UIColor *selectedTitleColor;

//!@brief 是否显示下划线 默认 YES
@property (nonatomic, assign) BOOL showUnderline;

//!@brief 下划线的颜色 默认 redColor
@property (nonatomic, strong) UIColor *underlineColor;

//!@brief 下划线的高度 默认为 2.0f
@property (nonatomic, assign) CGFloat underlineHeight;

//!@brief cell间距 默认为8.0f
@property (nonatomic, assign) CGFloat margin;

@property (nonatomic, weak) id<MSSliderViewDelegate> delegate;

/**
 *  选中一个位置的item
 *
 *  @param indexPath 位置(section == 0)
 *  @param animated  是否滚动动画
 */
- (void)selectItemAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated;

@end
