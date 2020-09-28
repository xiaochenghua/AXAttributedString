//
//  AXAttributedStringSegment+TextAttachment.h
//  AXAttributedString
//
//  Created by xiaochenghua on 2020/9/28.
//  Email: arnoldxiao@163.com
//  Copyright © 2020 xiaochenghua. All rights reserved.
//

#import "AXAttributedStringSegment.h"

NS_ASSUME_NONNULL_BEGIN

typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentImageBlock  )(UIImage *image);
typedef AXAttributedStringSegment * _Nonnull (^AXAttributedStringSegmentRectBlock   )(CGRect rect);

@interface AXAttributedStringSegment (TextAttachment)

/**
 图像
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentImageBlock image;

/**
 图像名称
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentStringBlock imageName;

/**
 图像位置
 */
@property (nonatomic, copy, readonly) AXAttributedStringSegmentRectBlock imageBounds;

@end

NS_ASSUME_NONNULL_END
