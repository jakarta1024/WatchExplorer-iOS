//
//  ShopAnnotation.h
//  Watch
//
//  Created by scnfex on 12/25/12.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ShopAnnotation : NSObject<MKAnnotation> {
    NSString *_name;
    NSString *_address;
    CLLocationCoordinate2D _coordinate;
}

@property (copy) NSString *name;
@property (copy) NSString *address;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;

@end
