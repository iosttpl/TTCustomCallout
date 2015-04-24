//
//  CustomView.h
//  MKannonotation
//
//  Created by Madhura Shettar on 4/1/15.
//  Copyright (c) 2015 Madhura Shettar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "TTCustomAnnotationView.h"

@interface CallOutAnnotation : NSObject <MKAnnotation>
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, weak) TTCustomAnnotationView *calloutView;

-(id)initWitTitle :(NSString *)mytitle Location :(CLLocationCoordinate2D)mylocation;
-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;
@end
