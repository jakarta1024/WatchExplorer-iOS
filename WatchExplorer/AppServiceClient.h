//
//  AppServiceClient.h
//  WatchExplorer
//
//  Created by Kipp Li on 5/18/13.
//  Copyright (c) 2013 Kipp Li. All rights reserved.
//

#import "AFHTTPClient.h"

@interface AppServiceClient : AFHTTPClient

+(AppServiceClient *)sharedClient;

@end
