//
//  SecondViewController.m
//  AXAttributedString-Demo
//
//  Created by xiaochenghua on 2018/6/6.
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import "SecondViewController.h"
#import "AXAttributedString.h"
#import "UILabel+AXAttributedString.h"
#import "UITextView+AXAttributedString.h"

@interface SecondViewController () <UITextViewDelegate>
@property (nonatomic, strong) UILabel *attributedStringLabel;
@property (nonatomic, strong) UITextView *textView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
//    [self.view addSubview:self.attributedStringLabel];
    [self.view addSubview:self.textView];
}

- (void)dealloc {
    NSLog(@"<<<<<<<<<< delloc <<<<<<<<<");
}

#pragma mark - <UITextViewDelegate>

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    NSLog(@"%@, %@", URL.absoluteString, NSStringFromRange(characterRange));
    return YES;
}

#pragma mark - getter

- (UILabel *)attributedStringLabel {
    if (!_attributedStringLabel) {
        _attributedStringLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, [UIScreen mainScreen].bounds.size.width - 2 * 10, 300)];
        _attributedStringLabel.backgroundColor = UIColor.yellowColor;
        _attributedStringLabel.numberOfLines = 0;
        [_attributedStringLabel setAttributedStringUsingBlock:^(AXAttributedStringMaker * _Nonnull make) {
            make.text(@"Views and Controls").foregroundColor(UIColor.blackColor).font([UIFont systemFontOfSize:14]).underlineStyle(NSUnderlineStyleSingle);
            make.text(@"Present your content onscreen").font([UIFont systemFontOfSize:14]).foregroundColor(UIColor.blueColor).backgroundColor(UIColor.lightGrayColor);
            make.text(@"and define the interactions allowed").foregroundColor(UIColor.orangeColor).systemFontSize(20).strikethroughStyle(NSUnderlineStyleThick).strikethroughColor(UIColor.lightTextColor);
            make.text(@"\n");   //  line break
            make.text(@"with that content.").foregroundColor(UIColor.brownColor).font([UIFont boldSystemFontOfSize:30]).baselineOffset(-15);
            make.text(@"Overview").foregroundColor(AXColorFromRGB(0xCC00FF)).systemFontSize(30);
            //  Not allow formatted(remove the first and last empty) string to be empty
            //  make.text(@"");
        }];
    }
    return _attributedStringLabel;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 2 * 10, 500)];
        _textView.backgroundColor = UIColor.lightTextColor;
        _textView.editable = NO;
        _textView.dataDetectorTypes = UIDataDetectorTypeLink;
        _textView.delegate = self;
        [_textView setAttributedStringUsingBlock:^(AXAttributedStringMaker * _Nonnull make) {
            make.htmlText(@"a<br>b").systemFontSize(36).foregroundColor(UIColor.redColor);
            make.text(@"\n");
            make.text(@"Views and Controls").foregroundColor(UIColor.blackColor).font([UIFont systemFontOfSize:14]).underlineStyle(NSUnderlineStyleSingle);
            make.text(@"Present your content onscreen").font([UIFont systemFontOfSize:12]).foregroundColor(UIColor.blueColor).backgroundColor(UIColor.lightGrayColor);
            make.text(@"and define the interactions allowed").foregroundColor(UIColor.orangeColor).systemFontSize(18).strikethroughStyle(NSUnderlineStyleThick).strikethroughColor(UIColor.orangeColor);
            make.text(@"with that content.").foregroundColor(UIColor.brownColor).font([UIFont boldSystemFontOfSize:16]).baselineOffset(0);
            make.text(@"Overview").foregroundColor(AXColorFromRGB(0xCC00FF)).systemFontSize(22).linkString(@"https://github.com/arnoldxiao/");
            make.text(@"\n\n\n");
            make.text(@"Views and Controls").foregroundColor(UIColor.blackColor).font([UIFont systemFontOfSize:14]).underlineStyle(NSUnderlineStyleSingle);
            make.text(@"Present your content onscreen").font([UIFont systemFontOfSize:12]).foregroundColor(UIColor.blueColor).backgroundColor(UIColor.lightGrayColor);
            make.text(@"and define the interactions allowed").foregroundColor(UIColor.orangeColor).systemFontSize(18).strikethroughStyle(NSUnderlineStyleThick).strikethroughColor(UIColor.orangeColor);
            make.text(@"with that content.").foregroundColor(UIColor.brownColor).font([UIFont boldSystemFontOfSize:16]).baselineOffset(0);
            make.text(@"Overview").foregroundColor(AXColorFromRGB(0xCC00FF)).systemFontSize(22).linkString(@"https://github.com/arnoldxiao/");
            make.text(@"\n\n\n");
            make.text(@"Views and Controls").foregroundColor(UIColor.blackColor).font([UIFont systemFontOfSize:14]).underlineStyle(NSUnderlineStyleSingle);
            make.text(@"Present your content onscreen").font([UIFont systemFontOfSize:12]).foregroundColor(UIColor.blueColor).backgroundColor(UIColor.lightGrayColor);
            make.text(@"and define the interactions allowed").foregroundColor(UIColor.orangeColor).systemFontSize(18).strikethroughStyle(NSUnderlineStyleThick).strikethroughColor(UIColor.orangeColor);
            make.text(@"with that content.").foregroundColor(UIColor.brownColor).font([UIFont boldSystemFontOfSize:16]).baselineOffset(0);
            make.text(@"Overview").foregroundColor(AXColorFromRGB(0xCC00FF)).systemFontSize(22).linkString(@"https://github.com/arnoldxiao/");
            make.text(@"\n\n\n");
            make.text(@"Views and Controls").foregroundColor(UIColor.blackColor).font([UIFont systemFontOfSize:14]).underlineStyle(NSUnderlineStyleSingle);
            make.text(@"Present your content onscreen").font([UIFont systemFontOfSize:12]).foregroundColor(UIColor.blueColor).backgroundColor(UIColor.lightGrayColor);
            make.text(@"and define the interactions allowed").foregroundColor(UIColor.orangeColor).systemFontSize(18).strikethroughStyle(NSUnderlineStyleThick).strikethroughColor(UIColor.orangeColor);
            make.text(@"with that content.").foregroundColor(UIColor.brownColor).font([UIFont boldSystemFontOfSize:16]).baselineOffset(0);
            make.text(@"Overview").foregroundColor(AXColorFromRGB(0xCC00FF)).systemFontSize(22).linkString(@"https://github.com/arnoldxiao/");
        }];
    }
    return _textView;
}

@end
