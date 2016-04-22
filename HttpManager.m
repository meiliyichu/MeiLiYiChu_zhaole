//
//  HttpManager.m
//  MeiLiYiChu_zhaole
//
//  Created by 赵乐 on 16-3-12.
//  Copyright (c) 2016年 ZL. All rights reserved.
//

#import "HttpManager.h"
#import "Scollermodel.h"
#import "LingYuan.h"
#import "PuBuLiu.h"
#import "Fenlei.h"
@implementation HttpManager

//获取滑动视图的数据
+(void)getBannerMessageCompletionBlock:(void (^) (NSMutableArray *bannerArray))block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://vapi.yuike.com/1.0/client/banner_list.php?mid=457465&sid=07641edd46c5708f048eab68cef319d6&yk_appid=1&yk_cbv=2.9.3.1&yk_pid=1&yk_user_id=5127897" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dict objectForKey:@"data"];
        NSMutableArray *Array = [NSMutableArray array];
        for (NSDictionary *Dict in array) {
            Scollermodel *scoll = [Scollermodel parseBannerWithDictionary:Dict];
            [Array addObject:scoll];
        }
        
        block(Array);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

//零元数组
+(void)getshowMessageCompletionBlock:(void (^) (NSMutableArray *showArray))block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://vapi.yuike.com/1.0/home/model_list.php?mid=457465&sid=07641edd46c5708f048eab68cef319d6&yk_appid=1&yk_cbv=2.9.3.1&yk_pid=1&yk_user_id=5127897" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dict objectForKey:@"data"];
        NSMutableArray *Array = [NSMutableArray array];
        for (NSDictionary *Dict in array) {
            LingYuan *ling = [LingYuan parseShowMessageWithDictionary:Dict];
            
            [Array addObject:ling];
        }
        
        
        
        block (Array);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

//最底部的瀑布流数组
+(void)getWaterMeaasgeCompletionBlock:(void (^) (NSMutableArray *waterArray))block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://vapi.yuike.com/1.0/product/quality.php?count=40&cursor=0&mid=457465&sid=07641edd46c5708f048eab68cef319d6&type=choice&yk_appid=1&yk_cbv=2.9.3.1&yk_pid=1&yk_user_id=5127897" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dataDict = [dict objectForKey:@"data"];
        NSArray *array = [dataDict objectForKey:@"products"];
        NSMutableArray *Array = [NSMutableArray array];
        for (NSDictionary *productDict in array) {
            PuBuLiu *ppp = [PuBuLiu parseWaterMessageWithDict:productDict];
            [Array addObject:ppp];
        }
        block(Array);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

//分类的数据
+(void)getFenleifyMessageCompletionBlock:(void (^) (NSMutableArray *classfyArray))block{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://vapi.yuike.com/1.0/category/list.php?sid=190119e76b585ecf7343472285ddc97d&yk_pid=3&yk_appid=1&yk_cc=yuikemall&yk_cvc=303&mid=457465" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dict objectForKey:@"data"];
        NSMutableArray *DetailArray = [NSMutableArray array];
        for (NSDictionary *ddd in array) {
            Fenlei *fen = [Fenlei parseWaterMessageWithDict:ddd];
            [DetailArray addObject:fen];
        }
        block(DetailArray);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}



@end
