//
//  AppServiceClient.m
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

#import "AppServiceClient.h"
#import "AFJSONRequestOperation.h"
#import "AFHTTPClient.h"

static NSString * const kAppServiceBaseURLString = @"";
@implementation AppServiceClient

+(AppServiceClient *)sharedClient
{
    static AppServiceClient *__sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedClient = [[AppServiceClient alloc] initWithBaseURL:[NSURL URLWithString:kAppServiceBaseURLString ]];
    });
    return __sharedClient;
}

-(id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self == nil) {
        return nil;
    }
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    [self setDefaultHeader:@"Accept" value:@"application/json"];

//    if ([[url scheme] isEqualToString:@"https"] && [[url host] isEqualToString:@"www.watchshow.com"]) {
//        [self setDefaultSSLPinningMode:AFSSLPinningModePublicKey];
//    }
    return self;
}
@end
