//
//  PersonModel.h
//  iOSBaseModelProject
//
//  Created by pengjiaxin on 2018/9/5.
//  Copyright © 2018年 pengjiaxin. All rights reserved.
//

#import "BaseModel.h"

@interface PersonModel : BaseModel
@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)NSInteger age;
@property (nonatomic,assign)BOOL sex;


@end
