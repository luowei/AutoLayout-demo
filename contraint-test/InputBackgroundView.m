//
//  InputBackgroundView.m
//  contraint-test
//
//  Created by luowei on 14/12/11.
//  Copyright (c) 2014年 luowei. All rights reserved.
//

#import "InputBackgroundView.h"
#import "KeyboardView.h"

@implementation InputBackgroundView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
         self.backgroundColor = [UIColor greenColor];
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }

    return self;
}

- (void)updateConstraints {
    [super updateConstraints];


    //给全键盘添加约束
    if (self.keyboard && self.keyboard.superview &&
            [self.keyboard.superview isEqual:self]) {

        //给 keyboard 添加相对于 inputBackgroundView 的约束
        [self addKeyboardConstraintsWithView:self.keyboard];

        //通知 keyboard 需要更新约束
        [self.keyboard setNeedsUpdateConstraints];

    }

}

#pragma mark 给 keyboard 添加相对于 inputBackgroundView 的约束

- (void)addKeyboardConstraintsWithView:(UIView *)view {
    if (!view)
        return;

    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat height = (CGFloat) (screenSize.height > screenSize.width ? 256 : 200);

    [self addConstraintWithView:view withWidth:screenSize.width-20 toView:self];


    if (!self.keyboardViewConstraints) {
        self.keyboardViewConstraints = @[].mutableCopy;
    } else {
        [self removeConstraints:self.keyboardViewConstraints];
        [self.keyboardViewConstraints removeAllObjects];
    }

    NSDictionary *dictionary = @{@"view" : view};
    [self.keyboardViewConstraints addObjectsFromArray:[NSLayoutConstraint
            constraintsWithVisualFormat:@"|-10-[view]"
                                options:(NSLayoutFormatOptions) 0
                                metrics:nil //@{@"height":@(self.height)}
                                  views:dictionary]];
    [self.keyboardViewConstraints addObjectsFromArray:[NSLayoutConstraint
            constraintsWithVisualFormat:@"V:|-10-[view(height)]-10-|"
                                options:(NSLayoutFormatOptions) 0
                                metrics:@{@"height":@(height-40-20)}
                                  views:dictionary]];

    [self addConstraints:[NSArray arrayWithArray:self.keyboardViewConstraints]];
}

#pragma mark 给键盘View添加宽度约束

- (void)addConstraintWithView:(UIView *)view withWidth:(CGFloat)width toView:(UIView *)containerView {
    if (view) {
        if (self.keyboardWidthConstraint) {
            [containerView removeConstraint:self.keyboardWidthConstraint];
        }
        view.translatesAutoresizingMaskIntoConstraints = NO;
        self.keyboardWidthConstraint = [NSLayoutConstraint
                constraintWithItem:view
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                            toItem:nil
                         attribute:NSLayoutAttributeWidth
                        multiplier:1
                          constant:width];

        [containerView addConstraint:self.keyboardWidthConstraint];
    }
}


@end
