//
//  CustomClass.m
//  MKannonotation
//
//  Created by Madhura Shettar on 3/26/15.
//  Copyright (c) 2015 Madhura Shettar. All rights reserved.
//

#import "PinAnnotation.h"

@implementation PinAnnotation


-(MKAnnotationView *)annotationView {
    
    MKAnnotationView *myannotationview = [[MKAnnotationView alloc ]initWithAnnotation:self reuseIdentifier:@"MyCustom Class"];
    
    myannotationview.enabled =YES;
    myannotationview.image = [UIImage imageNamed:@"343x259.jpg"];
    //myannotationview.canShowCallout = YES;
  // myannotationview.rightCalloutAccessoryView =[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return myannotationview;
}

@end
