//
//  AXAttributedStringChain.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/6.
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import "AXAttributedStringChain.h"

@interface AXAttributedStringChain ()
@property (nonatomic, strong) NSMutableArray<NSMutableAttributedString *> *attributedStrings;
@property (nonatomic, strong) NSMutableAttributedString *currentAttributedString;
@end

@implementation AXAttributedStringChain

- (AXAttributedStringChain * (^)(UIColor *))foregroundColor {
    return ^id(UIColor *color) {
        return [self addAttribute:NSForegroundColorAttributeName value:color];
    };
}

- (AXAttributedStringChain * (^)(UIColor *))backgroundColor {
    return ^id(UIColor *color) {
        return [self addAttribute:NSBackgroundColorAttributeName value:color];
    };
}

- (AXAttributedStringChain * (^)(UIFont *))font {
    return ^id(UIFont *font) {
        return [self addAttribute:NSFontAttributeName value:font];
    };
}

- (AXAttributedStringChain * (^)(NSUnderlineStyle))underline {
    return ^id(NSUnderlineStyle style) {
        return [self addAttribute:NSUnderlineStyleAttributeName value:@(style)];
    };
}

- (AXAttributedStringChain * (^)(UIColor *))underlineColor {
    return ^id(UIColor *color) {
        return [self addAttribute:NSUnderlineColorAttributeName value:color];
    };
}

- (AXAttributedStringChain * (^)(CGFloat))baseline {
    return ^id(CGFloat offset) {
        return [self addAttribute:NSBaselineOffsetAttributeName value:@(offset)];
    };
}

- (AXAttributedStringChain * (^)(NSUnderlineStyle))strike {
    return ^id(NSUnderlineStyle style) {
        return [self addAttribute:NSStrikethroughStyleAttributeName value:@(style)];
    };
}

- (AXAttributedStringChain * (^)(UIColor *))strikeColor {
    return ^id(UIColor *color) {
        return [self addAttribute:NSStrikethroughColorAttributeName value:color];
    };
}

- (AXAttributedStringChain * (^)(NSParagraphStyle *))paragraphStyle {
    return ^id(NSParagraphStyle *style) {
        return [self addAttribute:NSParagraphStyleAttributeName value:style];
    };
}

- (AXAttributedStringChain *)addAttribute:(NSAttributedStringKey)key value:(id)value {
    [self.currentAttributedString addAttribute:key value:value range:NSMakeRange(0, self.text.length)];
    return self;
}

- (void)buildSubAttributedString {
    if (!self.text) { return; }
    self.currentAttributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    [self.attributedStrings addObject:self.currentAttributedString];
}

- (NSMutableArray<NSMutableAttributedString *> *)attributedStrings {
    if (!_attributedStrings) {
        _attributedStrings = [NSMutableArray array];
    }
    return _attributedStrings;
}

@end
