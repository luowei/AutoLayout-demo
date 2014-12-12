//
//  InputBackgroundView.m
//  contraint-test
//
//  Created by luowei on 14/12/11.
//  Copyright (c) 2014年 luowei. All rights reserved.
//

#import "InputBackgroundView.h"
#import "KeyboardView.h"
#import "FullKeyboard.h"

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

    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat height = (CGFloat) (screenSize.height > screenSize.width ? 256 : 200);


    //给键盘添加约束

    if (self.keyboard && self.keyboard.superview &&
            [self.keyboard.superview isEqual:self]) {

        //给 keyboard 添加相对于 inputBackgroundView 的约束
        [self addConstraintWithView:self.keyboard withWidth:screenSize.width - 20 toView:self];

        if(self.keyboardViewConstraints){
            [self removeConstraints:self.keyboardViewConstraints];
            [self.keyboardViewConstraints removeAllObjects];
        }else{
            self.keyboardViewConstraints = @[].mutableCopy;
        }

        NSDictionary *dictionary = @{@"view" : self.keyboard};
        [self.keyboardViewConstraints addObjectsFromArray:[NSLayoutConstraint
                constraintsWithVisualFormat:@"|-10-[view]"
                                    options:(NSLayoutFormatOptions) 0
                                    metrics:nil //@{@"height":@(self.height)}
                                      views:dictionary]];
        [self.keyboardViewConstraints addObjectsFromArray:[NSLayoutConstraint
                constraintsWithVisualFormat:@"V:|-10-[view(height)]-10-|"
                                    options:(NSLayoutFormatOptions) 0
                                    metrics:@{@"height" : @(height - 40 - 20)}
                                      views:dictionary]];

        [self addConstraints:[NSArray arrayWithArray:self.keyboardViewConstraints]];

        //通知 keyboard 需要更新约束
        [self.keyboard setNeedsUpdateConstraints];

    }


    if (self.fullKeyboard && self.fullKeyboard.superview &&
            [self.fullKeyboard.superview isEqual:self]) {

        //给 fullKeyboard 添加相对于 inputBackgroundView 的约束
        [self addConstraintWithView:self.fullKeyboard withWidth:screenSize.width - 20 toView:self];

        if(self.fullKeyboardConstraints){
            [self removeConstraints:self.fullKeyboardConstraints];
            [self.fullKeyboardConstraints removeAllObjects];
        }else{
            self.fullKeyboardConstraints = @[].mutableCopy;
        }

        NSDictionary *dictionary = @{@"view" : self.fullKeyboard};
        [self.fullKeyboardConstraints addObjectsFromArray:[NSLayoutConstraint
                constraintsWithVisualFormat:@"|-10-[view]"
                                    options:(NSLayoutFormatOptions) 0
                                    metrics:nil //@{@"height":@(self.height)}
                                      views:dictionary]];
        [self.fullKeyboardConstraints addObjectsFromArray:[NSLayoutConstraint
                constraintsWithVisualFormat:@"V:|-10-[view(height)]-10-|"
                                    options:(NSLayoutFormatOptions) 0
                                    metrics:@{@"height" : @(height - 40 - 20)}
                                      views:dictionary]];

        [self addConstraints:[NSArray arrayWithArray:self.fullKeyboardConstraints]];

        //通知 fullKeyboard 需要更新约束
        [self.fullKeyboard setNeedsUpdateConstraints];

    }

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
