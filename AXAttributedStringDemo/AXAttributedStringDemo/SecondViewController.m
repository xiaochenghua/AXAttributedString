//
//  SecondViewController.m
//  AXAttributedString-Demo
//
//  Created by xiaochenghua on 2018/6/6.
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import "SecondViewController.h"
#import "AXAttributedString/AXAttributedString.h"

@interface SecondViewController ()
@property (nonatomic, strong) UILabel *attributedStringLabel;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.attributedStringLabel];
}

- (void)dealloc {
    NSLog(@"<<<<<<<<<< delloc <<<<<<<<<");
}

- (UILabel *)attributedStringLabel {
    if (!_attributedStringLabel) {
        _attributedStringLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, [UIScreen mainScreen].bounds.size.width - 2 * 10, 300)];
        _attributedStringLabel.backgroundColor = UIColor.yellowColor;
        _attributedStringLabel.numberOfLines = 0;
//        _attributedStringLabel.attributedText = [AXAttributedString makeAttributedString:^(AXAttributedStringMaker *make) {
//            make.text(@"第一段").foregroundColor(UIColor.blackColor).font([UIFont systemFontOfSize:14]).underlineStyle(NSUnderlineStyleSingle);
//            make.text(@"第二段").font([UIFont systemFontOfSize:14]).foregroundColor(UIColor.blueColor).backgroundColor(UIColor.lightGrayColor);
//            make.text(@"第三段").foregroundColor(UIColor.orangeColor).systemFontSize(20).strikethroughStyle(NSUnderlineStyleThick).strikethroughColor(UIColor.redColor);
//            make.text(@"\n");   //  line break
//            make.text(@"第四段").foregroundColor(UIColor.brownColor).font([UIFont boldSystemFontOfSize:30]).baselineOffset(-15);
//            make.text(@"第五段").foregroundColor(UIColorFromRGB(0xCC00FF)).systemFontSize(30);
//
//            //  Not allow formatted(remove the first and last empty) string to be empty
//            //  make.text(@"");
//        }];
        
        [_attributedStringLabel axa_setAttributedStringUsingBlock:^(AXAttributedStringMaker * _Nonnull make) {
            make.text(@"第一段").foregroundColor(UIColor.blackColor).font([UIFont systemFontOfSize:14]).underlineStyle(NSUnderlineStyleSingle);
            make.text(@"第二段").font([UIFont systemFontOfSize:14]).foregroundColor(UIColor.blueColor).backgroundColor(UIColor.lightGrayColor);
            make.text(@"第三段").foregroundColor(UIColor.orangeColor).systemFontSize(20).strikethroughStyle(NSUnderlineStyleThick).strikethroughColor(UIColor.redColor);
            make.text(@"\n");   //  line break
            make.text(@"第四段").foregroundColor(UIColor.brownColor).font([UIFont boldSystemFontOfSize:30]).baselineOffset(-15);
            make.text(@"第五段").foregroundColor(UIColorFromRGB(0xCC00FF)).systemFontSize(30);
            
            //  Not allow formatted(remove the first and last empty) string to be empty
            //  make.text(@"");
        }];
    }
    return _attributedStringLabel;
}

@end
