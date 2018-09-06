//
//  QY_AFNetworking.m
//  链式语法
//
//  Created by 黃秋陽 on 2018/9/6.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import "QY_AFNetworking.h"

@interface QY_AFNetworking ()

@property (nonatomic, assign) RequestMethod method;
@property (nonatomic, copy) NSMutableDictionary *params;
@property (nonatomic, copy) NSString *url;

@end

@implementation QY_AFNetworking

- (QY_AFNetworking *(^)(NSString *))getUrl{
    return ^QY_AFNetworking *(NSString *url){
        //block内部即便用_url，实际执行时也是会持有self，所以会提示建议加上self
        _url = url;
        return self;
    };
}
- (QY_AFNetworking *(^)(RequestMethod))getMethod{
    return ^QY_AFNetworking *(RequestMethod method){
        self.method = method;
        return self;
    };
}
- (QY_AFNetworking *(^)(NSMutableDictionary *))getParams{
    return ^QY_AFNetworking *(NSMutableDictionary *params){
        self.params = params;
        return self;
    };
}
- (void)resultWithSuccess:(void (^)(id))success failure:(void (^)(NSError *))failure{
    if (_method == POSTMethod) {
        
        [[AFHTTPSessionManager manager] POST:_url parameters:_params progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }else{
        [[AFHTTPSessionManager manager] GET:_url parameters:_params progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
}

@end
