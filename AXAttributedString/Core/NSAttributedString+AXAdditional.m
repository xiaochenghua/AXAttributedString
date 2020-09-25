//
//  NSAttributedString+AXAdditional.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2020/9/25.
//  Email: arnoldxiao@163.com
//  Copyright © 2020 xiaochenghua. All rights reserved.
//

#import "NSAttributedString+AXAdditional.h"

@implementation NSAttributedString (AXAdditional)

+ (instancetype)ax_attributedStringUsingBlock:(void (NS_NOESCAPE ^)(AXAttributedStringMaker * _Nonnull make))block {
    AXAttributedStringMaker *make = [[AXAttributedStringMaker alloc] init];
    block(make);
    return [make install];
}

@end
