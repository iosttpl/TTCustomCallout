//
//  CustomClass.h
//  MKannonotation
//
//  Created by Madhura Shettar on 3/26/15.
//  Copyright (c) 2015 Madhura Shettar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "CallOutAnnotation.h"

@interface PinAnnotation : NSObject<MKAnnotation>
    

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic,strong)CallOutAnnotation *calloutAnnotation;

-(MKAnnotationView *) annotationView;
//-(id)initWitTitle :(NSString *)mytitle Location :(CLLocationCoordinate2D)mylocation;

@end
