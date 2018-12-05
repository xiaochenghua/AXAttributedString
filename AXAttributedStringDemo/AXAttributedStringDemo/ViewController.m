//
//  ViewController.m
//  AXAttributedStringDemo
//
//  Created by xiaochenghua on 2018/12/5.
//  Copyright © 2018 xiaochenghua. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 120, 30)];
    [btn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:@"Click me!" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)pressesBegan:(NSSet<UIPress *> *)presses withEvent:(UIPressesEvent *)event {
    [self btnClick:nil];
}

- (void)btnClick:(UIButton *)btn {
    SecondViewController *svc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:svc animated:YES];
}


@end
