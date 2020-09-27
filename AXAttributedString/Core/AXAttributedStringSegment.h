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
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentFloatBlock          )(CGFloat size);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentStringBlock         )(NSString *string);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentURLBlock            )(NSURL *url);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentUnderlineStyleBlock )(NSUnderlineStyle style);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentParagraphStyleBlock )(NSParagraphStyle *style);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentTextAttachmentBlock )(NSTextAttachment *attachment);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentShadowBlock         )(NSShadow *shadow);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentOptionsBlock        )(NSArray<NSNumber *> *options);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentChildrenBlock       )(NSArray<AXAttributedStringSegment *> *children);

@interface AXAttributedStringSegment : NSObject

@property (nonatomic, copy, readonly) AXAttributedStringSegmentColorBlock           textColor;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentColorBlock           backgroundColor;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentFontBlock            font;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentFloatBlock           systemFontSize;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentUnderlineStyleBlock  underlineStyle;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentColorBlock           underlineColor;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentFloatBlock           baselineOffset;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentUnderlineStyleBlock  strikethroughStyle;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentColorBlock           strikethroughColor;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentParagraphStyleBlock  paragraphStyle;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentColorBlock           strokeColor;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentFloatBlock           strokeWidth;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentTextAttachmentBlock  attachment;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentURLBlock             linkUrl;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentStringBlock          linkString;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentIntegerBlock         ligature;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentFloatBlock           kern;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentShadowBlock          shadow;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentStringBlock          effect;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentFloatBlock           obliqueness;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentFloatBlock           expansion;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentOptionsBlock         writingDirection;
@property (nonatomic, copy, readonly) AXAttributedStringSegmentIntegerBlock         verticalGlyphForm;

@property (nonatomic, copy, readonly) NSAttributedString *                          attributedString;
@property (nonatomic, copy, readonly) NSArray<AXAttributedStringSegment *> *        children;
@property (nonatomic, strong, readonly) AXAttributedStringSegment *                 father;

+ (instancetype)segmentWithType:(AXAttributedStringSegmentType)type text:(NSString *)text;
+ (instancetype)segmentWithType:(AXAttributedStringSegmentType)type children:(NSArray<AXAttributedStringSegment *> *)children;

@end

NS_ASSUME_NONNULL_END
