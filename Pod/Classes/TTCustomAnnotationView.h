//
//  CustomAnnotationView.h
//  MKannonotation
//
//  Created by Madhura Shettar on 3/27/15.
//  Copyright (c) 2015 Madhura Shettar. All rights reserved.
//

#import <MapKit/MapKit.h>


@interface TTCustomAnnotationView : MKAnnotationView

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier  view:(UIView *)contentView pinHeight:(CGFloat)offset;
@property(strong,nonatomic) MKMapView *myMapView;
-(void)showCalloutView;
-(void)hideCalloutView ;
@end
