//
//  InputBackgroundView.h
//  contraint-test
//
//  Created by luowei on 14/12/11.
//  Copyright (c) 2014年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KeyboardView;

@interface InputBackgroundView : UIView

@property(nonatomic, strong) KeyboardView *keyboard;
@property(nonatomic, strong) NSMutableArray *keyboardViewConstraints;
@property(nonatomic, strong) NSLayoutConstraint *keyboardWidthConstraint;
@end
