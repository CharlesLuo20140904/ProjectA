//
//  GlobalDateFormatter.h
//  ProjectA
//
//  Created by 罗兆熙 on 2019/9/3.
//  Copyright © 2019 罗兆熙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GlobalDateFormatter : NSObject

// init
+(NSDateFormatter *)shareGlobalDateFormatter;

@end

NS_ASSUME_NONNULL_END
