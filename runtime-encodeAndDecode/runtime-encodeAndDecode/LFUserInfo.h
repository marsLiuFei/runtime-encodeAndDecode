//
//  LFUserInfo.h
//  runtime-encodeAndDecode
//
//  Created by apple on 2017/5/27.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFUserInfo : NSObject<NSCoding>


@property (copy  , nonatomic) NSString *username;
@property (assign, nonatomic) int age;
@property (assign, nonatomic) double height;
@property (strong, nonatomic) NSNumber *phoneNumber;

@end
