//
//  AXAttributedStringSegment.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2020/9/25.
//  Email: arnoldxiao@163.com
//  Copyright © 2020 xiaochenghua. All rights reserved.
//

#import "AXAttributedStringSegment.h"

@interface AXAttributedStringSegment ()

@property (nonatomic, strong) NSMutableAttributedString *mutableAttributedString;

@property (nonatomic, strong) NSMutableArray<NSAttributedStringKey> *cachedKeys;

@property (nonatomic, copy) NSArray<AXAttributedStringSegment *> *children;

@property (nonatomic, strong) AXAttributedStringSegment *father;

@end

@implementation AXAttributedStringSegment

/// 生成AXAttributedStringSegment对象
/// @param type 类型
/// @param text 文本
/// @param children 子节点
+ (instancetype)segmentWithType:(AXAttributedStringSegmentType)type text:(NSString *)text children:(NSArray<AXAttributedStringSegment *> *)children {
    AXAttributedStringSegment *segment = [[AXAttributedStringSegment alloc] init];
    
    [children enumerateObjectsUsingBlock:^(AXAttributedStringSegment * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.father = segment;
    }];
    
    NSMutableAttributedString *mas = nil;
    
    switch (type) {
        case AXAttributedStringSegmentTypeNormal: {
            mas = [[NSMutableAttributedString alloc] initWithString:text];
            break;
        }
        case AXAttributedStringSegmentTypeHTML: {
            mas = [[NSMutableAttributedString alloc] initWithData:[text dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:NULL error:nil];
            break;
        }
        case AXAttributedStringSegmentTypeContainer: {
            mas = [[NSMutableAttributedString alloc] init];
            [children enumerateObjectsUsingBlock:^(AXAttributedStringSegment * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [mas appendAttributedString:obj.attributedString];
            }];
            break;
        }
    }
    
    segment.children = [children copy];
    segment.mutableAttributedString = mas;
    
    return segment;
}

+ (instancetype)segmentWithType:(AXAttributedStringSegmentType)type text:(NSString *)text {
    return [self segmentWithType:type text:text children:nil];
}

+ (instancetype)segmentWithType:(AXAttributedStringSegmentType)type children:(NSArray<AXAttributedStringSegment *> *)children {
    return [self segmentWithType:type text:nil children:children];
}

#pragma mark - attribute

- (AXAttributedStringSegmentColorBlock)textColor {
    return ^AXAttributedStringSegment *(UIColor *color) {
        return [self addAttribute:NSForegroundColorAttributeName object:color];
    };
}

- (AXAttributedStringSegmentColorBlock)backgroundColor {
    return ^AXAttributedStringSegment *(UIColor *color) {
        return [self addAttribute:NSBackgroundColorAttributeName object:color];
    };
}

- (AXAttributedStringSegmentFontBlock)font {
    return ^AXAttributedStringSegment *(UIFont *font) {
        return [self addAttribute:NSFontAttributeName object:font];
    };
}

- (AXAttributedStringSegmentFloatBlock)systemFontSize {
    return ^AXAttributedStringSegment *(CGFloat fontSize) {
        return [self addAttribute:NSFontAttributeName object:[UIFont systemFontOfSize:fontSize]];
    };
}

- (AXAttributedStringSegmentUnderlineStyleBlock)underlineStyle {
    return ^AXAttributedStringSegment *(NSUnderlineStyle style) {
        return [self addAttribute:NSUnderlineStyleAttributeName object:@(style)];
    };
}

- (AXAttributedStringSegmentColorBlock)underlineColor {
    return ^AXAttributedStringSegment *(UIColor *color) {
        return [self addAttribute:NSUnderlineColorAttributeName object:color];
    };
}

- (AXAttributedStringSegmentFloatBlock)baselineOffset {
    return ^AXAttributedStringSegment *(CGFloat offset) {
        return [self addAttribute:NSBaselineOffsetAttributeName object:@(offset)];
    };
}

- (AXAttributedStringSegmentUnderlineStyleBlock)strikethroughStyle {
    return ^AXAttributedStringSegment *(NSUnderlineStyle style) {
        return [self addAttribute:NSStrikethroughStyleAttributeName object:@(style)];
    };
}

- (AXAttributedStringSegmentColorBlock)strikethroughColor {
    return ^AXAttributedStringSegment *(UIColor *color) {
        return [self addAttribute:NSStrikethroughColorAttributeName object:color];
    };
}

- (AXAttributedStringSegmentParagraphStyleBlock)paragraphStyle {
    return ^AXAttributedStringSegment *(NSParagraphStyle *style) {
        return [self addAttribute:NSParagraphStyleAttributeName object:style];
    };
}

- (AXAttributedStringSegmentColorBlock)strokeColor {
    return ^AXAttributedStringSegment *(UIColor *color) {
        return [self addAttribute:NSStrokeColorAttributeName object:color];
    };
}

- (AXAttributedStringSegmentFloatBlock)strokeWidth {
    return ^AXAttributedStringSegment *(CGFloat width) {
        return [self addAttribute:NSStrokeWidthAttributeName object:@(width)];
    };
}

- (AXAttributedStringSegmentTextAttachmentBlock)attachment {
    return ^AXAttributedStringSegment *(NSTextAttachment *attachment) {
        return [self addAttribute:NSAttachmentAttributeName object:attachment];
    };
}

- (AXAttributedStringSegmentURLBlock)linkUrl {
    return ^AXAttributedStringSegment *(NSURL *url) {
        return [self addAttribute:NSLinkAttributeName object:url];
    };
}

- (AXAttributedStringSegmentStringBlock)linkString {
    return ^AXAttributedStringSegment *(NSString *string) {
        return [self addAttribute:NSLinkAttributeName object:[NSURL URLWithString:string]];
    };
}

- (AXAttributedStringSegmentIntegerBlock)ligature {
    return ^AXAttributedStringSegment *(NSInteger ligature) {
        return [self addAttribute:NSLigatureAttributeName object:@(ligature)];
    };
}

- (AXAttributedStringSegmentFloatBlock)kern {
    return ^AXAttributedStringSegment *(CGFloat kern) {
        return [self addAttribute:NSKernAttributeName object:@(kern)];
    };
}

- (AXAttributedStringSegmentShadowBlock)shadow {
    return ^AXAttributedStringSegment *(NSShadow *shadow) {
        return [self addAttribute:NSShadowAttributeName object:shadow];
    };
}

- (AXAttributedStringSegmentStringBlock)effect {
    return ^AXAttributedStringSegment *(NSString *effect) {
        // 目前只支持NSTextEffectLetterpressStyle
        if (effect && ![effect isEqualToString:NSTextEffectLetterpressStyle]) {
            effect = NSTextEffectLetterpressStyle;
        }
        return [self addAttribute:NSTextEffectAttributeName object:effect];
    };
}

- (AXAttributedStringSegmentFloatBlock)obliqueness {
    return ^AXAttributedStringSegment *(CGFloat obliqueness) {
        return [self addAttribute:NSObliquenessAttributeName object:@(obliqueness)];
    };
}

- (AXAttributedStringSegmentFloatBlock)expansion {
    return ^AXAttributedStringSegment *(CGFloat expansion) {
        return [self addAttribute:NSExpansionAttributeName object:@(expansion)];
    };
}

- (AXAttributedStringSegmentOptionsBlock)writingDirection {
    return ^AXAttributedStringSegment *(NSArray<NSNumber *> *options) {
        return [self addAttribute:NSWritingDirectionAttributeName object:options];
    };
}

- (AXAttributedStringSegmentIntegerBlock)verticalGlyphForm {
    return ^AXAttributedStringSegment *(NSInteger glyphForm) {
        return [self addAttribute:NSVerticalGlyphFormAttributeName object:@(glyphForm)];
    };
}

#pragma mark - private metheds

/// 给当前对象添加属性
/// @param key NSAttributedStringKey
/// @param value value
- (AXAttributedStringSegment *)addAttribute:(NSAttributedStringKey)key object:(id)value {
    NSAssert(![self.cachedKeys containsObject:key], @"Duplicate attribute key: %@.", key);
    [self.cachedKeys addObject:key];
    [self.mutableAttributedString addAttribute:key value:value range:NSMakeRange(0, self.attributedString.length)];
    return self;
}

#pragma mark - getter

- (NSAttributedString *)attributedString {
    return [self.mutableAttributedString copy];
}

- (NSMutableArray<NSAttributedStringKey> *)cachedKeys {
    if (!_cachedKeys) {
        _cachedKeys = [NSMutableArray array];
    }
    return _cachedKeys;
}

@end
