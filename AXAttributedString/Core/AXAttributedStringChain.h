//
//  AXAttributedStringChain.h
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/6.
//  Email: arnoldxiao@163.com
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Macro UIColor with a hex-number. For example: UIColorFromRGB(0xFFFFFF) means white color.
 */
#define AXColorFromRGB(rgbValue) AXColorFromRGBA(rgbValue, 1.0f)

#define AXColorFromRGBA(rgbValue, alphaValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0f \
                green:((float)((rgbValue & 0x00FF00) >>  8))/255.0f \
                 blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0f \
                alpha:alphaValue]

typedef NS_ENUM(NSUInteger, AXAttributedStringTextType) {
    AXAttributedStringTextTypeNormal,       //  常规文本
    AXAttributedStringTextTypeHTML          //  HTML字符串
};

@interface AXAttributedStringChain : NSObject

/**
 List of Sub-AttributedString
 */
@property (nonatomic, strong, readonly) NSArray<NSAttributedString *> *attributedStrings;

/**
 NSForegroundColorAttributeName, default blackColor
 */
@property (nonatomic, copy, readonly) AXAttributedStringChain *(^foregroundColor)(UIColor *color);

/**
 NSBackgroundColorAttributeName, default nil: no background
 */
@property (nonatomic, copy, readonly) AXAttributedStringChain *(^backgroundColor)(UIColor *color);

/**
 NSFontAttributeName, value is a UIFont object, default Helvetica(Neue) 12
 */
@property (nonatomic, copy, readonly) AXAttributedStringChain *(^font)(UIFont *font);

/**
 NSFontAttributeName, value is float digit.
 */
@property (nonatomic, copy, readonly) AXAttributedStringChain *(^systemFontSize)(CGFloat fontSize);

/**
 NSUnderlineStyleAttributeName, default 0: no underline, NSUnderlineStyleNone
 */
@property (nonatomic, copy, readonly) AXAttributedStringChain *(^underlineStyle)(NSUnderlineStyle style);

/**
 NSUnderlineColorAttributeName, default nil: same as foreground color
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^underlineColor)(UIColor *color);

/**
 NSBaselineOffsetAttributeName, default 0
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^baselineOffset)(CGFloat offset);

/**
 NSStrikethroughStyleAttributeName, default 0: no strikethrough, NSUnderlineStyleNone
 */
@property (nonatomic, copy, readonly) AXAttributedStringChain *(^strikethroughStyle)(NSUnderlineStyle style);

/**
 NSStrikethroughColorAttributeName, default same with foreground color
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^strikethroughColor)(UIColor *color);

/**
 NSParagraphStyleAttributeName, default defaultParagraphStyle
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^paragraphStyle)(NSParagraphStyle *style);

/**
 NSStrokeColorAttributeName, default nil: same as foreground color
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^strokeColor)(UIColor *color);

/**
 NSStrokeWidthAttributeName, default 0: no stroke
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^strokeWidth)(CGFloat width);

/**
 NSAttachmentAttributeName, default nil
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^attachment)(NSTextAttachment *attachment);

/**
 NSLinkAttributeName, url must be kind of [NSURL] or [NSString]
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^linkUrl)(NSURL *url);

/**
 NSLinkAttributeName, url must be kind of [NSURL] or [NSString]
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^linkString)(NSString *string);

/**
 NSLigatureAttributeName, default ONE: default ligatures, ZERO: no ligatures
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^ligature)(NSInteger integer);

/**
 NSKernAttributeName, default 0, kerning is disabled.
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^kern)(CGFloat kern);

/**
 NSShadowAttributeName, default nil: no shadow
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^shadow)(NSShadow *shadow);

/**
 NSTextEffectAttributeName, default nil: no text effect
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^effect)(NSString *text);

/**
 NSObliquenessAttributeName, default 0: no skew
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^obliqueness)(CGFloat obliqueness);

/**
 NSExpansionAttributeName, default 0: no expansion
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^expansion)(CGFloat expansion);

/**
 NSWritingDirectionAttributeName
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^writingDirection)(NSArray<NSNumber *> *options);

/**
 * NSVerticalGlyphFormAttributeName, 0 means horizontal text. 1 indicates vertical text.
 * Currently on iOS, it's always horizontal.  The behavior for any other value is undefined.
 */
 @property (nonatomic, copy, readonly) AXAttributedStringChain *(^verticalGlyphForm)(NSInteger integer);

/**
Set-Up segment attribute string, pass a text and text type, return self.
*/
- (AXAttributedStringChain *)setUpSegmentAttributedStringWithText:(NSString *)text type:(AXAttributedStringTextType)type;

@end

NS_ASSUME_NONNULL_END
