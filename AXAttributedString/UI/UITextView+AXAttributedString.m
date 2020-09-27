//
//  UITextView+AXAttributedString.m
//  AXAttributedString
//
//  Created by arnoldxiao on 2019/12/15.
//  Email: arnoldxiao@163.com
//  Copyright © 2019 xiaochenghua. All rights reserved.
//

#import "UITextView+AXAttributedString.h"
#import "NSAttributedString+AXAdditional.h"

@implementation UITextView (AXAttributedString)

- (void)setAttributedTextUsingBlock:(void (NS_NOESCAPE ^)(AXAttributedStringMaker * _Nonnull))block {
    self.attributedText = [NSAttributedString ax_attributedStringUsingBlock:block];
}

@end
