//
//  AXAttributedStringSegment.h
//  AXAttributedString
//
//  Created by xiaochenghua on 2020/9/25.
//  Email: arnoldxiao@163.com
//  Copyright © 2020 xiaochenghua. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AXAttributedStringSegment;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, AXAttributedStringSegmentType) {
    
    /**
     常规字符串
     */
    AXAttributedStringSegmentTypeNormal,
    
    /**
     HTML字符串
     */
    AXAttributedStringSegmentTypeHTML,
    
    /**
     容器
     */
    AXAttributedStringSegmentTypeContainer
};

typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentFontBlock           )(UIFont *font);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentColorBlock          )(UIColor *color);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentIntegerBlock        )(NSInteger integer);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentDoubleBlock         )(CGFloat size);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentStringBlock         )(NSString *string);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentURLBlock            )(NSURL *url);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentUnderlineStyleBlock )(NSUnderlineStyle style);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentParagraphStyleBlock )(NSParagraphStyle *style);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentTextAttachmentBlock )(NSTextAttachment *attachment);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentShadowBlock         )(NSShadow *shadow);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentOptionsBlock        )(NSArray<NSNumber *> *options);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentChildrenBlock       )(NSArray<AXAttributedStringSegment *> *children);

@interface AXAttributedStringSegment : NSObject

/**
 文字颜色，NSForegroundColorAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentColorBlock textColor;

/**
 背景色，NSBackgroundColorAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentColorBlock backgroundColor;

/**
 字体，NSFontAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentFontBlock font;

/**
 系统字体大小，NSFontAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock systemFontSize;

/**
 下划线样式，NSUnderlineStyleAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentUnderlineStyleBlock underlineStyle;

/**
 下划线颜色，NSUnderlineColorAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentColorBlock underlineColor;

/**
 基线偏移量，NSBaselineOffsetAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock baselineOffset;

/**
 删除线样式，NSStrikethroughStyleAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentUnderlineStyleBlock strikethroughStyle;

/**
 删除线颜色，NSStrikethroughColorAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentColorBlock strikethroughColor;

/**
 绘图风格，居中、换行、间距等，NSParagraphStyleAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentParagraphStyleBlock paragraphStyle;

/**
 描边颜色，NSStrokeColorAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentColorBlock strokeColor;

/**
 描边宽度，NSStrokeWidthAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock strokeWidth;

/**
 NSTextAttachment附属对象，NSAttachmentAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentTextAttachmentBlock attachment;

/**
 链接URL，NSLinkAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentURLBlock linkUrl;

/**
 链接字符串，NSLinkAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentStringBlock linkString;

/**
 字符连体，NSLigatureAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentIntegerBlock ligature;

/**
 字符间隔，NSKernAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock kern;

/**
 阴影，NSShadowAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentShadowBlock shadow;

/**
 文字效果，目前只支持NSTextEffectLetterpressStyle，NSTextEffectAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentStringBlock effect;

/**
 字体倾斜，NSObliquenessAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock obliqueness;

/**
 字体扁平化，NSExpansionAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock expansion;

/**
 文字书写方向，NSWritingDirectionAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentOptionsBlock writingDirection;

/**
 横竖排版，NSVerticalGlyphFormAttributeName
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentIntegerBlock verticalGlyphForm;

/**
 当前对象的attributedString
 */
@property (nonatomic, copy, readonly) NSAttributedString *attributedString;

/**
 子节点集合
 */
@property (nonatomic, copy, readonly) NSArray<AXAttributedStringSegment *> *children;

/**
 父节点
 */
@property (nonatomic, strong, readonly) AXAttributedStringSegment *father;

/**
 根据type和text生成segment对象
 */
+ (instancetype)segmentWithType:(AXAttributedStringSegmentType)type text:(NSString *)text;

/**
 根据type和children生成segment对象
 */
+ (instancetype)segmentWithType:(AXAttributedStringSegmentType)type children:(NSArray<AXAttributedStringSegment *> *)children;

/**
 给当前对象添加属性
 @param key NSAttributedStringKey
 @param value value
 */
- (AXAttributedStringSegment *)addAttribute:(NSAttributedStringKey)key object:(id)value;

@end

NS_ASSUME_NONNULL_END
