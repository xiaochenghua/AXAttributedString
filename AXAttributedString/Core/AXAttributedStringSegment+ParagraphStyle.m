//
//  AXAttributedStringSegment+ParagraphStyle.m
//  AXAttributedString
//
//  Created by chenghua.xiao on 2020/9/28.
//

#import "AXAttributedStringSegment+ParagraphStyle.h"
#import <objc/runtime.h>

/**
 ParagraphStyle值类型
 */
typedef NS_ENUM(NSUInteger, AXAttributedStringParagraphValueType) {
    
    /**
     CGFloat, double
     */
    AXAttributedStringParagraphValueTypeDouble,
    
    /**
     float
     */
    AXAttributedStringParagraphValueTypeFloat,
    
    /**
     Integer, Enum
     */
    AXAttributedStringParagraphValueTypeInteger,
    
    /**
     Object
     */
    AXAttributedStringParagraphValueTypeObject
};

@interface AXAttributedStringSegment ()

/**
 保存绘图风格
 */
@property (nonatomic, strong) NSMutableParagraphStyle *mutableParagraphStyle;

@end

@implementation AXAttributedStringSegment (ParagraphStyle)

- (AXAttributedStringSegmentDoubleBlock)lineSpacing {
    return ^AXAttributedStringSegment *(CGFloat spacing) {
        return [self addParagraphStyleAttributeSelector:@selector(setLineSpacing:) object:@(spacing) type:AXAttributedStringParagraphValueTypeDouble];
    };
}

- (AXAttributedStringSegmentDoubleBlock)paragraphSpacing {
    return ^AXAttributedStringSegment *(CGFloat spacing) {
        return [self addParagraphStyleAttributeSelector:@selector(setParagraphSpacing:) object:@(spacing) type:AXAttributedStringParagraphValueTypeDouble];
    };
}

- (AXAttributedStringSegmentAlignmentBlock)alignment {
    return ^AXAttributedStringSegment *(NSTextAlignment alignment) {
        return [self addParagraphStyleAttributeSelector:@selector(setAlignment:) object:@(alignment) type:AXAttributedStringParagraphValueTypeInteger];
    };
}

- (AXAttributedStringSegmentDoubleBlock)paragraphSpacingBefore {
    return ^AXAttributedStringSegment *(CGFloat spacing) {
        return [self addParagraphStyleAttributeSelector:@selector(setParagraphSpacingBefore:) object:@(spacing) type:AXAttributedStringParagraphValueTypeDouble];
    };
}

- (AXAttributedStringSegmentDoubleBlock)firstLineHeadIndent {
    return ^AXAttributedStringSegment *(CGFloat indent) {
        return [self addParagraphStyleAttributeSelector:@selector(setFirstLineHeadIndent:) object:@(indent) type:AXAttributedStringParagraphValueTypeDouble];
    };
}

- (AXAttributedStringSegmentDoubleBlock)headIndent {
    return ^AXAttributedStringSegment *(CGFloat indent) {
        return [self addParagraphStyleAttributeSelector:@selector(setHeadIndent:) object:@(indent) type:AXAttributedStringParagraphValueTypeDouble];
    };
}

- (AXAttributedStringSegmentDoubleBlock)tailIndent {
    return ^AXAttributedStringSegment *(CGFloat indent) {
        return [self addParagraphStyleAttributeSelector:@selector(setTailIndent:) object:@(indent) type:AXAttributedStringParagraphValueTypeDouble];
    };
}

- (AXAttributedStringSegmentLineBreakBlock)lineBreakMode {
    return ^AXAttributedStringSegment *(NSLineBreakMode lineBreakMode) {
        return [self addParagraphStyleAttributeSelector:@selector(setLineBreakMode:) object:@(lineBreakMode) type:AXAttributedStringParagraphValueTypeInteger];
    };
}

- (AXAttributedStringSegmentDoubleBlock)minimumLineHeight {
    return ^AXAttributedStringSegment *(CGFloat height) {
        return [self addParagraphStyleAttributeSelector:@selector(setMinimumLineHeight:) object:@(height) type:AXAttributedStringParagraphValueTypeDouble];
    };
}

- (AXAttributedStringSegmentDoubleBlock)maximumLineHeight {
    return ^AXAttributedStringSegment *(CGFloat height) {
        return [self addParagraphStyleAttributeSelector:@selector(setMaximumLineHeight:) object:@(height) type:AXAttributedStringParagraphValueTypeDouble];
    };
}

