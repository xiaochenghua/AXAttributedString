//
//  AXAttributedStringSegment+ParagraphStyle.h
//  AXAttributedString
//
//  Created by xiaochenghua on 2020/9/28.
//  Email: arnoldxiao@163.com
//  Copyright © 2020 xiaochenghua. All rights reserved.
//

#import "AXAttributedStringSegment.h"

NS_ASSUME_NONNULL_BEGIN

typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentAlignmentBlock          )(NSTextAlignment alignment);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentLineBreakBlock          )(NSLineBreakMode lineBreakMode);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentWritingDirectionBlock   )(NSWritingDirection baseWritingDirection);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentFloatBlock              )(float size);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentTextTabsBlock           )(NSArray<NSTextTab *> *tabStops);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentBoolBlock               )(BOOL boolean);

@interface AXAttributedStringSegment (ParagraphStyle)

/**
 行间距
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock lineSpacing;

/**
 段落间距
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock paragraphSpacing;

/**
 对齐方式
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentAlignmentBlock alignment;

/**
 段顶部空白空间
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock paragraphSpacingBefore;

/**
 首行缩进
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock firstLineHeadIndent;

/**
 头部整体缩进(首行除外)
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock headIndent;

/**
 尾部整体缩进
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock tailIndent;

/**
 折行方式
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentLineBreakBlock lineBreakMode;

/**
 最小行高
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock minimumLineHeight;

/**
 最大行高
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock maximumLineHeight;

/**
 书写方向
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentWritingDirectionBlock baseWritingDirection;

/**
 行间距倍数
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock lineHeightMultiple;

/**
 连字属性，在iOS只支持0和1
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentFloatBlock hyphenationFactor;

/**
 制表符
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentTextTabsBlock tabStops;

/**
 默认Tab宽度
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentDoubleBlock defaultTabInterval;

/**
 收缩字符间距是否允许截断
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentBoolBlock allowsDefaultTighteningForTruncation API_AVAILABLE(ios(9.0));

@end

NS_ASSUME_NONNULL_END
