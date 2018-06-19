//
//  RootViewController.m
//  YXItemSelect
//
//  Created by apple on 2018/6/14.
//  Copyright © 2018 apple. All rights reserved.
//

#import "RootViewController.h"
#import "YXItemSelect.h"

@interface RootViewController ()
@property (nonatomic, strong) YXButton *btn_center;
@property (nonatomic, strong) UITextField *display_TF;
@property (nonatomic, strong) NSArray <NSString *> *dataArray;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.btn_center];
    [self.view addSubview:self.display_TF];
}

- (void)btnAction{
    YXItemSelVC *yxItemSelVC = [YXItemSelVC initItemSelVCWithOptionsArray:self.dataArray];
    [yxItemSelVC setTitleStr:@"选择城市"];
    
    if ([self.display_TF hasText]) {
        yxItemSelVC.selectArray = [self.display_TF.text componentsSeparatedByString:@","].mutableCopy;
    }else {
        yxItemSelVC.selectArray = [self.display_TF.placeholder componentsSeparatedByString:@","].mutableCopy;
    }
    yxItemSelVC.selectType = MultipleSelect;
    [yxItemSelVC setItemBlock:^(NSMutableArray *itemArray) {
        NSLog(@"选择的数据：%@",itemArray);
        [self setUIWithData:itemArray];
    }];
    [yxItemSelVC showInController];
}

- (void)setUIWithData:(NSArray *)dataArray {
    NSString *itemName = @"";
    //以逗号隔开
    itemName = [dataArray componentsJoinedByString:@","];
    if (itemName.length>0) {
       self.display_TF.text = itemName;
    }else {
        self.display_TF.text = itemName;
        self.display_TF.placeholder = Placeholder;
    }
    
    
}

#pragma mark - intialize
- (YXButton *)btn_center {
    if (!_btn_center) {
        _btn_center = [[YXButton alloc] initWithType:0 frame:CGRectMake(100, 100, 100, 50) btnTitle:@"点我" color:[UIColor whiteColor] font:[UIFont systemFontOfSize:16] action:@selector(btnAction) target:self];
        [_btn_center setBackgroundColor:[UIColor blackColor]];
    }
    return _btn_center;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSArray arrayWithObjects:@"北京",@"上海",@"广东",@"深圳",@"杭州",@"郑州",@"南京",@"天津", nil];
    }
    return _dataArray;
}

- (UITextField *)display_TF {
    if (!_display_TF) {
        _display_TF = [[UITextField alloc] initWithFrame:CGRectMake(kVIEW_BX(self.btn_center)+10, kView_TY(self.btn_center), SCREEN_WIDTH-kVIEW_BX(self.btn_center)-20, kVIEW_H(self.btn_center))];
        _display_TF.placeholder = Placeholder;
        [_display_TF addBorder:COLOR_BLACK width:1];
        
    }
    return _display_TF;
}


@end
