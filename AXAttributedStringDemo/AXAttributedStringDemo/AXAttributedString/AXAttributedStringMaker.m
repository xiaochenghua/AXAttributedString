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

@property (nonatomic, strong) NSMutableDictionary *attributedStringCache;

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
                __strong typeof(self) self = weakSelf;
                NSAssert([text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length, @"The formatted-text's length cannot be 0.");
                return [self.chain setUpSegmentAttributedStringWithText:text type:type];
            };
        };
    }
    return self;
}

#pragma mark - private methods

- (AXAttributedStringChain * (^)(NSString *))text {
    NSAssert(self.segmentAttributedStringSetUpBlock, @"Block maybe is nil.");
    return self.segmentAttributedStringSetUpBlock(AXAttributedStringTextTypeNormal);
}

- (AXAttributedStringChain * (^)(NSString *))htmlText {
    NSAssert(self.segmentAttributedStringSetUpBlock, @"Block maybe is nil.");
    return self.segmentAttributedStringSetUpBlock(AXAttributedStringTextTypeHTML);
}

- (NSAttributedString *)install {
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] init];
    
    [self.chain.attributedStrings enumerateObjectsUsingBlock:^(NSAttributedString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mutableAttributedString appendAttributedString:obj];
        [self.attributedStringCache setObject:obj forKey:[NSString stringWithFormat:@"%tu", idx]];
    }];
    return mutableAttributedString.copy;
}

#pragma mark - getter

- (NSMutableDictionary *)attributedStringCache {
    if (!_attributedStringCache) {
        _attributedStringCache = [[NSMutableDictionary alloc] init];
    }
    return _attributedStringCache;
}

- (AXAttributedStringChain *)chain {
    if (!_chain) {
        _chain = [[AXAttributedStringChain alloc] init];
    }
    return _chain;
}

@end
