//
//  NSObject+NetWorking.h
//  ETracker
//
//  Created by ZhengZhong on 16/5/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HOST_URL @"http://121.36.35.124:1801"
#define SERVER_RESULT_OK 1 //"Ok"
#define SERVER_ERROR_CODE 3 //参数错误

@interface NSObject (NetWorking)

+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters progress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id responseObj, NSError * error))completionHandler;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters data:(NSData *)imageData name:(NSString *)name progress:(void (^)(NSProgress *))uploadProgress completionHandler:(void (^)(id responseObj, NSError * error))completionHandler;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters timeOutInterval:(NSInteger)t progress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id responseObj, NSError * error))completionHandler;

//自定义解析(接受data)
//+ (id)POST:(NSString *)path BodyData:(NSData *)bodyData CompletionHandler:(void (^)(id responseObj, NSError * error))completionHandler;

@end
