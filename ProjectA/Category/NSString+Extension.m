//
//  NSString+Extension.m
//  ProjectA
//
//  Created by 罗兆熙 on 2019/9/3.
//  Copyright © 2019 罗兆熙. All rights reserved.
//

#import "NSString+Extension.h"
#import "GlobalDateFormatter.h"

@implementation NSString (Extension)

//1.0 正则验证(通用) regex 正则表达式 返回值：验证结果
- (BOOL)regular:(NSString *)regex {
    NSPredicate *predicateRe = [NSPredicate predicateWithFormat:@"self matches %@", regex];
    return [predicateRe evaluateWithObject:self];
}

//1.1 验证电话号码
- (BOOL)checkTelephoneNumber {
    NSString *regex = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSPredicate *predicateRe = [NSPredicate predicateWithFormat:@"self matches %@", regex];
    return [predicateRe evaluateWithObject:self];
}

//1.2 验证身份证
- (BOOL)checkIDCard {
    NSString *regex = @"\\d{15}(\\d\\d[0-9xX])?";
    NSPredicate *predicateRe = [NSPredicate predicateWithFormat:@"self matches %@", regex];
    return [predicateRe evaluateWithObject:self];
}

//1.3 验证邮箱
- (BOOL)checkEmail {
    NSString *regex = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    NSPredicate *predicateRe = [NSPredicate predicateWithFormat:@"self matches %@", regex];
    return [predicateRe evaluateWithObject:self];
}

//1.4 验证纯数字
- (BOOL)checkJustNumber {
    NSString *regex = @"^[0-9]+$";
    NSPredicate *predicateRe = [NSPredicate predicateWithFormat:@"self matches %@", regex];
    return [predicateRe evaluateWithObject:self];
}

//1.5 验证URL
- (BOOL)checkURL {
    NSString *regex = @"^http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$";
    NSPredicate *predicateRe = [NSPredicate predicateWithFormat:@"self matches %@", regex];
    return [predicateRe evaluateWithObject:self];
}

//1.6 验证只是汉字
- (BOOL)checkJustChinese {
    NSString *regex = @"^[\u4e00-\u9fa5]+$";
    NSPredicate *predicateRe = [NSPredicate predicateWithFormat:@"self matches %@", regex];
    return [predicateRe evaluateWithObject:self];
}

//1.7 验证只是字母
- (BOOL)checkJustLetter {
    NSString *regex = @"^[A-Za-z]+$";
    NSPredicate *predicateRe = [NSPredicate predicateWithFormat:@"self matches %@", regex];
    return [predicateRe evaluateWithObject:self];
}

//1.8 验证只是小写字母
- (BOOL)checkJustLowercase {
    NSString *regex = @"^[a-z]+$";
    NSPredicate *predicateRe = [NSPredicate predicateWithFormat:@"self matches %@", regex];
    return [predicateRe evaluateWithObject:self];
}

//1.9 验证只是大写字母
- (BOOL)checkCapitalLetter {
    NSString *regex = @"^[A-Z]+$";
    NSPredicate *predicateRe = [NSPredicate predicateWithFormat:@"self matches %@", regex];
    return [predicateRe evaluateWithObject:self];
}

//1.10 验证包含特殊字符
- (BOOL)checkContainSpecialCharacter {
    NSString *regex = @"[~`!@#$%^&*':;\"\?=/<>,\\.\\{\\}\\[\\]\\(\\)]+";
    NSPredicate *predicateRe = [NSPredicate predicateWithFormat:@"self matches %@", regex];
    return [predicateRe evaluateWithObject:self];
}

//
- (BOOL)checkPassword
{
    NSString *regex = @"(^[A-Za-z0-9]{6,16}$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

//1.10 验证包含特殊字符
- (BOOL)checkPositiveInteger {
    NSString *regex = @"^[1-9]d*$";
    NSPredicate *predicateRe = [NSPredicate predicateWithFormat:@"self matches %@", regex];
    return [predicateRe evaluateWithObject:self];
}

//检测是否最多两位小数
-(BOOL)checkDocForPrice{
    NSString *regex = @"^\\-?([1-9]\\d*|0)(\\.\\d{0,2})?$";
    NSPredicate *predicte = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicte evaluateWithObject:self];
}


//获取宽度
-(CGFloat)getWidthWithSize:(CGSize)size andFont:(UIFont *)font {
    CGRect rect = [self boundingRectWithSize:size
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:@{ NSFontAttributeName : font}
                                     context:nil];
    return  rect.size.width;
}

//获取高度
-(CGFloat)getHeightWithSize:(CGSize)size andFont:(UIFont *)font {
    CGRect rect = [self boundingRectWithSize:size
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:@{ NSFontAttributeName : font}
                                     context:nil];
    return  rect.size.height;
}

//MARK: -- 时间字符串处理

//根据日期格式输出时间戳
- (NSTimeInterval)getDetailTmeIntervalByDateFormatter:(NSString *)formatterString
{
    NSDateFormatter *formatter = [GlobalDateFormatter shareGlobalDateFormatter];
    [formatter setDateFormat:formatterString];
    NSDate *date = [formatter dateFromString:self];
    NSTimeInterval interval    = [date timeIntervalSince1970] ;//1000.0;
    return interval;
}

//时间戳转换指定格式字符串
//@param formatString Y-年 M-月 d-d日 H-时 m-分 s-秒 例如：@"Y:M:d h:m:s"、@"Y年M月d日" 
- (NSString *)getDateStringByFormat:(NSString *)formatString
{
    NSTimeInterval interval    = [self doubleValue] ;//1000.0;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [GlobalDateFormatter shareGlobalDateFormatter];
    NSString * tempStr = [formatter stringFromDate: date];
    NSArray <NSString *> *arr = [tempStr componentsSeparatedByString:@" "];
    __block NSString *year = @"";
    __block NSString *month = @"";
    __block NSString *day = @"";
    __block NSString *hour = @"";
    __block NSString *minute = @"";
    __block NSString *second = @"";
    [arr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *dateArr = [obj componentsSeparatedByString:@"-"];
        if (dateArr.count == 3) {
            if (idx == 0) {
                year = dateArr[0];
                month = dateArr[1];
                day = dateArr[2];
            }else{
                hour = dateArr[0];
                minute = dateArr[1];
                second = dateArr[2];
            }
        }else{
            *stop = YES;
        }
        
    }];
    if ([formatString containsString:@"Y"]) {
        formatString = [formatString stringByReplacingOccurrencesOfString:@"Y" withString:year];
    }
    if ([formatString containsString:@"M"]) {
        formatString = [formatString stringByReplacingOccurrencesOfString:@"M" withString:month];
    }
    if ([formatString containsString:@"d"]) {
        formatString = [formatString stringByReplacingOccurrencesOfString:@"d" withString:day];
    }
    if ([formatString containsString:@"H"]) {
        formatString = [formatString stringByReplacingOccurrencesOfString:@"H" withString:hour];
    }
    if ([formatString containsString:@"m"]) {
        formatString = [formatString stringByReplacingOccurrencesOfString:@"m" withString:minute];
    }
    if ([formatString containsString:@"s"]) {
        formatString = [formatString stringByReplacingOccurrencesOfString:@"s" withString:second];
    }
    return formatString;
}


@end

