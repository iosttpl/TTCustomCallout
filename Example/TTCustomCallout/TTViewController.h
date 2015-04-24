//
//  TTViewController.h
//  TTCustomCallout
//
//  Created by TTPL on 04/22/2015.
//  Copyright (c) 2014 TTPL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TTViewController : UIViewController<MKMapViewDelegate>


@property (weak, nonatomic) IBOutlet MKMapView *mapView;



@end
