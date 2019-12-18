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

@protocol AXAttributedStringSetting <NSObject>

@required
- (void)setAttributedStringUsingBlock:(void(NS_NOESCAPE ^)(AXAttributedStringMaker *make))block;

@end

NS_ASSUME_NONNULL_END
