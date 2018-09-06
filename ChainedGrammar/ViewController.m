//
//  ViewController.m
//  链式语法
//
//  Created by 黃秋陽 on 2018/9/6.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import "ViewController.h"
#import "QY_AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    QY_AFNetworking *qManager = [[QY_AFNetworking alloc]init];
    
    NSMutableDictionary *params;
    params[@"key"] = @"value";
    
    NSString *url = @"https://www.test.com";
    
    RequestMethod method = POSTMethod;
    
    [qManager.getMethod(method).getUrl(url).getParams(params) resultWithSuccess:^(id object) {
        NSLog(@"%@ result ========= %@", qManager, object);
    } failure:^(NSError *error) {
        NSLog(@"%@ error ========= %@", qManager, error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
