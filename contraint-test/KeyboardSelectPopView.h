//
//  RCKeyboardSelectView.h
//  InputMethod
//
//  Created by 王钰钢 on 14/11/5.
//  Copyright (c) 2014年 2345.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KeyboardSelectPopDelegate <NSObject>

@end

@interface KeyboardSelectPopView : UIView

@property (nonatomic, assign) id<KeyboardSelectPopDelegate>delegate;


@end
