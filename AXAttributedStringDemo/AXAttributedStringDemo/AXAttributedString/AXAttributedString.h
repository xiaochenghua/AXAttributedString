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

@protocol AXViewAttributeTextAssignment <NSObject>

@required

- (void)axa_setAttributedStringUsingBlock:(void(^)(AXAttributedStringMaker *make))block;

@end

@interface UILabel (AXAttributedString) <AXViewAttributeTextAssignment>
@end

@interface UITextField (AXAttributedString) <AXViewAttributeTextAssignment>
@end

@interface UITextView (AXAttributedString) <AXViewAttributeTextAssignment>
@end

@interface AXAttributedString : NSObject

/**
 Build iOS Native rich-text [NSAttributedString] easily.
 */
+ (NSAttributedString *)makeAttributedString:(void(NS_NOESCAPE ^)(AXAttributedStringMaker *make))block;

@end

NS_ASSUME_NONNULL_END
