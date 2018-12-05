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
        __strong typeof(self) self = weakSelf;
        NSAssert([text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length, @"The text's length cannot be 0.");
        
        [self.chain setUpSubAttributedStringWithText:text];
        return self.chain;
    };
}

- (NSAttributedString *)install {
    NSArray<NSMutableAttributedString *> *ass = self.chain.attributedStrings;
    NSMutableAttributedString *mas = [[NSMutableAttributedString alloc] init];
    
    [ass enumerateObjectsUsingBlock:^(NSMutableAttributedString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mas appendAttributedString:obj.copy];
    }];
    return mas.copy;
}

- (AXAttributedStringChain *)chain {
    if (!_chain) {
        _chain = [[AXAttributedStringChain alloc] init];
    }
    return _chain;
}

@end
