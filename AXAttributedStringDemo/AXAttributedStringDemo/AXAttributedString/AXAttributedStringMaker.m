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

@property (nonatomic, strong) AXAttributedStringChain *chain;

@end

@implementation AXAttributedStringMaker

- (AXAttributedStringChain * (^)(NSString *))text {
    __weak typeof(self) weakSelf = self;
    return ^id(NSString *text) {
        __strong typeof(self) self = weakSelf;
        NSAssert([text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length, @"The formatted-text's length cannot be 0.");
        [self.chain setUpSubAttributedStringWithText:text];
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

- (AXAttributedStringChain *)chain {
    if (!_chain) {
        _chain = [[AXAttributedStringChain alloc] init];
    }
    return _chain;
}

@end
