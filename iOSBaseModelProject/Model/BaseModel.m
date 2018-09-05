//
//  BaseModel.m
//  iOSBaseModelProject
//
//  Created by pengjiaxin on 2018/9/5.
//  Copyright © 2018年 pengjiaxin. All rights reserved.
//

#import "BaseModel.h"
#import <objc/runtime.h>
@implementation BaseModel
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    self = [super init];
    if (self) {
       
        for (NSString *key in [dic allKeys]) {
            //id类型接收返回值
            id value = dic[key];
            //1，处理空类型的value：防止出现unRecognized selector exception
            if ([value isKindOfClass:[NSNull class]]) {
                [self setValue:nil forKey:key];
            }//2，处理对象类型和数组类型的value
            else if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSDictionary class]]){
                [self setValue:value forKey:key];
            }//3，处理非空、非对象数组类型：包括数字，字符串，布尔，全部使用NSString来处理
            else{
                [self setValue:[NSString stringWithFormat:@"%@",value] forKey:key];
            }
        }
    }

    return self;
}
#pragma mark 安全设置
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"setValue---%s",__func__);
    //处理关键字，将关键字转换一下
    if ([key isEqualToString:@"id"]) {
        self.ID = key;
    }
    if ([key isEqualToString:@"description"]) {
        self.descriptions = key;
    }
}

-(void)setNilValueForKey:(NSString *)key{
    NSLog(@"setNilValueForKey---%s",__func__);
}

#pragma mark po或者打印时打出内部信息
- (NSString *)description {
    NSMutableString *text = [NSMutableString stringWithFormat:@"<%@> \n", [self class]];
    NSArray *properties = [self filterPropertys];
    [properties enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *key = (NSString*)obj;
        id value = [self valueForKey:key];
        NSString *valueDescription = (value)?[value description]:@"(null)";
        if (![value respondsToSelector:@selector(count)] && [valueDescription length] > 60 ) {
            valueDescription = [NSString stringWithFormat:@"%@...", [valueDescription substringToIndex:59]];
        }
        valueDescription = [valueDescription stringByReplacingOccurrencesOfString:@"\n" withString:@"\n   "];
        [text appendFormat:@"   [%@]: %@\n", key, valueDescription];
    }];
    [text appendFormat:@"</%@>", [self class]];;
    return text;
}

#pragma mark 获取一个类的属性列表
- (NSArray *)filterPropertys {
    NSMutableArray *props = [NSMutableArray array];
    unsigned int count;
    //获取obj的属性数目
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for(int i = 0; i < count; i++){
        objc_property_t property = properties[i];
        //获取property的C字符串
        const char *char_f = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        [props addObject:propertyName];
    }
    free(properties);
    return props;
}



@end
