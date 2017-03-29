//
//  DWPickerView.h
//  DemoProject
//
//  Created by dnyaneshwar on 25/03/17.
//  Copyright (c) 2014 dnyaneshwar. All rights reserved.
//

#import "BBPickerView.h"

@implementation BBPickerView

#define RGB(r, g, b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

// This intialization only  for simple array objects.
-(id)initWithFrame:(CGRect)frame withNSArray:(NSArray *)arrValues{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.arrRecords = arrValues;
    }
    return self;
    
}
// This intialization id for nsarray with dictionary objects.

-(id)initWithFrame:(CGRect)frame withNSArrayDictObjects:(NSArray *)arrValues keyName:(NSString*)key{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.arrRecords = arrValues;
        keyName=key;
    }
    return self;
    
}
-(void)showPicker{
    
    self.userInteractionEnabled = TRUE;
    self.backgroundColor = [UIColor clearColor];
    int screenWidth = [UIScreen mainScreen].bounds.size.width;
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    pickerView = [[UIPickerView alloc] init];
    pickerToolbar = [[UIToolbar alloc] init];
    pickerView.frame=CGRectMake(0,screenHeight-270, screenWidth, 162.0);
    pickerToolbar.frame=CGRectMake(0, pickerView.frame.origin.y-44,screenWidth, 44);
    
    
    pickerView.backgroundColor=[UIColor whiteColor];
    pickerView.showsSelectionIndicator = YES;
    pickerView.delegate = self;
    pickerView.dataSource = self;
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *btnDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(btnDoneClick)];
    pickerToolbar.tintColor=[UIColor whiteColor];
    pickerToolbar.barTintColor=RGB(90, 140, 191, 1);
    
    
    NSArray *arrBarButtoniTems = [[NSArray alloc] initWithObjects:flexible,btnDone, nil];
    [pickerToolbar setItems:arrBarButtoniTems];
    [self addSubview:pickerView];
    [self addSubview:pickerToolbar];
    
}

-(void)btnDoneClick{
    
    if (keyName){
        NSDictionary*dict=[_arrRecords objectAtIndex:[pickerView selectedRowInComponent:0]];
        if (self.delegate && [self.delegate respondsToSelector:@selector(selectedRow:withSelectedObject:)]) {
            [self.delegate selectedRow:1 withSelectedObject:dict];
        }
    }
    else{
        NSString *str=[_arrRecords objectAtIndex:[pickerView selectedRowInComponent:0]];
        if (self.delegate && [self.delegate respondsToSelector:@selector(selectedRow:withString:)]) {
            [self.delegate selectedRow:1 withString:str];
        }
    }
    [self removeFromSuperview];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.arrRecords.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (keyName)
        return  [[_arrRecords objectAtIndex:row] objectForKey:keyName];
    else
        return [_arrRecords objectAtIndex:row];
    
}
