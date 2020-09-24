//
//  AXAttributedStringMaker.h
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/5.
//  Email: arnoldxiao@163.com
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXAttributedStringChain.h"

NS_ASSUME_NONNULL_BEGIN

@interface AXAttributedStringMaker : NSObject

/**
 For the given text
 */
- (AXAttributedStringChain *(^)(NSString *text))text;

/**
 For the given htmlText
 */
- (AXAttributedStringChain *(^)(NSString *text))htmlText;

/**
 Splice and return the Sub-AttributedString
 */
- (NSAttributedString *)install;

@end

NS_ASSUME_NONNULL_END
