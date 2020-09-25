//
//  AXAttributedStringChain.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/6.
//  Email: arnoldxiao@163.com
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import "AXAttributedStringChain.h"

@interface AXAttributedStringChain ()

/**
 segment index.
 */
@property (nonatomic, assign) NSUInteger segmentIndex;

/**
 text + attributes
 */
@property (nonatomic, strong) NSMutableAttributedString *segmentAttributedString;

/**
 List of sub attribute strings.
 */
@property (nonatomic, strong) NSMutableArray<NSMutableAttributedString *> *segmentAttributedStrings;

/**
keys
*/
@property (nonatomic, strong) NSMutableArray *keys;

@end

@implementation AXAttributedStringChain

#pragma mark - add attributes

- (AXAttributedStringChain * _Nonnull (^)(UIColor * _Nonnull))foregroundColor {
    return ^id(UIColor *color) {
        return [self addAttribute:NSForegroundColorAttributeName object:color];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(UIColor * _Nonnull))backgroundColor {
    return ^id(UIColor *color) {
        return [self addAttribute:NSBackgroundColorAttributeName object:color];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(UIFont * _Nonnull))font {
    return ^id(UIFont *font) {
        return [self addAttribute:NSFontAttributeName object:font];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(CGFloat))systemFontSize {
    return ^id(CGFloat fontSize) {
        return [self addAttribute:NSFontAttributeName object:[UIFont systemFontOfSize:fontSize]];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSUnderlineStyle))underlineStyle {
    return ^id(NSUnderlineStyle style) {
        return [self addAttribute:NSUnderlineStyleAttributeName object:@(style)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(UIColor * _Nonnull))underlineColor {
    return ^id(UIColor *color) {
        return [self addAttribute:NSUnderlineColorAttributeName object:color];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(CGFloat))baselineOffset {
    return ^id(CGFloat offset) {
        return [self addAttribute:NSBaselineOffsetAttributeName object:@(offset)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSUnderlineStyle))strikethroughStyle {
    return ^id(NSUnderlineStyle style) {
        return [self addAttribute:NSStrikethroughStyleAttributeName object:@(style)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(UIColor * _Nonnull))strikethroughColor {
    return ^id(UIColor *color) {
        return [self addAttribute:NSStrikethroughColorAttributeName object:color];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSParagraphStyle * _Nonnull))paragraphStyle {
    return ^id(NSParagraphStyle *style) {
        return [self addAttribute:NSParagraphStyleAttributeName object:style];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(UIColor * _Nonnull))strokeColor {
    return ^id(UIColor *color) {
        return [self addAttribute:NSStrokeColorAttributeName object:color];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(CGFloat))strokeWidth {
    return ^id(CGFloat width) {
        return [self addAttribute:NSStrokeWidthAttributeName object:@(width)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSTextAttachment * _Nonnull))attachment {
    return ^id(NSTextAttachment *attachment) {
        return [self addAttribute:NSAttachmentAttributeName object:attachment];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSURL * _Nonnull))linkUrl {
    return ^id(NSURL *url) {
        return [self addAttribute:NSLinkAttributeName object:url];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSString * _Nonnull))linkString {
    return ^id(NSString *string) {
        return [self addAttribute:NSLinkAttributeName object:string];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSInteger))ligature {
    return ^id(NSInteger integer) {
        NSAssert(integer == 1 || integer == 0, @"Ligature value must be a number ONE(default) or ZERO on iOS.");
        return [self addAttribute:NSLigatureAttributeName object:@(integer)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(CGFloat))kern {
    return ^id(CGFloat kern) {
        return [self addAttribute:NSKernAttributeName object:@(kern)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSShadow * _Nonnull))shadow {
    return ^id(NSShadow *shadow) {
        return [self addAttribute:NSShadowAttributeName object:shadow];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSString * _Nonnull))textEffect {
    return ^id(NSString *text) {
        //  Only Supported [NSTextEffectLetterpressStyle] Now.
        if (![text isEqualToString:NSTextEffectLetterpressStyle]) {
            text = NSTextEffectLetterpressStyle;
        }
        return [self addAttribute:NSTextEffectAttributeName object:text];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(CGFloat))obliqueness {
    return ^id(CGFloat obliqueness) {
        return [self addAttribute:NSObliquenessAttributeName object:@(obliqueness)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(CGFloat))expansion {
    return ^id(CGFloat expansion) {
        return [self addAttribute:NSExpansionAttributeName object:@(expansion)];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSArray<NSNumber *> * _Nonnull))writingDirection {
    return ^id(NSArray<NSNumber *> *options) {
        return [self addAttribute:NSWritingDirectionAttributeName object:options];
    };
}

- (AXAttributedStringChain * _Nonnull (^)(NSInteger))verticalGlyphForm {
    return ^id(NSInteger integer) {
        return [self addAttribute:NSVerticalGlyphFormAttributeName object:@(integer)];
    };
}

#pragma mark - private methods

/**
 缓存key，由'索引-属性名'组成，确保key不重复；添加缓存；设置属性值
 */
- (AXAttributedStringChain *)addAttribute:(NSAttributedStringKey)key object:(id)obj {
    NSString *cacheKey = [NSString stringWithFormat:@"%tu-%@", self.segmentIndex, key];
    NSAssert(![self.keys containsObject:cacheKey], @"Duplicate setting attribute named - [%@].", key);
    [self.keys addObject:cacheKey];
    [self.segmentAttributedString addAttribute:key value:obj range:NSMakeRange(0, self.segmentAttributedString.length)];
    return self;
}

- (AXAttributedStringChain *)setUpSegmentAttributedStringWithText:(NSString *)text type:(AXAttributedStringTextType)type {
    NSMutableAttributedString *mas = nil;
    switch (type) {
        case AXAttributedStringTextTypeNormal: {
            mas = [[NSMutableAttributedString alloc] initWithString:text];
            break;
        }
        
        case AXAttributedStringTextTypeHTML: {
            mas = [[NSMutableAttributedString alloc] initWithData:[text dataUsingEncoding:NSUnicodeStringEncoding]
                                                          options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType}
                                               documentAttributes:NULL
                                                            error:nil];
            break;
        }
    }
    
    self.segmentAttributedString = mas;
    [self.segmentAttributedStrings addObject:mas];
    self.segmentIndex = self.segmentAttributedStrings.count - 1;
    return self;
}

#pragma mark - getter

- (NSMutableArray<NSMutableAttributedString *> *)segmentAttributedStrings {
    if (!_segmentAttributedStrings) {
        _segmentAttributedStrings = [NSMutableArray array];
    }
    return _segmentAttributedStrings;
}

- (NSArray<NSAttributedString *> *)attributedStrings {
    return self.segmentAttributedStrings.copy;
}

- (NSMutableArray *)keys {
    if (!_keys) {
        _keys = [NSMutableArray array];
    }
    return _keys;
}

@end
