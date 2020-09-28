//
//  AXSecondViewController.m
//  AXAttributedString
//
//  Created by xiaochenghua on 2018/6/6.
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import "AXSecondViewController.h"
#import <AXAttributedString/AXAttributedString.h>
//#import <AXAttributedString/UILabel+AXAttributedString.h>
//#import <AXAttributedString/UITextView+AXAttributedString.h>
//#import <AXAttributedString/NSAttributedString+AXAdditional.h>

@interface AXSecondViewController () <UITextViewDelegate>
@property (nonatomic, strong) UILabel *attributedStringLabel;
@property (nonatomic, strong) UITextView *textView;
@end

@implementation AXSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.title = NSStringFromClass([self class]);
    
    [self.view addSubview:self.attributedStringLabel];
//    [self.view addSubview:self.textView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//    self.textView.frame = self.view.bounds;
    self.attributedStringLabel.frame = self.view.bounds;
}

#pragma mark - <UITextViewDelegate>

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    NSLog(@"%@, %@", URL.absoluteString, NSStringFromRange(characterRange));
    return YES;
}

#pragma mark - getter

- (UILabel *)attributedStringLabel {
    if (!_attributedStringLabel) {
        _attributedStringLabel = [[UILabel alloc] init];
        _attributedStringLabel.backgroundColor = UIColor.yellowColor;
        _attributedStringLabel.numberOfLines = 0;
        [_attributedStringLabel setAttributedTextUsingBlock:^(AXAttributedStringMaker * _Nonnull make) {
            make.text(@"Test").backgroundColor([UIColor whiteColor]).textColor([UIColor grayColor]).systemFontSize(20);
            make.text(@"\n");
            make.children(@[
                            make.text(@"Child1").textColor([UIColor blackColor]).systemFontSize(20),
                            make.text(@"\n"),
                            make.text(@"Child2").textColor([UIColor redColor]).systemFontSize(20),
                            make.children(@[
                                make.text(@"\n"),
                                make.text(@"Child3").textColor([UIColor orangeColor]).systemFontSize(20),
                                make.text(@"\n"),
                                make.text(@"Child4").textColor([UIColor greenColor]).systemFontSize(20),
                                make.text(@"\n"),
                                          ]),
                            make.text(@"Child5").textColor([UIColor greenColor]).systemFontSize(20)
                          ]).backgroundColor([UIColor lightGrayColor]).strikethroughStyle(NSUnderlineStyleSingle|NSUnderlineStylePatternSolid).strikethroughColor([UIColor grayColor]).lineSpacing(0).alignment(NSTextAlignmentLeft).firstLineHeadIndent(100).paragraphSpacingBefore(20);
            make.text(@"\n");
            make.text(@"End").backgroundColor([UIColor blueColor]).textColor([UIColor whiteColor]).systemFontSize(20);
        }];
    }
    return _attributedStringLabel;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.backgroundColor = UIColor.lightTextColor;
        _textView.editable = NO;
        _textView.dataDetectorTypes = UIDataDetectorTypeLink;
        _textView.delegate = self;
        
        [_textView setAttributedTextUsingBlock:^(AXAttributedStringMaker * _Nonnull make) {
            make.text(@"Test").backgroundColor([UIColor whiteColor]).textColor([UIColor grayColor]).systemFontSize(20);
//            make.children(@[
//                make.text(@"child1").textColor([UIColor blackColor]).systemFontSize(15),
//                make.text(@"\n"),
//                make.text(@"child2").textColor([UIColor blackColor]).systemFontSize(15)
//            ]);
//            make.text(@"End").backgroundColor([UIColor blueColor]).textColor([UIColor whiteColor]).systemFontSize(20);
        }];
    }
    return _textView;
}

- (void)dealloc {
    NSLog(@"<<<<<<<<<< delloc <<<<<<<<<");
}

@end
