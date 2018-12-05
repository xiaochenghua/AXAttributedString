//
//  AXAttributedStringChain.h
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/6.
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 Macro UIColor with a Hex-number. for example: UIColorFromRGB(0xFFFFFF) is White.
 */
#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0f green:((float)((rgbValue & 0x00FF00) >> 8))/255.0f blue:((float)(rgbValue & 0x0000FF))/255.0f alpha:1.0f]

NS_ASSUME_NONNULL_BEGIN

@interface AXAttributedStringChain : NSObject

/**
 attributedStrings
 */
@property (nonatomic, strong, readonly) NSArray<NSMutableAttributedString *> *attributedStrings;

/**
 NSForegroundColorAttributeName
 */
- (AXAttributedStringChain *(^)(UIColor *color))foregroundColor;

/**
 NSBackgroundColorAttributeName
 */
- (AXAttributedStringChain *(^)(UIColor *color))backgroundColor;

/**
 NSFontAttributeName, value is a UIFont object.
 */
- (AXAttributedStringChain *(^)(UIFont *font))font;

/**
 NSFontAttributeName, value is float digit.
 */
- (AXAttributedStringChain *(^)(CGFloat floating))systemFont;

/**
 NSUnderlineStyleAttributeName
 */
- (AXAttributedStringChain *(^)(NSUnderlineStyle style))underline;

/**
 NSUnderlineColorAttributeName
 */
- (AXAttributedStringChain *(^)(UIColor *color))underlineColor;

/**
 NSBaselineOffsetAttributeName
 */
- (AXAttributedStringChain *(^)(CGFloat offset))baseline;

/**
 NSStrikethroughStyleAttributeName
 */
- (AXAttributedStringChain *(^)(NSUnderlineStyle style))strike;

/**
 NSStrikethroughColorAttributeName
 */
- (AXAttributedStringChain *(^)(UIColor *color))strikeColor;

/**
 NSParagraphStyleAttributeName
 */
- (AXAttributedStringChain *(^)(NSParagraphStyle *style))paragraphStyle;

/**
 NSStrokeColorAttributeName
 */
- (AXAttributedStringChain *(^)(UIColor *color))strokeColor;

/**
 NSStrokeWidthAttributeName
 */
- (AXAttributedStringChain *(^)(CGFloat width))strokeWidth;

/**
 NSAttachmentAttributeName
 */
- (AXAttributedStringChain *(^)(NSTextAttachment *textAttachment))attachment;

/**
 NSLinkAttributeName, url must be kind of [NSURL] or [NSString]
 */
- (AXAttributedStringChain *(^)(NSURL *url))linkUrl;

/**
 NSLinkAttributeName
 */
- (AXAttributedStringChain *(^)(NSString *string))linkString;

/**
 NSLigatureAttributeName, default ONE
 */
- (AXAttributedStringChain *(^)(NSInteger integer))ligature;

/**
 NSKernAttributeName, default 0, kerning is disabled.
 */
- (AXAttributedStringChain *(^)(CGFloat floating))kern;

/**
 NSShadowAttributeName
 */
- (AXAttributedStringChain *(^)(NSShadow *sd))shadow;

/**
 NSTextEffectAttributeName
 */
- (AXAttributedStringChain *(^)(NSString *text))textEffect;

/**
 NSObliquenessAttributeName, default 0
 */
- (AXAttributedStringChain *(^)(CGFloat floating))obliqueness;

/**
 NSExpansionAttributeName
 */
- (AXAttributedStringChain *(^)(CGFloat floating))expansion;

/**
 NSWritingDirectionAttributeName
 */
- (AXAttributedStringChain *(^)(NSArray<NSNumber *> *options))writingDirection;

/**
 * NSVerticalGlyphFormAttributeName, 0 means horizontal text. 1 indicates vertical text.
 * Currently on iOS, it's always horizontal.  The behavior for any other value is undefined.
 */
- (AXAttributedStringChain *(^)(NSInteger integer))verticalGlyphForm;

/**
 set up sub attribute string, pass a text
 */
- (void)setUpSubAttributedStringWithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
