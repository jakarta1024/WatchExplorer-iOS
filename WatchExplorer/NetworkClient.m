//
//  NetworkClient.m
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

#import "NetworkClient.h"
#import "AFJSONRequestOperation.h"
#import "AFHTTPClient.h"

static NSString * const kAppServiceBaseURLString = @"";
static NSString * const kAppServiceHostString = @"";

typedef void (^RequestSucceedCallbackBlock)(AFHTTPRequestOperation *operation, id responseObject);
typedef void (^RequestFailedCallbackBlock)(AFHTTPRequestOperation *operation, NSError *error);

typedef NS_ENUM(NSInteger, HTTPMethodType) {
    HTTPPostMethod,
    HTTPGetMethod,
    HTTPPutMethod,
    HTTPDeleteMethod
};


@implementation NetworkClient

+(NetworkClient *)sharedInstance
{
    static NetworkClient *__sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedClient = [[NetworkClient alloc] initWithBaseURL:[NSURL URLWithString:kAppServiceBaseURLString ]];
    });
    return __sharedClient;
}

-(id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    }
    return self;
}

-(void)sendRequestWithParameters:(id)parameters type:(RequestType)type {
    NSMutableDictionary *reqParameters = [NSMutableDictionary dictionary];
    HTTPMethodType requestMethod = HTTPGetMethod;
    NSString *requestPath = nil;
    switch (type) {
        case RegisterRequest:
        case AddCommentsRequest:
        case LogMessageRequest:
            requestMethod = HTTPPostMethod;
            break;
        case LoginRequest:
        case GetUerProfileRequest:
        case CheckForUpdateRequest:
        case GetCommentsRequest:
        case AddToFavoritesRequest:
        case AddToHistoryRequest:
        case RemoveFromFavoritesRequest:
        case RemoveFromHistoryRequest:
        case ClearHistoryRequest:
        case GetWatchDetailsRequest:
        case GetWatchListRequest:
        case GetStoreDetailsRequest:
        case GetStoreListRequest:
            requestMethod = HTTPGetMethod;
            break;
        case InvalidRequest:
        default:
            break;
    }
    RequestSucceedCallbackBlock succeedCallbackBlock = ^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([self.delegate respondsToSelector:@selector(HTTPClient:didRecieveResponse:forType:)]) {
            [self.delegate HTTPClient:self didRecieveResponse:responseObject forType:type];
        }
    };
    
    RequestFailedCallbackBlock failedCallbackBlock = ^(AFHTTPRequestOperation *operation, NSError *error) {
        if ([self.delegate respondsToSelector:@selector(HTTPClient:didFail:forType:)]) {
            [self.delegate HTTPClient:self didFail:error forType:type];
        }
    };

    switch (requestMethod) {
        case HTTPGetMethod:
        {
            [self getPath:requestPath
               parameters:reqParameters
                  success:succeedCallbackBlock
                  failure:failedCallbackBlock];
        }
            break;
        case HTTPPostMethod:
        {
            [self postPath:requestPath
                parameters:reqParameters
                   success:succeedCallbackBlock
                   failure:failedCallbackBlock];
        
        }
            break;
        case HTTPPutMethod:
        {
            [self putPath:requestPath
               parameters:reqParameters
                  success:succeedCallbackBlock
                  failure:failedCallbackBlock];
        
        }
            break;
        case HTTPDeleteMethod:
        {
            [self deletePath:requestPath
               parameters:reqParameters
                  success:succeedCallbackBlock
                  failure:failedCallbackBlock];
        }
            break;
        default:
            break;
    }
    
}

@end
