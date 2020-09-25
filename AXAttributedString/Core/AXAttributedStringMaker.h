//
//  AXAttributedStringMaker.h
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/5.
//  Email: arnoldxiao@163.com
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXAttributedStringSegment.h"

NS_ASSUME_NONNULL_BEGIN

@interface AXAttributedStringMaker : NSObject
@property (nonatomic, copy, readonly) AXAttributedStringSegment *(^text)(NSString *text);
@property (nonatomic, copy, readonly) AXAttributedStringSegment *(^htmlText)(NSString *htmlText);
@property (nonatomic, copy, readonly) AXAttributedStringSegment *(^children)(NSArray<AXAttributedStringSegment *> *children);

- (NSAttributedString *)install;

@end

NS_ASSUME_NONNULL_END
