//
//  AXAttributedString.h
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/5.
//  Email: arnoldxiao@163.com
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXAttributedStringMaker.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AXAttributeStringUIProtocol <NSObject>

@required
/**
 使用AXAttributedString类给attributedText赋值
 */
- (void)axa_setAttributedStringUsingBlock:(void(^)(AXAttributedStringMaker *make))block;
@end

/**
 UILabel Category
 */
@interface UILabel (AXAttributedString) <AXAttributeStringUIProtocol>
@end

/**
 UITextField Category
 */
@interface UITextField (AXAttributedString) <AXAttributeStringUIProtocol>
@end

/**
 UITextView Category
 */
@interface UITextView (AXAttributedString) <AXAttributeStringUIProtocol>
@end

@interface AXAttributedString : NSObject

/**
 Build iOS Native rich-text [NSAttributedString] easily.
 */
+ (NSAttributedString *)makeAttributedString:(void(NS_NOESCAPE ^)(AXAttributedStringMaker *make))block;

@end

NS_ASSUME_NONNULL_END
