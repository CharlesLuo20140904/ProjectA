//
//  NSString+Extension.h
//  ProjectA
//
//  Created by 罗兆熙 on 2019/9/3.
//  Copyright © 2019 罗兆熙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

//0.1 正则验证(通用) regex 正则表达式 返回值：验证结果
- (BOOL)regular:(NSString *)regex;

//1.1 验证电话号码
- (BOOL)checkTelephoneNumber;

//1.2 验证身份证
- (BOOL)checkIDCard;

//1.3 验证邮箱
- (BOOL)checkEmail;

//1.4 验证纯数字
- (BOOL)checkJustNumber;

//1.5 验证URL
- (BOOL)checkURL;

//1.6 验证只是汉字
- (BOOL)checkJustChinese;

//1.7 验证只是字母
- (BOOL)checkJustLetter;

//1.8 验证只是小写字母
- (BOOL)checkJustLowercase;

//1.9 验证只是大写字母
- (BOOL)checkCapitalLetter;

//1.10 验证包含特殊字符
- (BOOL)checkContainSpecialCharacter;

//验证密码
- (BOOL)checkPassword;

//正整数
- (BOOL)checkPositiveInteger;

//检测是否最多两位小数
-(BOOL)checkDocForPrice;

//获取宽度
-(CGFloat)getWidthWithSize:(CGSize)size andFont:(UIFont *)font;

//获取高度
-(CGFloat)getHeightWithSize:(CGSize)size andFont:(UIFont *)font;


//根据日期格式输出时间戳
- (NSTimeInterval)getDetailTmeIntervalByDateFormatter:(NSString *)formatterString;

//根据时间戳返回指定时间格式的字符串
- (NSString *)getDateStringByFormat:(NSString *)formatString;

@end


NS_ASSUME_NONNULL_END
