//
//  BaseModel.h
//  iOSBaseModelProject
//
//  Created by pengjiaxin on 2018/9/5.
//  Copyright © 2018年 pengjiaxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *descriptions;

-(instancetype)initWithDictionary:(NSDictionary *)dic;

@end
