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

/**
 常规字符串
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentStringBlock text;

/**
 html字符串
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentStringBlock htmlText;

/**
 children容器
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentChildrenBlock children;

/**
 组装所有segment对象
 */
- (NSAttributedString *)install;

@end

NS_ASSUME_NONNULL_END
