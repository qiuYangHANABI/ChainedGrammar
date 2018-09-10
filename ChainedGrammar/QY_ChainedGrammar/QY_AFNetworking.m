//
//  QY_AFNetworking.m
//  链式语法
//
//  Created by 黃秋陽 on 2018/9/6.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import "QY_AFNetworking.h"
#import "LMJRequestManager.h"

@interface QY_AFNetworking ()

@property (nonatomic, assign) RequestMethod method;
@property (nonatomic, copy) NSMutableDictionary *params;
@property (nonatomic, copy) NSString *url;

@end

@implementation QY_AFNetworking

/**
 block做返回值，第一层返回是block本身，这个block内部的返回值才是最终的返回值
 */
- (QY_AFNetworking *(^)(NSString *))getUrl{
    return ^QY_AFNetworking *(NSString *url){
        //block内部即便用_url，实际执行时也是会持有self，所以会提示建议加上self
        _url = url;
        //返回调用者本身是实现连续调用block的关键
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
//        这里用的lmj的网络请求封装
        [[LMJRequestManager sharedManager] POST:_url parameters:_params completion:^(LMJBaseResponse *response) {
            if (!response.error && response.responseObject) {
                success(response.responseObject);
            }else{
                failure(response.error);
            }
        }];
    }else{
        [[LMJRequestManager sharedManager] GET:_url parameters:_params completion:^(LMJBaseResponse *response) {
            if (!response.error && response.responseObject) {
                success(response.responseObject);
            }else{
                failure(response.error);
            }
        }];
    }
}

@end
