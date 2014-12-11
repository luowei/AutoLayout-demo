//
//  KeyboardView.m
//  contraint-test
//
//  Created by luowei on 14/12/11.
//  Copyright (c) 2014年 luowei. All rights reserved.
//

#import "KeyboardView.h"

@implementation KeyboardView

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
         self.backgroundColor = [UIColor grayColor];
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }

    return self;
}


@end
