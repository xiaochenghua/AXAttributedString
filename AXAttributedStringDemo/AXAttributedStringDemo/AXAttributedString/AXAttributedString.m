//
//  AXAttributedString.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/5.
//  Email: arnoldxiao@163.com
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import "AXAttributedString.h"

#pragma mark - UILabel (AXAttributedString)

@implementation UILabel (AXAttributedString)

- (void)axa_setAttributedStringUsingBlock:(void (^)(AXAttributedStringMaker * _Nonnull))block {
    self.attributedText = [AXAttributedString makeAttributedString:block];
}

@end

#pragma mark - UITextField (AXAttributedString)

@implementation UITextField (AXAttributedString)

- (void)axa_setAttributedStringUsingBlock:(void (^)(AXAttributedStringMaker * _Nonnull))block {
    self.attributedText = [AXAttributedString makeAttributedString:block];
}

@end

#pragma mark - UITextView (AXAttributedString)

@implementation UITextView (AXAttributedString)

- (void)axa_setAttributedStringUsingBlock:(void (^)(AXAttributedStringMaker * _Nonnull))block {
    self.attributedText = [AXAttributedString makeAttributedString:block];
}

@end

#pragma mark - AXAttributedString

@implementation AXAttributedString

#pragma mark - private methods

+ (NSAttributedString *)makeAttributedString:(void(NS_NOESCAPE ^)(AXAttributedStringMaker * _Nonnull))block {
    AXAttributedStringMaker *make = [[AXAttributedStringMaker alloc] init];
    block(make);
    return [make install];
}

@end
