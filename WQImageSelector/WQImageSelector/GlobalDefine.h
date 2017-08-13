//
//  GlobalVarlue.h
//  masonryTest
//
//  Created by gong on 16/11/24.
//  Copyright © 2016年 ches. All rights reserved.
//

#ifndef GlobalVarlue_h
#define GlobalVarlue_h

typedef void(^SuccessBlock)(id returnValue);
typedef void(^FailureBlock)(id returnValue);
typedef void(^NetWorkingBlock)(id netState);

#define DBUGLog(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)


//accessToken
#define ACCESSTOKEN @"2.00NofgBD0L1k4pc584f79cc48SKGdD"
//请求公共微博的网络接口
#define REQUESTPUBLICURL @"https://api.weibo.com/2/statuses/public_timeline.json"
#define SOURCE @"source"
#define TOKEN @"access_token"
#define COUNT @"count"
#define STATUSES @"statuses"
#define CREATETIME @"created_at"
#define WEIBOID @"id"
#define WEIBOTEXT @"text"
#define USER @"user"
#define UID @"id"
#define HEADIMAGEURL @"profile_image_url"
#define USERNAME @"screen_name"





//屏幕大小
#define Screen_height   [[UIScreen mainScreen] bounds].size.height
#define Screen_width    [[UIScreen mainScreen] bounds].size.width


#endif /* GlobalVarlue_h */
