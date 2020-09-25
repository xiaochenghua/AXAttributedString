//
//  UIButton+AXAttributedString.m
//  AXAttributedString
//
//  Created by chenghua.xiao on 2020/3/18.
//  Email: arnoldxiao@163.com
//  Copyright © 2019 xiaochenghua. All rights reserved.
//

#import "UIButton+AXAttributedString.h"
#import "AXAttributedString.h"

@implementation UIButton (AXAttributedString)

- (void)setAttributedStringUsingBlock:(void (NS_NOESCAPE ^)(AXAttributedStringMaker * _Nonnull))block forState:(UIControlState)state {
//    [self setAttributedTitle:[AXAttributedString makeAttributedString:block] forState:state];
}

@end
