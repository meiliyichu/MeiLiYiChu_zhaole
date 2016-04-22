//
//  HttpManager.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface HttpManager : NSObject
+(void)getBannerMessageCompletionBlock:(void (^) (NSMutableArray *bannerArray))block;
+(void)getshowMessageCompletionBlock:(void (^) (NSMutableArray *showArray))block;
+(void)getWaterMeaasgeCompletionBlock:(void (^) (NSMutableArray *waterArray))block;
+(void)getFenleifyMessageCompletionBlock:(void (^) (NSMutableArray *classfyArray))block;
@end
