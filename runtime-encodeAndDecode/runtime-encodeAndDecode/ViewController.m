//
//  ViewController.m
//  runtime-encodeAndDecode
//
//  Created by apple on 2017/5/27.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import "ViewController.h"
#import "LFUserInfo.h"


//用户数据存放地址
#define filePath [NSString stringWithFormat:@"%@/Documents/userInfo.data",NSHomeDirectory()]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



//归档
- (IBAction)encode:(UIButton *)sender {
    LFUserInfo *userInfo = [[LFUserInfo alloc] init];
    userInfo.username = @"zhangsan";
    userInfo.age = 18;
    userInfo.height = 178.5;
    
    [NSKeyedArchiver archiveRootObject:userInfo toFile:filePath];
}

//解档
- (IBAction)decode:(UIButton *)sender {
    
    LFUserInfo *userInfo = (LFUserInfo *)[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"username = %@,age = %d,height = %f",userInfo.username,userInfo.age,userInfo.height);
    
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
