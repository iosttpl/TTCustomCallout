//
//  TTViewController.m
//  TTCustomCallout
//
//  Created by TTPL on 04/22/2015.
//  Copyright (c) 2014 TTPL. All rights reserved.
//

#import "TTViewController.h"
#import "PinAnnotation.h"
#import "CallOutView.h"
#import "TTCustomAnnotationView.h"
#import "CallOutAnnotation.h"
#define METERS_PER_MILE 1609.344

@interface TTViewController ()
@property (strong,nonatomic) UIView *callOutView;


@end


@implementation TTViewController
//@synthesize myMapView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
    
    
    // CLLocationCoordinate2D bangalore = CLLocationCoordinate2DMake(12.9667 ,77.566);
    PinAnnotation *pin = [[PinAnnotation alloc]init];
    //pin.title = @"jsfsd";
    //pin.subTitle = @"dfdsf";
    pin.coordinate =CLLocationCoordinate2DMake(12.9667, 77.566);
    
    
    // CLLocationCoordinate2D bangalore = CLLocationCoordinate2DMake(12.9667 ,77.566);
    PinAnnotation *pin2 = [[PinAnnotation alloc]init];
    pin2.coordinate =CLLocationCoordinate2DMake(12.1967, 77.768);
    
    
    [self.mapView addAnnotation:pin];
    // [self.mapView addAnnotation:pin2];
    //[self.mapView addSubview:view];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[PinAnnotation class]]) {
        
        
        PinAnnotation  *customannotation = (PinAnnotation *)annotation;
        MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:@"MyCustom Class"];
        
        
        if (view == nil) {
            view  = [customannotation annotationView];
        }
        else
            
            view.annotation =annotation;
        view.canShowCallout =NO;
        return view;
    }
    else if ([annotation isKindOfClass:[CallOutAnnotation class]]) {
        NSString *identifier = @"CallOut";
        
        
        TTCustomAnnotationView *view = (TTCustomAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        //view = CGRectMake(0,0,100,100);
        
        if (view == nil) {
            CallOutView *rootview = [[[NSBundle mainBundle] loadNibNamed:@"CallOutView" owner:self options:nil] objectAtIndex:0];
            UIImage *pinImage = [UIImage imageNamed:@"343x259.jpg"];
            
            view = [[TTCustomAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"CallOut" view:rootview pinHeight:pinImage.size.height];
            
            //myCustomView.coordinate = view.coordinate;
        }
        CallOutAnnotation *calloutAnnotation = (CallOutAnnotation*)annotation;
        calloutAnnotation.calloutView = view;
        view.annotation = calloutAnnotation;
        [view showCalloutView];
        return view;
    }
    return nil;
}


- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
    
    if ([view.annotation isKindOfClass:[PinAnnotation class]]) {
        
        //CustomAnnotationView *mycustomannotation = [[CustomAnnotationView alloc]init];
        
        CallOutAnnotation *calloutannotation = [[CallOutAnnotation alloc]init];
        
        PinAnnotation *pinannotation =(PinAnnotation *)view.annotation;
        calloutannotation.coordinate= pinannotation.coordinate;
        pinannotation.calloutAnnotation = calloutannotation;
        //[mapView addSubview:mycustomannotation];
        [mapView addAnnotation:calloutannotation];
        
    }
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    if ([view.annotation isKindOfClass:[CallOutAnnotation class]])
    {
        CallOutAnnotation *pin = (CallOutAnnotation *)view.annotation;
        [mapView removeAnnotation:pin];
    }
    
    if ([view.annotation isKindOfClass:[PinAnnotation class]])
    {
        PinAnnotation *pin = (PinAnnotation *)view.annotation;
        [pin.calloutAnnotation.calloutView hideCalloutView];
    }
}

@end
