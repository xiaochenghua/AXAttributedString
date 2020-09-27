//
//  AXAttributedStringMaker.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/5.
//  Email: arnoldxiao@163.com
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import "AXAttributedStringMaker.h"

typedef AXAttributedStringSegment *(^AXAttributedStringSegmentBlock)(id _Nonnull object);

@interface AXAttributedStringMaker ()

/// 生成segment的block，执行后才会生成
@property (nonatomic, copy) AXAttributedStringSegmentBlock(^segment)(AXAttributedStringSegmentType type);

/// 平铺后所有的segment集合，包括父节点和子节点
@property (nonatomic, strong) NSMutableArray<AXAttributedStringSegment *> *segments;

@end

@implementation AXAttributedStringMaker

#pragma mark - private methods

- (NSAttributedString *)install {
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] init];
    
    // 遍历segments数组
    [self.segments enumerateObjectsUsingBlock:^(AXAttributedStringSegment * _Nonnull segment, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!segment.father && segment.attributedString) {
            // segment没有父节点，才需要处理拼接，因为作为子节点，已经在父节点内部已经处理过了。
            [mutableAttributedString appendAttributedString:segment.attributedString];
        }
    }];
    
    return [mutableAttributedString copy];
}

#pragma mark - getter

- (AXAttributedStringSegmentStringBlock)text {
    return self.segment(AXAttributedStringSegmentTypeNormal);
}

- (AXAttributedStringSegmentStringBlock)htmlText {
    return self.segment(AXAttributedStringSegmentTypeHTML);
}

- (AXAttributedStringSegmentChildrenBlock)children {
    return self.segment(AXAttributedStringSegmentTypeContainer);
}

- (AXAttributedStringSegmentBlock (^)(AXAttributedStringSegmentType))segment {
    if (!_segment) {
        __weak typeof(self) weakSelf = self;
        _segment = ^AXAttributedStringSegmentBlock(AXAttributedStringSegmentType type) {
            return ^AXAttributedStringSegment *(id object) {
                __strong typeof(weakSelf) self = weakSelf;
                AXAttributedStringSegment *segment = nil;
                switch (type) {
                    case AXAttributedStringSegmentTypeNormal:
                    case AXAttributedStringSegmentTypeHTML: {
                        NSAssert([object isKindOfClass:[NSString class]], @"The object's class kind must be NSString.");
                        NSAssert(((NSString *)object).length, @"The text's length cannot be ZERO.");
                        segment = [AXAttributedStringSegment segmentWithType:type text:(NSString *)object];
                        break;
                    }
                    case AXAttributedStringSegmentTypeContainer: {
                        NSAssert([object isKindOfClass:[NSArray class]], @"The object's class kind must be NSArray.");
                        NSArray *children = (NSArray *)object;
                        NSAssert(children.count, @"The children's count cannot be ZERO.");
                        // 检查所有元素类型
                        __block BOOL invalid = NO;
                        [children enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                            if (![obj isKindOfClass:[AXAttributedStringSegment class]]) {
                                invalid = YES;
                                *stop = YES;
                                return;
                            }
                        }];
                        NSAssert(!invalid, @"The children's object type is not AXAttributedStringSegment.");
                        segment = [AXAttributedStringSegment segmentWithType:type children:children];
                        break;
                    }
                }
                NSAssert(segment, @"The segment object not allow nil.");
                [self.segments addObject:segment];
                return segment;
            };
        };
    }
    return _segment;
}

- (NSMutableArray<AXAttributedStringSegment *> *)segments {
    if (!_segments) {
        _segments = [NSMutableArray array];
    }
    return _segments;
}

@end
