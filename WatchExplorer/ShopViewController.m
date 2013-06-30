//
//  ShopViewController.m
//  Watch
//
//  Created by Bobo on 12-12-18.
//
//

#import "ShopViewController.h"
#import "ShopAnnotation.h"

#define kBtnHeight 70
#define kSearchBarHeight 40

@interface ShopViewController ()

//@property (nonatomic, strong) UIView *titleBar;
//@property (nonatomic, strong) UIButton *searchNearBtn;
//@property (nonatomic, strong) UIButton *searchBandBtn;
@property (nonatomic, strong) MKMapView *map;

//- (void)createBtns;
//- (void)createTitleBar;

@end

@implementation ShopViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = @"搜店";
    
//    [self createTitleBar];
//    [self createBtns];
    
    // search bar
    UIView *searchBgView = [[UIView alloc] initWithFrame:CGRectMake(0, kBtnHeight,
                                                                    kScreenWidth, kSearchBarHeight)];
    searchBgView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:searchBgView];
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:searchBgView.bounds];
    searchBar.barStyle = UIBarStyleBlack;
    searchBar.showsSearchResultsButton = YES;
    [searchBgView addSubview:searchBar];
    searchBar.delegate = self;
    
    // map
    self.map = [[MKMapView alloc] initWithFrame:CGRectMake(0, kBtnHeight + kSearchBarHeight,
                                                           kScreenWidth,
                                                           kScreenHeight - kTitleBarHeight - kBtnHeight - kSearchBarHeight - kTabBarHeight)];
    self.map.delegate = self;
    self.map.showsUserLocation = YES;
    [self.view addSubview:self.map];
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(39.925535, 116.410927);
    self.map.centerCoordinate =location;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(39.925535, 116.410927), 10000, 10000);
    MKCoordinateRegion adjustedRegion = [self.map regionThatFits:viewRegion];
    [self.map setRegion:adjustedRegion animated:YES];
    
    for (int i = 0; i != 5; i++) {
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(39.925535 + arc4random()%5 / 100.0f, 116.410927 + arc4random()%5 / 100.0f);
        ShopAnnotation *annotation = [[ShopAnnotation alloc] initWithName:@"" address:@"" coordinate:coordinate] ;
        [self.map addAnnotation:annotation];
    }

    
    UITabBarItem *nearItem = [[UITabBarItem alloc] initWithTitle:@"按附近"
                                                           image:[UIImage imageNamed:@"icon_near"]
                                                             tag:0];
    UITabBarItem *bandItem = [[UITabBarItem alloc] initWithTitle:@"按品牌"
                                                           image:[UIImage imageNamed:@"icon_band"]
                                                             tag:1];
    UITabBar *tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBtnHeight)];
    [tabBar setItems:@[nearItem, bandItem] animated:NO];
    [self.view addSubview:tabBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark  - UISearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    return NO;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"MyLocation";
    if ([annotation isKindOfClass:[ShopAnnotation class]]) {
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.map dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.image=[UIImage imageNamed:@"icon_location"];//here we use a nice image instead of the default pins
        
        return annotationView;
    }
    
    return nil;
}

@end
