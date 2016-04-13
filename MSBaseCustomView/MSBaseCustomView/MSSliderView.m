//
//  MSSliderView.m
//  MSBaseCustomView
//
//  Created by moosoul on 4/13/16.
//  Copyright © 2016 moosoul. All rights reserved.
//

#import "MSSliderView.h"
#import "MSSliderViewCell.h"

@interface MSSliderView() <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MSSliderViewCellDelegate>

@property (nonatomic, assign) NSInteger currentSelectedIndex;

@end

@implementation MSSliderView

- (void)awakeFromNib
{
    [self setupDefaultValue];
}

- (void)setupDefaultValue
{
    if (_scrollPosition == UICollectionViewScrollPositionNone) {
        _scrollPosition = UICollectionViewScrollPositionCenteredHorizontally;
    }
    
    if (!_normalTitleColor) {
        _normalTitleColor = [UIColor lightGrayColor];
    }
    
    if (!_selectedTitleColor) {
        _selectedTitleColor = [UIColor blackColor];
    }

    if (_fontSize == 0.0f) {
        _fontSize = 14.0f;
    }

    if (!_underlineColor) {
        _underlineColor = [UIColor redColor];
    }

    if (_underlineHeight == 0.0f) {
        _underlineHeight = 2.0f;
    }

    
    if (!_datasource) {
        _datasource = [NSMutableArray array];
    }
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _datasource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MSSliderViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MSSliderViewCell class]) forIndexPath:indexPath];
    // 设置cell的数据源
    cell.title = [_datasource objectAtIndex:indexPath.row];
    cell.delegate = self;
    
    // 初始化cell的相关值
    cell.showUnderline = _showUnderline;
    cell.underlineColor = _underlineColor;
    cell.underlineHeight = _underlineHeight;
    cell.fontSize = _fontSize;
    cell.selectedFontSizeBold = _selectedFontSizeBold;
    
    [cell setTitleColor:_normalTitleColor forState:UIControlStateNormal];
    [cell setTitleColor:_selectedTitleColor forState:UIControlStateHighlighted];
    [cell setTitleColor:_selectedTitleColor forState:UIControlStateDisabled];
    
    cell.titleButtonSelected = (_currentSelectedIndex == indexPath.row);
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title = [_datasource objectAtIndex:indexPath.row];

    CGFloat width = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, self.bounds.size.height) options:NSStringDrawingUsesFontLeading| NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:_fontSize]} context:nil].size.width;
    return CGSizeMake(width + 16.0f, self.bounds.size.height);
}

#pragma mark - custom delegate
- (void)ms_sliderViewCell:(MSSliderViewCell *)cell didSelectedTitleButton:(UIButton *)sender
{
    NSIndexPath *selectIndexPath = [_collectionView indexPathForCell:cell];
    NSIndexPath *deSelectIndexPath = [NSIndexPath indexPathForRow:_currentSelectedIndex inSection:selectIndexPath.section];
    if (selectIndexPath.row == _currentSelectedIndex) {
        return;
    }
    
    [self selectItemAtIndexPath:selectIndexPath deSelectItemAtIndexPath:deSelectIndexPath animated:_scrollAnimated];
}

- (void)setCollectionView:(UICollectionView *)collectionView
{
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MSSliderViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([MSSliderViewCell class])];
    collectionView.backgroundView = nil;
    collectionView.backgroundColor = [UIColor clearColor];
    
    _collectionView = collectionView;
}

- (void)selectItemAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated
{
    
    NSIndexPath *deSelectIndexPath = [NSIndexPath indexPathForRow:_currentSelectedIndex inSection:indexPath.section];
    if (indexPath.row == deSelectIndexPath.row) {
        return;
    }
    
    [self selectItemAtIndexPath:indexPath deSelectItemAtIndexPath:deSelectIndexPath animated:animated];
}

- (void)selectItemAtIndexPath:(NSIndexPath *)selectIndexPath deSelectItemAtIndexPath:(NSIndexPath *)deSelectIndexPath animated:(BOOL)animated
{
    MSSliderViewCell *selectCell = (MSSliderViewCell *)[_collectionView cellForItemAtIndexPath:selectIndexPath];
    MSSliderViewCell *deSelectCell = (MSSliderViewCell *)[_collectionView cellForItemAtIndexPath:deSelectIndexPath];
    selectCell.titleButtonSelected = YES;
    deSelectCell.titleButtonSelected = NO;
    [_collectionView scrollToItemAtIndexPath:selectIndexPath atScrollPosition:_scrollPosition animated:animated];
    _currentSelectedIndex = selectIndexPath.row;
    
    if ([_delegate respondsToSelector:@selector(ms_sliderView:didSelectItemAtIndexPath:didDeSelectItemAtIndexPath:)]) {
        [_delegate ms_sliderView:self didSelectItemAtIndexPath:selectIndexPath didDeSelectItemAtIndexPath:deSelectIndexPath];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
