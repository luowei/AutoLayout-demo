//
//  RCKeyboardSelectView.m
//  InputMethod
//
//  Created by 王钰钢 on 14/11/5.
//  Copyright (c) 2014年 2345.com. All rights reserved.
//

#import "KeyboardSelectPopView.h"

@implementation KeyboardSelectPopView

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }

    return self;
}

@end
