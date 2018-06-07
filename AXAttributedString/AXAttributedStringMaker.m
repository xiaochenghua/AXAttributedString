//
//  AXAttributedStringMaker.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/5.
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
        NSAssert(text.length, @"The text's length must be positive!");
        
        __strong typeof(self) self = weakSelf;
        
        self.chain.text = text;
        return self.chain;
    };
}

- (NSAttributedString *)install {
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] init];
    
    for (NSMutableAttributedString *attributedString in self.chain.attributedStrings) {
        [mutableAttributedString appendAttributedString:attributedString.copy];
    }
    
    return mutableAttributedString.copy;
}

- (AXAttributedStringChain *)chain {
    if (!_chain) {
        _chain = [[AXAttributedStringChain alloc] init];
    }
    return _chain;
}

@end
