//
//  QY_AFNetworking.h
//  链式语法
//
//  Created by 黃秋陽 on 2018/9/6.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef NS_ENUM (NSInteger, RequestMethod){
    GETMethod,
    POSTMethod
};

@interface QY_AFNetworking : NSObject

- (QY_AFNetworking *(^)(NSString *))getUrl;
- (QY_AFNetworking *(^)(RequestMethod))getMethod;
- (QY_AFNetworking *(^)(NSMutableDictionary *))getParams;
- (void)resultWithSuccess:(void(^)(id object))success failure:(void(^)(NSError *error))failure;

@end
