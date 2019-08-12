//
//  AXAttributedStringMaker.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/5.
//  Email: arnoldxiao@163.com
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import "AXAttributedStringMaker.h"

@interface AXAttributedStringMaker ()

/**
 Owned AXAttributedStringChain object.
 */
@property (nonatomic, strong) AXAttributedStringChain *chain;

@end

@implementation AXAttributedStringMaker

#pragma mark - private methods

- (AXAttributedStringChain * (^)(NSString *))text {
    __weak typeof(self) weakSelf = self;
    return ^id(NSString *text) {
        __strong typeof(self) self = weakSelf;
        NSAssert([text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length, @"The formatted-text's length cannot be 0.");
        [self.chain setUpSegmentAttributedStringWithText:text];
        return self.chain;
    };
}

- (AXAttributedStringChain * (^)(NSString *))htmlText {
    __weak typeof(self) weakSelf = self;
    return ^id(NSString *htmlText) {
        __strong typeof(self) self = weakSelf;
        NSAssert([htmlText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length, @"The formatted-text's length cannot be 0.");
        [self.chain setUpSegmentAttributedStringWithHTMLText:htmlText];
        return self.chain;
    };
}

- (NSAttributedString *)install {
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] init];
    
    [self.chain.attributedStrings enumerateObjectsUsingBlock:^(NSAttributedString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mutableAttributedString appendAttributedString:obj];
    }];
    return mutableAttributedString.copy;
}

#pragma mark - getter

- (AXAttributedStringChain *)chain {
    if (!_chain) {
        _chain = [[AXAttributedStringChain alloc] init];
    }
    return _chain;
}

@end
