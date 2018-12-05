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
    NSLog(@"<<<<<<<<<<!!!delloc!!!<<<<<<<<<");
}

- (UILabel *)attributedStringLabel {
    if (!_attributedStringLabel) {
        _attributedStringLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, [UIScreen mainScreen].bounds.size.width - 2 * 10, 500)];
        _attributedStringLabel.backgroundColor = UIColor.yellowColor;
        _attributedStringLabel.numberOfLines = 0;
        _attributedStringLabel.attributedText = [AXAttributedString makeAttributedString:^(AXAttributedStringMaker *make) {
            make.text(@"第一段").foregroundColor(UIColor.blackColor).font([UIFont systemFontOfSize:14]).underline(NSUnderlineStyleSingle);
            make.text(@"第二段").font([UIFont systemFontOfSize:14]).foregroundColor(UIColor.blueColor).backgroundColor(UIColor.lightGrayColor);
            make.text(@"第三段").foregroundColor(UIColor.orangeColor).font([UIFont boldSystemFontOfSize:20]).strike(NSUnderlineStyleThick).strikeColor(UIColor.orangeColor);
            make.text(@"\n");
//            make.text(@"");
            make.text(@"第四段").foregroundColor(UIColor.brownColor).font([UIFont boldSystemFontOfSize:30]).baseline(-15);
            make.text(@"第五段").foregroundColor(UIColor.redColor).systemFont(50);
        }];
    }
    return _attributedStringLabel;
}

@end
