//
//  MyInputView.h
//  contraint-test
//
//  Created by luowei on 14/12/11.
//  Copyright (c) 2014年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InputBackgroundView;

@interface MyInputView : UIView

@property(nonatomic, strong) InputBackgroundView* keyboardBackgroundView;

@property(nonatomic, strong) NSMutableArray *keyboardBackgroundViewConstrains;

@property(nonatomic, strong) NSLayoutConstraint *keyboardBackgroundWidthConstraint;


@end
