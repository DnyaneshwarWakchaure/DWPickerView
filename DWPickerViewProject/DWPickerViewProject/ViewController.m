//
//  ViewController.m
//  DWPickerViewProject
//
//  Created by Dnyaneshwar on 27/03/17.
//  Copyright © 2017 dnyaneshwar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary * langEn=[[NSMutableDictionary alloc] init];
    [langEn setValue:@"en" forKey:@"languageCode"];
    [langEn setValue:@"English" forKey:@"language"];
    
    NSMutableDictionary * langHi=[[NSMutableDictionary alloc] init];
    [langHi setValue:@"hi" forKey:@"languageCode"];
    [langHi setValue:@"हिंदी" forKey:@"language"];
    
    
    NSMutableDictionary * langSp=[[NSMutableDictionary alloc] init];
    [langSp setValue:@"es-mx" forKey:@"languageCode"];
    [langSp setValue:@"Español" forKey:@"language"];
    
    NSArray* array=[[NSArray alloc] initWithObjects:langEn,langHi,langSp, nil];
    
    BBPickerView* pickerView=[[BBPickerView alloc]initWithFrame:self.view.frame withNSArrayDictObjects:array keyName:@"language"];
    pickerView.delegate=self;
    [self.view addSubview:pickerView];
    [pickerView showPicker];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)selectedRow:(int)row withSelectedObject:(NSDictionary *)selectedObject{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
