//
//  AXAttributedStringMaker.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/5.
//  Email: arnoldxiao@163.com
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import "AXAttributedStringMaker.h"

typedef AXAttributedStringChain *(^SegmentAttributedStringChainBlock)(NSString *);

@interface AXAttributedStringMaker ()

/**
 Owned AXAttributedStringChain object.
 */
@property (nonatomic, strong) AXAttributedStringChain *chain;

@property (nonatomic, copy) SegmentAttributedStringChainBlock(^segmentAttributedStringSetUpBlock)(AXAttributedStringTextType type);

@end

@implementation AXAttributedStringMaker

- (instancetype)init {
    if (self = [super init]) {
        __weak typeof(self) weakSelf = self;
        _segmentAttributedStringSetUpBlock = ^SegmentAttributedStringChainBlock(AXAttributedStringTextType type) {
            return ^AXAttributedStringChain *(NSString *text) {
                __strong typeof(weakSelf) self = weakSelf;
                NSAssert(text.length, @"The text's length cannot be ZERO.");
                return [self.chain setUpSegmentAttributedStringWithText:text type:type];
            };
        };
    }
    return self;
}

#pragma mark - private methods

- (AXAttributedStringChain * _Nonnull (^)(NSString * _Nonnull))text {
    NSAssert(self.segmentAttributedStringSetUpBlock, @"segmentAttributedStringSetUpBlock is nil.");
    return self.segmentAttributedStringSetUpBlock(AXAttributedStringTextTypeNormal);
}

- (AXAttributedStringChain * _Nonnull (^)(NSString * _Nonnull))htmlText {
    NSAssert(self.segmentAttributedStringSetUpBlock, @"segmentAttributedStringSetUpBlock is nil.");
    return self.segmentAttributedStringSetUpBlock(AXAttributedStringTextTypeHTML);
}

- (NSAttributedString *)install {
    NSMutableAttributedString *mas = [[NSMutableAttributedString alloc] init];
    
    [self.chain.attributedStrings enumerateObjectsUsingBlock:^(NSAttributedString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mas appendAttributedString:obj];
    }];
    
    return mas.copy;
}

#pragma mark - getter

- (AXAttributedStringChain *)chain {
    if (!_chain) {
        _chain = [[AXAttributedStringChain alloc] init];
    }
    return _chain;
}

@end
