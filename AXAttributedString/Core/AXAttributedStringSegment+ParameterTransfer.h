//
//  AXAttributedStringSegment+ParameterTransfer.h
//  AXAttributedString
//
//  Created by xiaochenghua on 2020/9/28.
//  Email: arnoldxiao@163.com
//  Copyright © 2020 xiaochenghua. All rights reserved.
//

#import "AXAttributedStringSegment.h"

NS_ASSUME_NONNULL_BEGIN

/**
 参数值类型
 */
typedef NS_ENUM(NSUInteger, AXAttributedStringSegmentParameterValueType) {
    
    /**
     CGFloat, double
     */
    AXAttributedStringSegmentParameterValueTypeDouble,
    
    /**
     float
     */
    AXAttributedStringSegmentParameterValueTypeFloat,
    
    /**
     Integer, Enum
     */
    AXAttributedStringSegmentParameterValueTypeInteger,
    
    /**
     CGRect
     */
    AXAttributedStringSegmentParameterValueTypeRect,
    
    /**
     Object
     */
    AXAttributedStringSegmentParameterValueTypeObject
};

@interface AXAttributedStringSegment (ParameterTransfer)

/// 重置NSParagraphStyle、NSTextAttachment等对象，生成AXAttributedStringSegment对象
/// @param key NSAttributedStringKey
/// @param obj key对应的obj
/// @param sel 给obj相关的属性赋值setter选择器
/// @param value 给obj相关的属性赋值的参数值
/// @param type 参数值类型
- (AXAttributedStringSegment *)addAttributeValueWithKey:(NSAttributedStringKey)key object:(id)obj selector:(SEL)sel value:(id)value type:(AXAttributedStringSegmentParameterValueType)type;

@end

NS_ASSUME_NONNULL_END
