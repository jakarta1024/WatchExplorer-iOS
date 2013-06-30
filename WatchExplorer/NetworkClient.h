//
//  NetworkClient.h
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

typedef NS_ENUM(NSInteger,RequestType ) {
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

@class NetworkClient;
@protocol NetworkClientDelegate <NSObject>
@optional
-(void)HTTPClient:(NetworkClient *)client didRecieveResponse:(id)responseData forType:(RequestType)type;
-(void)HTTPClient:(NetworkClient *)client didFail:(NSError *)error forType:(RequestType)type;

@end

@interface NetworkClient : AFHTTPClient

@property (nonatomic, weak)id<NetworkClientDelegate> delegate;

+(NetworkClient *)sharedInstance;

-(void)sendRequestWithParameters:(id) parameters type:(RequestType) type;

@end


