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

@property (nonatomic, strong) NSMutableArray<AXAttributedStringSegment *> *segments;
//@property (nonatomic, copy) AXAttributedStringSegmentStringBlock(^segmentWithText)(AXAttributedStringSegmentType type);
//@property (nonatomic, copy) AXAttributedStringSegmentChildrenBlock(^segmentWithChildren)(void);
@property (nonatomic, copy) AXAttributedStringSegmentBlock(^segment)(AXAttributedStringSegmentType type);
@end

@implementation AXAttributedStringMaker

#pragma mark - private methods

- (NSAttributedString *)install {
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] init];
    
    // 遍历segments数组
    [self.segments enumerateObjectsUsingBlock:^(AXAttributedStringSegment * _Nonnull segment, NSUInteger idx, BOOL * _Nonnull stop) {
        if (segment.attributedString) {
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
                        NSAssert([object isKindOfClass:[NSString class]] && ((NSString *)object).length, @"The text's length cannot be ZERO.");
                        segment = [AXAttributedStringSegment segmentWithType:type text:(NSString *)object];
                        break;
                    }
                    case AXAttributedStringSegmentTypeContainer: {
                        NSAssert([object isKindOfClass:[NSArray class]] && ((NSArray *)object).count, @"The children's count cannot be ZERO.");
                        __block BOOL valid = NO;
                        [(NSArray *)object enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                            if (![obj isKindOfClass:[AXAttributedStringSegment class]]) {
                                valid = YES;
                                *stop = YES;
                                return;
                            }
                        }];
                        
                        NSAssert(valid, @"The children's object type is not AXAttributedStringSegment.");
                        
                        segment = [AXAttributedStringSegment segmentWithType:type children:(NSArray<AXAttributedStringSegment *> *)object];
                        break;
                    }
                }
                
                NSAssert(segment, @"The segment object not allow nil.");
                
                [self.segments addObject:segment];
                
                return segment;
            };
        };;
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
