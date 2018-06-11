//
//  AXAttributedStringMaker.h
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/5.
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXAttributedStringChain.h"

NS_ASSUME_NONNULL_BEGIN

@interface AXAttributedStringMaker : NSObject

- (AXAttributedStringChain *(^)(NSString *text))text;

- (NSAttributedString *)install;

@end

NS_ASSUME_NONNULL_END
