//
//  AXAttributedStringChain.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/6.
//  Email: arnoldxiao@163.com
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import "AXAttributedStringChain.h"

@interface AXAttributedStringChain () {
    NSUInteger _currentTextIndex;
}

/**
 Appended text each time.
 */
@property (nonatomic, copy) NSString *text;

/**
 List of sub attribute strings.
 */
@property (nonatomic, strong) NSMutableArray<NSMutableAttributedString *> *mutableAttributedStrings;

/**
 text + attributes
 */
@property (nonatomic, strong) NSMutableAttributedString *segmentAttributedString;

/**
 缓存属性设值
 */
@property (nonatomic, strong) NSMutableDictionary *attributedCacheDictionary;

@end

@implementation AXAttributedStringChain

#pragma mark - add attributes

- (AXAttributedStringChain * _Nonnull (^)(UIColor * _Nonnull))foregroundColor {
    return ^id(UIColor *color) {
        return [self addAttribute:NSForegroundColorAttributeName value:color];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(UIColor * _Nonnull))backgroundColor {
    return ^id(UIColor *color) {
        return [self addAttribute:NSBackgroundColorAttributeName value:color];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(UIFont * _Nonnull))font {
    return ^id(UIFont *font) {
        return [self addAttribute:NSFontAttributeName value:font];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(CGFloat))systemFontSize {
    return ^id(CGFloat floating) {
        return [self addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:floating]];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSUnderlineStyle))underlineStyle {
    return ^id(NSUnderlineStyle style) {
        return [self addAttribute:NSUnderlineStyleAttributeName value:@(style)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(UIColor * _Nonnull))underlineColor {
    return ^id(UIColor *color) {
        return [self addAttribute:NSUnderlineColorAttributeName value:color];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(CGFloat))baselineOffset {
    return ^id(CGFloat offset) {
        return [self addAttribute:NSBaselineOffsetAttributeName value:@(offset)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSUnderlineStyle))strikethroughStyle {
    return ^id(NSUnderlineStyle style) {
        return [self addAttribute:NSStrikethroughStyleAttributeName value:@(style)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(UIColor * _Nonnull))strikethroughColor {
    return ^id(UIColor *color) {
        return [self addAttribute:NSStrikethroughColorAttributeName value:color];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSParagraphStyle * _Nonnull))paragraphStyle {
    return ^id(NSParagraphStyle *style) {
        return [self addAttribute:NSParagraphStyleAttributeName value:style];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(UIColor * _Nonnull))strokeColor {
    return ^id(UIColor *color) {
        return [self addAttribute:NSStrokeColorAttributeName value:color];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(CGFloat))strokeWidth {
    return ^id(CGFloat width) {
        return [self addAttribute:NSStrokeWidthAttributeName value:@(width)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSTextAttachment * _Nonnull))attachment {
    return ^id(NSTextAttachment *textAttachment) {
        return [self addAttribute:NSAttachmentAttributeName value:textAttachment];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSURL * _Nonnull))linkUrl {
    return ^id(NSURL *url) {
        return [self addAttribute:NSLinkAttributeName value:url];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSString * _Nonnull))linkString {
    return ^id(NSString *string) {
        return [self addAttribute:NSLinkAttributeName value:string];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSInteger))ligature {
    return ^id(NSInteger integer) {
        NSAssert(integer == 1 || integer == 0, @"Ligature value must be a number ONE(default) or ZERO on iOS.");
        return [self addAttribute:NSLigatureAttributeName value:@(integer)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(CGFloat))kern {
    return ^id(CGFloat floating) {
        return [self addAttribute:NSKernAttributeName value:@(floating)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSShadow * _Nonnull))shadow {
    return ^id(NSShadow *sd) {
        return [self addAttribute:NSShadowAttributeName value:sd];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSString * _Nonnull))textEffect {
    return ^id(NSString *text) {
        //  Only Supported [NSTextEffectLetterpressStyle] Now.
        if (![text isEqualToString:NSTextEffectLetterpressStyle]) {
            text = NSTextEffectLetterpressStyle;
        }
        return [self addAttribute:NSTextEffectAttributeName value:text];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(CGFloat))obliqueness {
    return ^id(CGFloat floating) {
        return [self addAttribute:NSObliquenessAttributeName value:@(floating)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(CGFloat))expansion {
    return ^id(CGFloat floating) {
        return [self addAttribute:NSExpansionAttributeName value:@(floating)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSArray<NSNumber *> * _Nonnull))writingDirection {
    return ^id(NSArray<NSNumber *> *options) {
        return [self addAttribute:NSWritingDirectionAttributeName value:options];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSInteger))verticalGlyphForm {
    return ^id(NSInteger integer) {
        return [self addAttribute:NSVerticalGlyphFormAttributeName value:@(integer)];
    };
}

#pragma mark - private methods

/**
 缓存key，由索引_文本_属性名组成，确保key不重复，如果重复，说明属性值被重置，断言
 添加缓存
 设置属性值
 */
- (AXAttributedStringChain *)addAttribute:(NSAttributedStringKey)key value:(id)value {
    NSString *cacheKey = [NSString stringWithFormat:@"%tu_%@_%@", _currentTextIndex, self.text, key];
    NSAssert(![self.attributedCacheDictionary objectForKey:cacheKey], @"Repeated setting attribute named [%@].", key);
    [self.attributedCacheDictionary setObject:value forKey:cacheKey];
    [self.segmentAttributedString addAttribute:key value:value range:NSMakeRange(0, self.text.length)];
    return self;
}

- (void)setUpSegmentAttributedStringWithText:(NSString *)text {
    [self.attributedCacheDictionary removeAllObjects];
    self.text = text;
    self.segmentAttributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    [self.mutableAttributedStrings addObject:self.segmentAttributedString];
    _currentTextIndex = self.mutableAttributedStrings.count - 1;
}

#pragma mark - getter

- (NSMutableArray<NSMutableAttributedString *> *)mutableAttributedStrings {
    if (!_mutableAttributedStrings) {
        _mutableAttributedStrings = [NSMutableArray array];
    }
    return _mutableAttributedStrings;
}

- (NSArray<NSAttributedString *> *)attributedStrings {
    return self.mutableAttributedStrings.copy;
}

- (NSMutableDictionary *)attributedCacheDictionary {
    if (!_attributedCacheDictionary) {
        _attributedCacheDictionary = [[NSMutableDictionary alloc] init];
    }
    return _attributedCacheDictionary;
}

@end
