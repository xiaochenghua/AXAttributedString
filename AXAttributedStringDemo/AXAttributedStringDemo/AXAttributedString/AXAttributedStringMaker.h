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
 For the given text, Maker needs to be responsible for the first call
 */
- (AXAttributedStringChain *(^)(NSString *text))text;

/**
 Splice and return the Sub-AttributedString
 */
- (NSAttributedString *)install;

@end

NS_ASSUME_NONNULL_END
