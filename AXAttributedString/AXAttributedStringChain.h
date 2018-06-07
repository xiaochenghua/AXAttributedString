//
//  AXAttributedStringChain.h
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/6.
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AXAttributedStringChain : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong, readonly) NSMutableArray<NSMutableAttributedString *> *attributedStrings;

- (AXAttributedStringChain *(^)(UIColor *color))foregroundColor;
- (AXAttributedStringChain *(^)(UIColor *color))backgroundColor;
- (AXAttributedStringChain *(^)(UIFont *font))font;
- (AXAttributedStringChain *(^)(NSUnderlineStyle style))underline;
- (AXAttributedStringChain *(^)(UIColor *color))underlineColor;
- (AXAttributedStringChain *(^)(CGFloat offset))baseline;
- (AXAttributedStringChain *(^)(NSUnderlineStyle style))strike;
- (AXAttributedStringChain *(^)(UIColor *color))strikeColor;
- (AXAttributedStringChain *(^)(NSParagraphStyle *style))paragraphStyle;

@end

NS_ASSUME_NONNULL_END
