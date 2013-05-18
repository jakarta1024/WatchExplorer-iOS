//
//  WSNetworkRequest.h
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

#import "AFHTTPRequestOperation.h"

typedef NS_ENUM(NSInteger,WSNetworkRequestType ) {
    InvalidRequest = -1,  //Invalid Request
    RegisterRequest, //!\note User or Mobile register request
    LoginRequest, //!\note 
    GetUerProfileRequest,
    CheckForUpdateRequest,
    AddCommentsRequest,
    GetCommentsRequest,
    AddToFavoritesRequest,
    RemoveFromFavoritesRequest,
    AddToHistoryRequest,
    RemoveFromHistoryRequest,
    ClearHistoryRequest,
    LogMessageRequest,
    GetWatchDetailsRequest,
    GetWatchListRequest,
    GetStoreDetailsRequest,
    GetStoreListRequest
};

typedef NS_ENUM(NSInteger, WSNetworkRequestPriorLevel) {
    EmergencyLevel,
    HighLevel,
    NormalLevel,
    LowLevel,
};

@interface WSNetworkRequest : AFHTTPRequestOperation
@property (nonatomic, assign) WSNetworkRequestPriorLevel priorLevel;
@property (nonatomic, assign) WSNetworkRequestType requestType;

@end
