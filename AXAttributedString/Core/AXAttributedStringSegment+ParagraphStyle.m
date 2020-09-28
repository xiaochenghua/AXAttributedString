//
//  AXAttributedStringSegment+ParagraphStyle.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2020/9/28.
//  Email: arnoldxiao@163.com
//  Copyright © 2020 xiaochenghua. All rights reserved.
//

#import "AXAttributedStringSegment+ParagraphStyle.h"
#import "AXAttributedStringSegment+ParameterTransfer.h"
#import <objc/runtime.h>

@interface AXAttributedStringSegment ()

/**
 保存绘图风格
 */
@property (nonatomic, strong) NSMutableParagraphStyle *mutableParagraphStyle;

@end

@implementation AXAttributedStringSegment (ParagraphStyle)

- (AXAttributedStringSegmentDoubleBlock)lineSpacing {
    return ^AXAttributedStringSegment *(CGFloat spacing) {
        return [self addParagraphStyleAttributeSelector:@selector(setLineSpacing:) value:@(spacing) type:AXAttributedStringSegmentParameterValueTypeDouble];
    };
}

- (AXAttributedStringSegmentDoubleBlock)paragraphSpacing {
    return ^AXAttributedStringSegment *(CGFloat spacing) {
        return [self addParagraphStyleAttributeSelector:@selector(setParagraphSpacing:) value:@(spacing) type:AXAttributedStringSegmentParameterValueTypeDouble];
    };
}

- (AXAttributedStringSegmentAlignmentBlock)alignment {
    return ^AXAttributedStringSegment *(NSTextAlignment alignment) {
        return [self addParagraphStyleAttributeSelector:@selector(setAlignment:) value:@(alignment) type:AXAttributedStringSegmentParameterValueTypeInteger];
    };
}

- (AXAttributedStringSegmentDoubleBlock)paragraphSpacingBefore {
    return ^AXAttributedStringSegment *(CGFloat spacing) {
        return [self addParagraphStyleAttributeSelector:@selector(setParagraphSpacingBefore:) value:@(spacing) type:AXAttributedStringSegmentParameterValueTypeDouble];
    };
}

- (AXAttributedStringSegmentDoubleBlock)firstLineHeadIndent {
    return ^AXAttributedStringSegment *(CGFloat indent) {
        return [self addParagraphStyleAttributeSelector:@selector(setFirstLineHeadIndent:) value:@(indent) type:AXAttributedStringSegmentParameterValueTypeDouble];
    };
}

- (AXAttributedStringSegmentDoubleBlock)headIndent {
    return ^AXAttributedStringSegment *(CGFloat indent) {
        return [self addParagraphStyleAttributeSelector:@selector(setHeadIndent:) value:@(indent) type:AXAttributedStringSegmentParameterValueTypeDouble];
    };
}

- (AXAttributedStringSegmentDoubleBlock)tailIndent {
    return ^AXAttributedStringSegment *(CGFloat indent) {
        return [self addParagraphStyleAttributeSelector:@selector(setTailIndent:) value:@(indent) type:AXAttributedStringSegmentParameterValueTypeDouble];
    };
}

- (AXAttributedStringSegmentLineBreakBlock)lineBreakMode {
    return ^AXAttributedStringSegment *(NSLineBreakMode lineBreakMode) {
        return [self addParagraphStyleAttributeSelector:@selector(setLineBreakMode:) value:@(lineBreakMode) type:AXAttributedStringSegmentParameterValueTypeInteger];
    };
}

- (AXAttributedStringSegmentDoubleBlock)minimumLineHeight {
    return ^AXAttributedStringSegment *(CGFloat height) {
        return [self addParagraphStyleAttributeSelector:@selector(setMinimumLineHeight:) value:@(height) type:AXAttributedStringSegmentParameterValueTypeDouble];
    };
}

- (AXAttributedStringSegmentDoubleBlock)maximumLineHeight {
    return ^AXAttributedStringSegment *(CGFloat height) {
        return [self addParagraphStyleAttributeSelector:@selector(setMaximumLineHeight:) value:@(height) type:AXAttributedStringSegmentParameterValueTypeDouble];
    };
}

- (AXAttributedStringSegmentWritingDirectionBlock)baseWritingDirection {
    return ^AXAttributedStringSegment *(NSWritingDirection baseWritingDirection) {
        return [self addParagraphStyleAttributeSelector:@selector(setBaseWritingDirection:) value:@(baseWritingDirection) type:AXAttributedStringSegmentParameterValueTypeInteger];
    };
}

- (AXAttributedStringSegmentDoubleBlock)lineHeightMultiple {
    return ^AXAttributedStringSegment *(CGFloat multiple) {
        return [self addParagraphStyleAttributeSelector:@selector(setLineHeightMultiple:) value:@(multiple) type:AXAttributedStringSegmentParameterValueTypeDouble];
    };
}

- (AXAttributedStringSegmentFloatBlock)hyphenationFactor {
    return ^AXAttributedStringSegment *(float hyphenationFactor) {
        return [self addParagraphStyleAttributeSelector:@selector(setHyphenationFactor:) value:@(hyphenationFactor) type:AXAttributedStringSegmentParameterValueTypeFloat];
    };
}

- (AXAttributedStringSegmentTextTabsBlock)tabStops {
    return ^AXAttributedStringSegment *(NSArray<NSTextTab *> *tabStops) {
        return [self addParagraphStyleAttributeSelector:@selector(setTabStops:) value:tabStops type:AXAttributedStringSegmentParameterValueTypeObject];
    };
}

- (AXAttributedStringSegmentDoubleBlock)defaultTabInterval {
    return ^AXAttributedStringSegment *(CGFloat tabInterval) {
        return [self addParagraphStyleAttributeSelector:@selector(setDefaultTabInterval:) value:@(tabInterval) type:AXAttributedStringSegmentParameterValueTypeDouble];
    };
}

- (AXAttributedStringSegmentBoolBlock)allowsDefaultTighteningForTruncation {
    return ^AXAttributedStringSegment *(BOOL boolean) {
        return [self addParagraphStyleAttributeSelector:@selector(setAllowsDefaultTighteningForTruncation:) value:@(boolean) type:AXAttributedStringSegmentParameterValueTypeInteger];
    };
}

- (AXAttributedStringSegment *)addParagraphStyleAttributeSelector:(SEL)sel value:(id)value type:(AXAttributedStringSegmentParameterValueType)type {
    return [self addAttributeValueWithKey:NSParagraphStyleAttributeName object:self.mutableParagraphStyle selector:sel value:value type:type];
}

- (void)setMutableParagraphStyle:(NSMutableParagraphStyle *)mutableParagraphStyle {
    objc_setAssociatedObject(self, @selector(mutableParagraphStyle), mutableParagraphStyle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableParagraphStyle *)mutableParagraphStyle {
    if (!objc_getAssociatedObject(self, @selector(mutableParagraphStyle))) {
        self.mutableParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    }
    return objc_getAssociatedObject(self, @selector(mutableParagraphStyle));
}

@end
