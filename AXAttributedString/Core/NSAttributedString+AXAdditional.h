//
//  NSAttributedString+AXAdditional.h
//  AXAttributedString
//
//  Created by xiaochenghua on 2020/9/25.
//  Email: arnoldxiao@163.com
//  Copyright © 2020 xiaochenghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXAttributedStringMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (AXAdditional)

+ (instancetype)ax_attributedStringUsingBlock:(void (NS_NOESCAPE ^)(AXAttributedStringMaker * _Nonnull make))block;

@end

NS_ASSUME_NONNULL_END
