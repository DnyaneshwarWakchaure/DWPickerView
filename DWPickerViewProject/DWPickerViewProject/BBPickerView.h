//
//  DWPickerView.h
//  DemoProject
//
//  Created by dnyaneshwar on 25/03/17.
//  Copyright (c) 2014 dnyaneshwar. All rights reserved.
//
#import <Foundation/Foundation.h>


@protocol BBPickerViewDelegate <NSObject>

-(void)selectedRow:(int)row withString:(NSString *)text;
-(void)selectedRow:(int)row withSelectedObject:(NSDictionary *)selectedObject;
@end

@interface BBPickerView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
{
    UIPickerView *pickerView;
    UIToolbar *pickerToolbar;
    
    NSString* keyName;
}
@property (nonatomic, strong) NSArray *arrRecords;
@property (nonatomic, strong) id <BBPickerViewDelegate> delegate;


-(void)showPicker;
-(id)initWithFrame:(CGRect)frame withNSArray:(NSArray *)arrValues;
-(id)initWithFrame:(CGRect)frame withNSArrayDictObjects:(NSArray *)arrValues keyName:(NSString*)keyName;
@end
