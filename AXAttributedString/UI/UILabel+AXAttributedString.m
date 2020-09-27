//
//  UILabel+AXAttributedString.m
//  AXAttributedString
//
//  Created by arnoldxiao on 2019/12/15.
//  Email: arnoldxiao@163.com
//  Copyright © 2019 xiaochenghua. All rights reserved.
//

#import "UILabel+AXAttributedString.h"
//#import "AXAttributedString.h"
#import "NSAttributedString+AXAdditional.h"

@implementation UILabel (AXAttributedString)

- (void)setAttributedTextUsingBlock:(void (NS_NOESCAPE ^)(AXAttributedStringMaker * _Nonnull))block {
//    self.attributedText = [AXAttributedString makeAttributedString:block];
    self.attributedText = [NSAttributedString ax_attributedStringUsingBlock:block];
}

@end
