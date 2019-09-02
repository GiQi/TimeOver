//
//  RJButtonAdd.h
//  RJLoginDemo
//
//  Created by Apple on 2019/8/26.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJButtonAdd : NSObject
@property(strong,nonatomic)UIViewController *RJVC;

@property (strong, nonatomic) IBOutlet id delegate;
/**
 用于存取创建的按钮
 */
@property (strong, nonatomic) NSMutableArray *btnAry;

/**
 自定义第三方登录背景界面
 */
-(void)setView:(UIViewController *)viewC andBackgroundImg:(NSString *)img setRect:(CGRect)rect;
/**
 设置条款视图
 */
-(void)setProvisionView:(UIViewController *)viewC;

/**
 在第三方登录界面添加多个按钮 img个数为按钮个数
 
 */

//-(void)setBtnImg:(NSArray *)img setAction:(SEL)action;
/**
 在目标view添加一个按钮
 @pragma view 目标view
 @pragma rect 大小位置
 @pragma img 按钮图片
 @pragma action 添加按钮点击事件

 */
-(void)addView:(UIView*)view setMark:(CGRect)rect setImageNamed:(NSString *)img addAction:(SEL)action;
@end


NS_ASSUME_NONNULL_END
