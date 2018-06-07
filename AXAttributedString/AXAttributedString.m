//
//  AXAttributedString.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/5.
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import "AXAttributedString.h"

@implementation AXAttributedString

+ (NSAttributedString *)makeAttributedString:(void (^)(AXAttributedStringMaker * _Nonnull))block {
    AXAttributedStringMaker *maker = [[AXAttributedStringMaker alloc] init];
    block(maker);
    return [maker install];
}

@end