- (AXAttributedStringSegmentWritingDirectionBlock)baseWritingDirection {
    return ^AXAttributedStringSegment *(NSWritingDirection baseWritingDirection) {
        return [self addParagraphStyleAttributeSelector:@selector(setBaseWritingDirection:) object:@(baseWritingDirection) type:AXAttributedStringParagraphValueTypeInteger];
    };
}

- (AXAttributedStringSegmentDoubleBlock)lineHeightMultiple {
    return ^AXAttributedStringSegment *(CGFloat multiple) {
        return [self addParagraphStyleAttributeSelector:@selector(setLineHeightMultiple:) object:@(multiple) type:AXAttributedStringParagraphValueTypeDouble];
    };
}

- (AXAttributedStringSegmentFloatBlock)hyphenationFactor {
    return ^AXAttributedStringSegment *(float hyphenationFactor) {
        return [self addParagraphStyleAttributeSelector:@selector(setHyphenationFactor:) object:@(hyphenationFactor) type:AXAttributedStringParagraphValueTypeFloat];
    };
}

- (AXAttributedStringSegmentTextTabsBlock)tabStops {
    return ^AXAttributedStringSegment *(NSArray<NSTextTab *> *tabStops) {
        return [self addParagraphStyleAttributeSelector:@selector(setTabStops:) object:tabStops type:AXAttributedStringParagraphValueTypeObject];
    };
}

- (AXAttributedStringSegmentDoubleBlock)defaultTabInterval {
    return ^AXAttributedStringSegment *(CGFloat tabInterval) {
        return [self addParagraphStyleAttributeSelector:@selector(setDefaultTabInterval:) object:@(tabInterval) type:AXAttributedStringParagraphValueTypeDouble];
    };
}

- (AXAttributedStringSegmentBoolBlock)allowsDefaultTighteningForTruncation {
    return ^AXAttributedStringSegment *(BOOL boolean) {
        return [self addParagraphStyleAttributeSelector:@selector(setAllowsDefaultTighteningForTruncation:) object:@(boolean) type:AXAttributedStringParagraphValueTypeInteger];
    };
}

- (AXAttributedStringSegment *)addParagraphStyleAttributeSelector:(SEL)sel object:(id)obj type:(AXAttributedStringParagraphValueType)type {
    void *argument = nil;
    
    BOOL isNumber = [obj isKindOfClass:[NSNumber class]];
    BOOL isString = [obj isKindOfClass:[NSString class]];
    
    switch (type) {
        case AXAttributedStringParagraphValueTypeDouble: {
            CGFloat value = isNumber ? ((NSNumber *)obj).doubleValue : isString ? ((NSString *)obj).doubleValue : 0.0;
            argument = &value;
            break;
        }
        case AXAttributedStringParagraphValueTypeFloat: {
            float value = isNumber ? ((NSNumber *)obj).floatValue : isString ? ((NSString *)obj).floatValue : 0.0f;
            argument = &value;
            break;
        }
        case AXAttributedStringParagraphValueTypeInteger: {
            NSInteger value = isNumber ? ((NSNumber *)obj).integerValue : isString ? ((NSString *)obj).integerValue : 0;
            argument = &value;
            break;
        }
        case AXAttributedStringParagraphValueTypeObject: {
            argument = &obj;
            break;
        }
    }
    
    id attribute = [self.attributedString attribute:NSParagraphStyleAttributeName atIndex:0 effectiveRange:nil];
    if (attribute) {
        return [self resetParagraphStyleWithObject:(NSMutableParagraphStyle *)attribute selector:sel value:argument];
    }
    return [self resetParagraphStyleWithObject:self.mutableParagraphStyle selector:sel value:argument];
}

- (AXAttributedStringSegment *)resetParagraphStyleWithObject:(NSParagraphStyle *)style selector:(SEL)sel value:(void *)value {
    [self invokeTarget:style selector:sel argument:value];
    return [self addAttribute:NSParagraphStyleAttributeName object:style];
}

- (void)invokeTarget:(id)target selector:(SEL)sel argument:(void *)argument {
    if (![target respondsToSelector:sel]) return;
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[target methodSignatureForSelector:sel]];
    [invocation setTarget:target];
    [invocation setSelector:sel];
    [invocation setArgument:argument atIndex:2];
    [invocation invoke];
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
