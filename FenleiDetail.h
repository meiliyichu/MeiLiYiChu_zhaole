//
//  FenleiDetail.h
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FenleiDetail : NSObject

@property (nonatomic,retain)NSString *pic_url;
@property (nonatomic,retain)NSString *taobao_title;
+(FenleiDetail *)parseWaterMessageWithDict:(NSDictionary *)dict;

@end
