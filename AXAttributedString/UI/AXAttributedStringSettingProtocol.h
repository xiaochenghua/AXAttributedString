//
//  AXAttributedStringSettingProtocol.h
//  AXAttributedString
//
//  Created by arnoldxiao on 2019/12/15.
//  Email: arnoldxiao@163.com
//  Copyright © 2019 xiaochenghua. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AXAttributedStringMaker;

NS_ASSUME_NONNULL_BEGIN

@protocol AXAttributedStringSettingProtocol <NSObject>

@optional

/**
 * 提供给UILabel/UITextField/UITextView使用
 */
- (void)setAttributedTextUsingBlock:(void(NS_NOESCAPE ^)(AXAttributedStringMaker *make))block;

@end

@protocol AXAttributedStringSettingForStateProtocol <NSObject>

/**
 * 提供给UIButton使用
 */
- (void)setAttributedTitleUsingBlock:(void(NS_NOESCAPE ^)(AXAttributedStringMaker *make))block forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
