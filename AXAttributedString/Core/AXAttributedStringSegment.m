//
//  AXAttributedStringSegment.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2020/9/25.
//  Email: arnoldxiao@163.com
//  Copyright © 2020 xiaochenghua. All rights reserved.
//

#import "AXAttributedStringSegment.h"

@interface AXAttributedStringSegment ()

@property (nonatomic, strong, nullable) NSMutableAttributedString *mutableAttributedString;

@end

@implementation AXAttributedStringSegment

+ (instancetype)segmentWithType:(AXAttributedStringSegmentType)type text:(NSString *)text children:(NSArray<AXAttributedStringSegment *> *)children {
    AXAttributedStringSegment *segment = [[AXAttributedStringSegment alloc] init];
    
    switch (type) {
        case AXAttributedStringSegmentTypeNormal: {
            segment.mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:text];
            break;
        }
        case AXAttributedStringSegmentTypeHTML: {
            segment.mutableAttributedString = [[NSMutableAttributedString alloc] initWithData:[text dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:NULL error:nil];
            break;
        }
        case AXAttributedStringSegmentTypeContainer: {
            [children enumerateObjectsUsingBlock:^(AXAttributedStringSegment * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (obj.attributedString) {
                    [segment.mutableAttributedString appendAttributedString:obj.attributedString];
                }
            }];
            break;
        }
    }
    
    return segment;
}

+ (instancetype)segmentWithType:(AXAttributedStringSegmentType)type text:(NSString *)text {
    return [self segmentWithType:type text:text children:nil];
}

+ (instancetype)segmentWithType:(AXAttributedStringSegmentType)type children:(NSArray<AXAttributedStringSegment *> *)children {
    return [self segmentWithType:type text:nil children:children];
}

- (NSAttributedString *)attributedString {
    return [self.mutableAttributedString copy];
}

@end
