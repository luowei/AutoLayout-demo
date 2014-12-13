//
//  ViewController.m
//  contraint-test
//
//  Created by luowei on 14/12/11.
//  Copyright (c) 2014年 luowei. All rights reserved.
//

#import "ViewController.h"
#import "MyInputView.h"
#import "InputBackgroundView.h"
#import "KeyboardView.h"
#import "FullKeyboard.h"
#import "KeyboardSelectPopView.h"

@interface ViewController ()
- (IBAction)keyboardClick:(UIButton *)sender;

- (IBAction)fullKeyboard:(UIButton *)sender;

@end

@implementation ViewController


- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];


    //通知 view 需要更新约束
    [self.view setNeedsUpdateConstraints];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController *controller = storyboard.instantiateInitialViewController;

    self.myInputView = [[MyInputView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:self.myInputView];

    self.myInputView.keyboardBackgroundView = [[InputBackgroundView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.myInputView addSubview:self.myInputView.keyboardBackgroundView];

//    KeyboardView *keyboard = [[NSBundle mainBundle] loadNibNamed:@"KeyboardView" owner:self options:nil][0];
//    self.myInputView.keyboardBackgroundView.keyboard = keyboard;
//    [self.myInputView.keyboardBackgroundView addSubview:keyboard];
//
//    FullKeyboard *fullKeyboard = [[NSBundle mainBundle] loadNibNamed:@"FullKeyboard" owner:self options:nil][0];
//    self.myInputView.keyboardBackgroundView.fullKeyboard = fullKeyboard;
//    [self.myInputView.keyboardBackgroundView addSubview:fullKeyboard];
//
//    KeyboardSelectPopView *keyboardSelectPopView = [[NSBundle mainBundle] loadNibNamed:@"KeyboardSelectPopView" owner:self options:nil][0];
//    self.myInputView.keyboardBackgroundView.keyboardSelectPopView = keyboardSelectPopView;
//    [self.myInputView.keyboardBackgroundView addSubview:keyboardSelectPopView];
    

    [self updateViewConstraints];
}

- (void)updateViewConstraints {
    [super updateViewConstraints];

    //添加 myInputView 相对于 self.view 的约束
    [self addMyInputViewConstraints];

    //通知 myInputView 需要更新约束
    [self.myInputView setNeedsUpdateConstraints];
}

#pragma mark 添加 MyInputView 相对于 View 的约束

- (void)addMyInputViewConstraints {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat height = (CGFloat) (screenSize.height > screenSize.width ? 256 : 200);

    NSDictionary *dictionary = @{@"myInputView" : self.myInputView};
    if (self.verticalConstraints) {
        [self.view removeConstraints:[NSArray arrayWithArray:self.verticalConstraints]];
        [self.verticalConstraints removeAllObjects];
    }else{
        self.verticalConstraints = @[].mutableCopy;
    }
    self.verticalConstraints = [NSLayoutConstraint
            constraintsWithVisualFormat:@"V:[myInputView(height)]|"
                                options:(NSLayoutFormatOptions) 0
                                metrics:@{@"height" : @(height)}
                                  views:dictionary].mutableCopy;
    [self.view addConstraints:[NSArray arrayWithArray:self.verticalConstraints]];


    if (!self.horizonConstraints) {
        [self.view removeConstraints:[NSArray arrayWithArray:self.horizonConstraints]];
        [self.horizonConstraints removeAllObjects];
    }else{
        self.horizonConstraints = @[].mutableCopy;
    }
    self.horizonConstraints = [NSLayoutConstraint
            constraintsWithVisualFormat:@"H:|[myInputView]|"
                                options:(NSLayoutFormatOptions) 0
                                metrics:@{@"width" : @(screenSize.width)}
                                  views:dictionary].mutableCopy;
    [self.view addConstraints:[NSArray arrayWithArray:self.horizonConstraints]];
}


- (IBAction)keyboardClick:(UIButton *)sender {

    [self removeAllKeyboardSubViews];

    if(!self.myInputView.keyboardBackgroundView.keyboard){
        self.myInputView.keyboardBackgroundView.keyboard = [[NSBundle mainBundle] loadNibNamed:@"KeyboardView" owner:self options:nil][0];
    }
    [self.myInputView.keyboardBackgroundView addSubview:self.myInputView.keyboardBackgroundView.keyboard];

    [self updateViewConstraints];
}

- (IBAction)fullKeyboard:(UIButton *)sender {

    [self removeAllKeyboardSubViews];

    if(!self.myInputView.keyboardBackgroundView.fullKeyboard) {
        self.myInputView.keyboardBackgroundView.fullKeyboard =  [[NSBundle mainBundle] loadNibNamed:@"FullKeyboard" owner:self options:nil][0];
    }
    [self.myInputView.keyboardBackgroundView addSubview:self.myInputView.keyboardBackgroundView.fullKeyboard];

    [self updateViewConstraints];
}

- (IBAction)keyboardSelectPop:(UIButton *)sender {

    [self removeAllKeyboardSubViews];

    if(!self.myInputView.keyboardBackgroundView.keyboardSelectPopView) {
        self.myInputView.keyboardBackgroundView.keyboardSelectPopView =  [[NSBundle mainBundle] loadNibNamed:@"KeyboardSelectPopView" owner:self options:nil][0];
    }
    [self.myInputView.keyboardBackgroundView addSubview:self.myInputView.keyboardBackgroundView.keyboardSelectPopView];
    
    [self updateViewConstraints];
    
}

- (void)removeAllKeyboardSubViews {
    for(UIView *view  in self.myInputView.keyboardBackgroundView.subviews){
//        if(![view.class isKindOfClass:[UIView class]]){
        if(![view isMemberOfClass:[UIButton class]]){
            [view removeFromSuperview];
        }
    }
}
@end
