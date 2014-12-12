//
//  KeyboardView.m
//  contraint-test
//
//  Created by luowei on 14/12/11.
//  Copyright (c) 2014年 luowei. All rights reserved.
//

#import "KeyboardView.h"

@implementation KeyboardView

//+ (instancetype)sharedClient {
//
//    static KeyboardView *_keyboardView = nil;
//
//    static dispatch_once_t onceToken;
//
//    dispatch_once(&onceToken, ^{
//
//        _keyboardView = [[KeyboardView alloc] init];
//
//    });
//
//    return _keyboardView;
//
//}


- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }

    return self;
}


@end
