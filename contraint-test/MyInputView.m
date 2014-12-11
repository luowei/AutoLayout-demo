//
//  MyInputView.m
//  contraint-test
//
//  Created by luowei on 14/12/11.
//  Copyright (c) 2014年 luowei. All rights reserved.
//

#import "MyInputView.h"
#import "InputBackgroundView.h"

@implementation MyInputView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }

    return self;
}

- (void)updateConstraints {
    [super updateConstraints];

    //添加键盘背景约束
    if (self.keyboardBackgroundView && self.keyboardBackgroundView.superview && [self.keyboardBackgroundView.superview isEqual:self]) {

        //添加 keyboardBackgroundView 相对于 myInputView 的约束
        [self addConstraintsWithKeyboardBackground:self.keyboardBackgroundView];

        //通知 keyboardBackgroundView 需要更新约束
        [self.keyboardBackgroundView setNeedsUpdateConstraints];

    }




}

- (void)addConstraintsWithKeyboardBackground:(UIView *)keyboardBackgroundView {

    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat height = (CGFloat) (screenSize.height > screenSize.width ? 256 : 200);

    if (!self.keyboardBackgroundViewConstrains) {
        self.keyboardBackgroundViewConstrains = @[].mutableCopy;
    } else {
        [self removeConstraints:self.keyboardBackgroundViewConstrains];
        [self.keyboardBackgroundViewConstrains removeAllObjects];
    }

    NSDictionary *dictionary = @{@"keyboardBackgroundView" : keyboardBackgroundView};
    //水平方向左右对齐
    [self.keyboardBackgroundViewConstrains addObjectsFromArray:[NSLayoutConstraint
            constraintsWithVisualFormat:@"|[keyboardBackgroundView]"
                                options:(NSLayoutFormatOptions) 0
                                metrics:nil
                                  views:dictionary]];

    //垂直方向上对齐,高度指定为KEYBOARD_TOOLBAR_HEIGHT
    [self.keyboardBackgroundViewConstrains addObjectsFromArray:[NSLayoutConstraint
            constraintsWithVisualFormat:@"V:[keyboardBackgroundView(==height)]|"
                                options:(NSLayoutFormatOptions) 0
                                metrics:@{@"height" : @(height-40.0)}
                                  views:dictionary]];


    [self addConstraints:self.keyboardBackgroundViewConstrains];

    //添加宽度约束
    if (self.keyboardBackgroundWidthConstraint) {
        [self removeConstraint:self.keyboardBackgroundWidthConstraint];
    }
    self.keyboardBackgroundWidthConstraint = [NSLayoutConstraint
            constraintWithItem:keyboardBackgroundView
                     attribute:NSLayoutAttributeWidth
                     relatedBy:NSLayoutRelationEqual
                        toItem:nil
                     attribute:NSLayoutAttributeWidth
                    multiplier:1
                      constant:screenSize.width];

    [self addConstraint:self.keyboardBackgroundWidthConstraint];
}


@end
