//
//  AXAttributedStringSegment+TextAttachment.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2020/9/28.
//  Email: arnoldxiao@163.com
//  Copyright © 2020 xiaochenghua. All rights reserved.
//

#import "AXAttributedStringSegment+TextAttachment.h"
#import "AXAttributedStringSegment+ParameterTransfer.h"
#import <objc/runtime.h>

@interface AXAttributedStringSegment ()

@property (nonatomic, strong) NSTextAttachment *textAttachment;

@end

@implementation AXAttributedStringSegment (TextAttachment)

- (AXAttributedStringSegmentImageBlock)image {
    return ^AXAttributedStringSegment *(UIImage *image) {
        return [self addTextAttachmentAttributeSelector:@selector(setImage:) value:image type:AXAttributedStringSegmentParameterValueTypeObject];
    };
}

- (AXAttributedStringSegmentStringBlock)imageName {
    return ^AXAttributedStringSegment *(NSString *string) {
        return [self addTextAttachmentAttributeSelector:@selector(setImage:) value:[UIImage imageNamed:string] type:AXAttributedStringSegmentParameterValueTypeObject];
    };
}

- (AXAttributedStringSegmentRectBlock)imageBounds {
    return ^AXAttributedStringSegment *(CGRect bounds) {
        return [self addTextAttachmentAttributeSelector:@selector(setBounds:) value:[NSValue valueWithCGRect:bounds] type:AXAttributedStringSegmentParameterValueTypeRect];
    };
}

- (AXAttributedStringSegment *)addTextAttachmentAttributeSelector:(SEL)sel value:(id)value type:(AXAttributedStringSegmentParameterValueType)type {
    return [self addAttributeValueWithKey:NSAttachmentAttributeName object:self.textAttachment selector:sel value:value type:type];
}

- (void)setTextAttachment:(NSTextAttachment *)textAttachment {
    objc_setAssociatedObject(self, @selector(textAttachment), textAttachment, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTextAttachment *)textAttachment {
    if (!objc_getAssociatedObject(self, @selector(textAttachment))) {
        self.textAttachment = [[NSTextAttachment alloc] init];
    }
    return objc_getAssociatedObject(self, @selector(textAttachment));
}

@end
