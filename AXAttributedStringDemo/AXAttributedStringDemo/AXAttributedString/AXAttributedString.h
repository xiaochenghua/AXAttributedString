//
//  AXAttributedString.h
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/5.
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXAttributedStringMaker.h"

@interface AXAttributedString : NSObject

+ (NSAttributedString *)makeAttributedString:(void(NS_NOESCAPE ^)(AXAttributedStringMaker *make))block;

@end
