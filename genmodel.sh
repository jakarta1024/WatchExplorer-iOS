#!/bin/sh

#  genmodel.sh
#  WatchExplorer
#
#  Created by Kipp Li on 5/18/13.
#  Copyright (c) 2013 Kipp Li. All rights reserved.

#show up current directory
pwd

echo "get into xcode model directory..."
cd ./DataModel/Schema
echo "generating things..."
mogenerator --template-var arc=true -m CachingDataModel.xcdatamodeld/CachingDataModel.xcdatamodel/ -M ../Generated/ -H ../Entities/ --includeh ../CachingDataModel.h