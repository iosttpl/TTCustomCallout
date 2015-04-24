//
//  CustomView.m
//  MKannonotation
//
//  Created by Madhura Shettar on 4/1/15.
//  Copyright (c) 2015 Madhura Shettar. All rights reserved.
//

#import "CallOutAnnotation.h"

@implementation CallOutAnnotation

@synthesize coordinate;
@synthesize title;

-(id)initWitTitle :(NSString *)mytitle Location :(CLLocationCoordinate2D)mylocation {
    
    self = [super init];
    
    if (self) {
        coordinate = mylocation;
        title = mytitle;

    }
    
    return self;
}
//-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
//    self.coordinate = newCoordinate;
//}
//-(void)setTitle:(NSString *)title {
//    self.title =title;
//}
@end
