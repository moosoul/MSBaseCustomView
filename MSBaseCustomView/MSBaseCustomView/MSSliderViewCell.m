//
//  MSSliderViewCell.m
//  MSBaseCustomView
//
//  Created by moosoul on 4/13/16.
//  Copyright © 2016 moosoul. All rights reserved.
//

#import "MSSliderViewCell.h"

@interface MSSliderViewCell()

//@property (nonatomic, assign) CGFloat normalFontSize;
//@property (nonatomic, assign) CGFloat selectedFontSize;

@property (weak, nonatomic) IBOutlet UIButton *titleButton;
@property (weak, nonatomic) IBOutlet UIView *underlineView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *underlineWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *underlineHeightConstraint;

- (IBAction)titleBtnClicked:(UIButton *)sender;

@end

@implementation MSSliderViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    _underlineWidthConstraint.constant = 0.0f;
    [_underlineView setNeedsLayout];
    [_underlineView layoutIfNeeded];
    [_titleButton setTitle:title forState:UIControlStateNormal];
    [_titleButton setTitle:title forState:UIControlStateHighlighted];
    [_titleButton setTitle:title forState:UIControlStateSelected];
}

- (void)setTitleButton:(UIButton *)titleButton
{
    _titleButton = titleButton;
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state
{
    [_titleButton setTitleColor:color forState:state];
}

/*
- (void)setTitleFontSize:(CGFloat)fontSize forState:(UIControlState)state
{
    switch (state) {
        case UIControlStateNormal:
            _normalFontSize = fontSize;
            break;
        case UIControlStateSelected:
            _selectedFontSize = fontSize;
        default:
            break;
    }
    
    _titleButton.titleLabel.font = [UIFont systemFontOfSize:fontSize];
}
*/

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state
{
    
}

- (void)setShowUnderline:(BOOL)showUnderline
{
    _showUnderline = showUnderline;
    _underlineView.hidden = !showUnderline;
}

- (void)setTitleButtonSelected:(BOOL)titleButtonSelected
{
    _titleButtonSelected = titleButtonSelected;
    _titleButton.enabled = !titleButtonSelected;
    
    if (_titleButton.enabled) {
        self.underlineWidth = 0.0f;
        _titleButton.titleLabel.font = [UIFont systemFontOfSize:_fontSize];
    } else {
        UIFont *selectedFont;
        if (_selectedFontSizeBold) {
            selectedFont = [UIFont boldSystemFontOfSize:_fontSize];
        } else {
            selectedFont = [UIFont systemFontOfSize:_fontSize];
        }
        
        _titleButton.titleLabel.font = selectedFont;
        CGFloat width = [self.title boundingRectWithSize:CGSizeMake(MAXFLOAT, self.bounds.size.height) options:NSStringDrawingUsesFontLeading| NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: selectedFont} context:nil].size.width;
        self.underlineWidth = width;
    }
}

- (void)setUnderlineWidth:(CGFloat)underlineWidth
{
    _underlineWidth = underlineWidth;
    _underlineWidthConstraint.constant = underlineWidth;
    [UIView animateWithDuration:0.35f animations:^{
        [_underlineView setNeedsLayout];
        [_underlineView layoutIfNeeded];
    }];
}

- (void)setUnderlineColor:(UIColor *)underlineColor
{
    _underlineColor = underlineColor;
    _underlineView.backgroundColor = underlineColor;
}

- (void)setUnderlineHeight:(CGFloat)underlineHeight
{
    _underlineHeight = underlineHeight;
    _underlineHeightConstraint.constant = underlineHeight;
    [_underlineView setNeedsLayout];
    [_underlineView layoutIfNeeded];
}

- (IBAction)titleBtnClicked:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(ms_sliderViewCell:didSelectedTitleButton:)]) {
        [_delegate ms_sliderViewCell:self didSelectedTitleButton:sender];
    }
}

- (void)setFontSize:(CGFloat)fontSize
{
    _fontSize = fontSize;
    _titleButton.titleLabel.font = [UIFont systemFontOfSize:fontSize];
}

@end
