//
//  ViewController.m
//  iOSBaseModelProject
//
//  Created by pengjiaxin on 2018/9/5.
//  Copyright © 2018年 pengjiaxin. All rights reserved.
//

#import "ViewController.h"
#import "PersonModel.h"
#import "PersonOneModel.h"
#import "PersonListModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    
    
    //1，一个对象
    NSMutableDictionary *personDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"12",@"id",@"cfdfvd",@"name",[NSNumber numberWithInt:10],@"age",[NSNumber numberWithBool:NO],@"sex",nil];
    
    PersonModel *model = [[PersonModel alloc]initWithDictionary:personDic];
    NSLog(@"--------------\n%@\nid:%@\nname:%@\nage:%ld\nsex:%d\n-----------------------------\n",model,model.ID,model.name,model.age,model.sex);
    
    //2，一个对象中包含一个对象
    
    NSMutableDictionary *personOneDic = [NSMutableDictionary dictionaryWithObjectsAndKeys: @"一个对象中包含一个对象Value",@"description",personDic,@"person",nil];
    PersonOneModel *personOneModel = [[PersonOneModel alloc]initWithDictionary:personOneDic];
    
    PersonModel *personModel = [[PersonModel alloc]initWithDictionary:personOneModel.person];
    
    NSLog(@"-----------------------------\n%@\ndescriptions:%@\ndic:%@\npeople:%@\n-----------------------------\n",personOneModel,personOneModel.descriptions,personOneModel.person,personModel);
    
    //3，数组中对象列表
    NSMutableDictionary *personDic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"22",@"id",@"cfdfvd",@"name",[NSNumber numberWithInt:10],@"age",[NSNumber numberWithBool:NO],@"sex",nil];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:personDic,personDic1, nil];
    
    NSMutableDictionary *personListDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"对象数组",@"description",array,@"personListArray",nil];
    PersonListModel *personListModel = [[PersonListModel alloc]initWithDictionary:personListDic];
    
    NSMutableArray *listsArray = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in personListModel.personListArray) {
        PersonModel *personModel = [[PersonModel alloc]initWithDictionary:dic];
        [listsArray addObject:personModel];
    }
    NSLog(@"-----------------------------\n%@\ndescriptions:%@\narray:%@\n-----------------------------\n",personListModel,personListModel.descriptions,personListModel.personListArray);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
