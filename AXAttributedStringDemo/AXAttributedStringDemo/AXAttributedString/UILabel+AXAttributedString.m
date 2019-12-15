//
//  UILabel+AXAttributedString.m
//  AXAttributedStringDemo
//
//  Created by arnoldxiao on 2019/12/15.
//  Copyright © 2019 xiaochenghua. All rights reserved.
//

#import "UILabel+AXAttributedString.h"
#import "AXAttributedString.h"

@implementation UILabel (AXAttributedString)

- (void)setAttributedStringUsingBlock:(void (NS_NOESCAPE ^)(AXAttributedStringMaker * _Nonnull))block {
    self.attributedText = [AXAttributedString makeAttributedString:block];
}

@end
