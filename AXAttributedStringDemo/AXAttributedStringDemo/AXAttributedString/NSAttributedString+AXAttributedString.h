//
//  NSAttributedString+AXAttributedString.h
//  AXAttributedStringDemo
//
//  Created by arnoldxiao on 2019/12/15.
//  Copyright © 2019 xiaochenghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXAttributedStringMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (AXAttributedString)

- (void)replaceSegmentAttributedStringUsingBlock:(void(NS_NOESCAPE ^)(AXAttributedStringMaker *make))block atIndex:(NSUInteger)index;
- (void)insertSegmentAttributedStringUsingBlock:(void(NS_NOESCAPE ^)(AXAttributedStringMaker *make))block atIndex:(NSUInteger)index;
- (void)removeSegmentAttributedStringForIndex:(NSUInteger)index;
- (void)removeAllSegmentAttributedString;

@end

NS_ASSUME_NONNULL_END
