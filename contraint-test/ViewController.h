//
//  ViewController.h
//  contraint-test
//
//  Created by luowei on 14/12/11.
//  Copyright (c) 2014年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyInputView;
@class InputBackgroundView;

@interface ViewController : UIViewController


@property(nonatomic, strong) MyInputView *myInputView;
@property(nonatomic, strong) InputBackgroundView *backgroundView;
@property(nonatomic, strong) NSMutableArray *verticalConstraints;
@property(nonatomic, strong) NSMutableArray *horizonConstraints;

@end

