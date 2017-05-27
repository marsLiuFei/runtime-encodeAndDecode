//
//  LFUserInfo.m
//  runtime-encodeAndDecode
//
//  Created by apple on 2017/5/27.
//  Copyright © 2017年 baixinxueche. All rights reserved.
//

#import "LFUserInfo.h"
#import <objc/runtime.h>

@implementation LFUserInfo

- (NSArray *)ignoredNames {
    return @[@"_height",@"_phoneNumber"];
}
//解档数据
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivarLists = class_copyIvarList([self class], &count);
        for (int i = 0 ; i<count; i++) {
            Ivar ivar = ivarLists[i];
            const char *key = ivar_getName(ivar);
            NSString *keyStr  = [NSString stringWithUTF8String:key];
            
            //忽略不需要归档的元素
            if ([[self ignoredNames] containsObject:keyStr]) {
                continue;
            }
            //进行解档取值
            id value = [aDecoder decodeObjectForKey:keyStr];
            
            //利用KVC对属性赋值
            [self setValue:value forKey:keyStr];
        }
        free(ivarLists);
    }
    return self;
}
//归档数据
-(void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned int count = 0;
    Ivar *ivarLIst = class_copyIvarList([self class], &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivarLIst[i];
        const char *key = ivar_getName(ivar);
        NSString *keyStr = [NSString stringWithUTF8String:key];
        // 忽略不需要解档的属性
        if ([[self ignoredNames] containsObject:keyStr]) {
            continue;
        }
        //利用KVC取值
        id value = [self valueForKey:keyStr];
        [aCoder encodeObject:value forKey:keyStr];
    }
    free(ivarLIst);
}
@end
