//
//  AXViewController.m
//  AXAttributedString
//
//  Created by chenghua.xiao on 03/18/2020.
//  Copyright (c) 2020 chenghua.xiao. All rights reserved.
//

#import "AXViewController.h"
#import "AXSecondViewController.h"

@interface AXViewController ()

@end

@implementation AXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = NSStringFromClass([self class]);
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self.view addSubview:({
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 120, 30)];
        [btn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitle:@"Try click me!" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    })];
}

- (void)pressesBegan:(NSSet<UIPress *> *)presses withEvent:(UIPressesEvent *)event {
    [self btnClick:nil];
}

- (void)btnClick:(UIButton *)btn {
    AXSecondViewController *viewController = [[AXSecondViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
