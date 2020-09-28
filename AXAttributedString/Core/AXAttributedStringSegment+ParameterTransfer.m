//
//  AXAttributedStringSegment+ParameterTransfer.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2020/9/28.
//  Email: arnoldxiao@163.com
//  Copyright © 2020 xiaochenghua. All rights reserved.
//

#import "AXAttributedStringSegment+ParameterTransfer.h"

@implementation AXAttributedStringSegment (ParameterTransfer)

- (AXAttributedStringSegment *)addAttributeValueWithKey:(NSAttributedStringKey)key object:(id)obj selector:(SEL)sel value:(id)value type:(AXAttributedStringSegmentParameterValueType)type {
    void *argument = nil;
    
    BOOL isNumber = [value isKindOfClass:[NSNumber class]];
    BOOL isString = [value isKindOfClass:[NSString class]];
    
    switch (type) {
        case AXAttributedStringSegmentParameterValueTypeDouble: {
            CGFloat val = isNumber ? ((NSNumber *)value).doubleValue : isString ? ((NSString *)value).doubleValue : 0.0;
            argument = &val;
            break;
        }
        case AXAttributedStringSegmentParameterValueTypeFloat: {
            float val = isNumber ? ((NSNumber *)value).floatValue : isString ? ((NSString *)value).floatValue : 0.0f;
            argument = &val;
            break;
        }
        case AXAttributedStringSegmentParameterValueTypeInteger: {
            NSInteger val = isNumber ? ((NSNumber *)value).integerValue : isString ? ((NSString *)value).integerValue : 0;
            argument = &val;
            break;
        }
        case AXAttributedStringSegmentParameterValueTypeRect: {
            CGRect rect = [value isKindOfClass:[NSValue class]] ? ((NSValue *)value).CGRectValue : CGRectZero;
            argument = &rect;
            break;
        }
        case AXAttributedStringSegmentParameterValueTypeObject: {
            argument = &value;
            break;
        }
    }
    
    id attribute = [self.attributedString attribute:key atIndex:0 effectiveRange:nil];
    id object = attribute ?: obj;
    return [self resetValueWithKey:key object:object selector:sel value:argument];
}

- (AXAttributedStringSegment *)resetValueWithKey:(NSAttributedStringKey)key object:(id)obj selector:(SEL)sel value:(void *)value {
    [self invokeInvocationWithTarget:obj selector:sel argument:value];
    return [self addAttribute:key object:obj];
}

- (void)invokeInvocationWithTarget:(id)target selector:(SEL)sel argument:(void *)argument {
    if (![target respondsToSelector:sel]) return;
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[target methodSignatureForSelector:sel]];
    [invocation setTarget:target];
    [invocation setSelector:sel];
    [invocation setArgument:argument atIndex:2];
    [invocation invoke];
}

@end
