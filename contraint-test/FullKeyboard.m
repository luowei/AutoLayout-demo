//
//  FullKeyboard.m
//  contraint-test
//
//  Created by luowei on 14/12/12.
//  Copyright (c) 2014年 luowei. All rights reserved.
//

#import "FullKeyboard.h"

@implementation FullKeyboard

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return self;
}

@end
