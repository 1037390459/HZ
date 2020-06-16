//
//  NSObject+NetWorking.m
//  ETracker
//
//  Created by ZhengZhong on 16/5/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NSObject+NetWorking.h"
#import <AFHTTPSessionManager.h>

#define REQUEST_TIME_OUT 15

@implementation NSObject (NetWorking)

+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters progress:(void (^)(NSProgress *))downloadProgress CustomizationManager:(void (^)(AFHTTPSessionManager *manager))customBlock completionHandler:(void (^)(id responseObj, NSError * error))completionHandler HandleError:(BOOL)hanleError {
    NSLog(@"requestInfo:%@--%@",parameters,path);
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    customBlock(manager);
    return [manager POST:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject:%@", responseObject);
        if (hanleError) {
            NSError *error = [self handleServerError:responseObject];
            !completionHandler ?: completionHandler(responseObject[@"centons"], error);
        }else {
            !completionHandler ?: completionHandler(responseObject, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !completionHandler ?: completionHandler(nil, error);
    }];
}

//普通请求
+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters progress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id responseObj, NSError * error))completionHandler {
    return [self POST:path parameters:parameters progress:downloadProgress CustomizationManager:^(AFHTTPSessionManager *manager) {
        manager.requestSerializer.timeoutInterval = REQUEST_TIME_OUT;
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json", nil];
    } completionHandler:completionHandler HandleError:YES];
}

//自定义超时时长(s)
+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters timeOutInterval:(NSInteger)t progress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id responseObj, NSError * error))completionHandler {
    return [self POST:path parameters:parameters progress:downloadProgress CustomizationManager:^(AFHTTPSessionManager *manager) {
        manager.requestSerializer.timeoutInterval = t;
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json", nil];
    } completionHandler:completionHandler HandleError:YES];
}

//自定义解析(接受data)
//+ (id)POST:(NSString *)path BodyData:(NSData *)bodyData CompletionHandler:(void (^)(id responseObj, NSError * error))completionHandler {
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    NSMutableURLRequest *req =[[AFHTTPRequestSerializer serializer]requestWithMethod:@"POST" URLString:path parameters:nil error:nil];
//    req.timeoutInterval= REQUEST_TIME_OUT;
//    [req setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
//    [req setValue:@"application/octet-stream" forHTTPHeaderField:@"Accept"];
//    [req setHTTPBody:bodyData];
//    return [manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        !completionHandler ?: completionHandler(responseObject,error);
//    }];
//}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters data:(NSData *)imageData name:(NSString *)name progress:(void (^)(NSProgress *))uploadProgress completionHandler:(void (^)(id responseObj, NSError * error))completionHandler {
    AFHTTPSessionManager * manager=[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json", nil];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [dateFormatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.png",str];
    return [manager POST:path parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (imageData) {
            [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:@"image/png"];
        }
    } progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = [self handleServerError:responseObject];
        !completionHandler ?: completionHandler(responseObject[@"data"], error);
        NSLog(@"fileName = %@ fileSize:%.2lf",fileName,imageData.length/1024.0);
        NSLog(@"上传成功responseObject=%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !completionHandler ?: completionHandler(nil, error);
    }];
}

+ (NSError *)handleServerError:(id)responseObj{
    NSError *error = nil;
    if ([responseObj[@"code"] integerValue] != SERVER_RESULT_OK) {
        NSString *msg = @"未知错误";
        if (responseObj[@"msg"] != nil) {
            msg = responseObj[@"msg"];
        }
        error = [NSError errorWithDomain:@"xxx" code:[responseObj[@"code"] integerValue] userInfo:@{NSLocalizedDescriptionKey:msg}];
    }
    return error;
}

@end
