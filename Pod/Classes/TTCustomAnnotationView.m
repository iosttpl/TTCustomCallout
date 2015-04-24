//
//  CustomAnnotationView.m
//  MKannonotation
//
//  Created by Madhura Shettar on 3/27/15.
//  Copyright (c) 2015 Madhura Shettar. All rights reserved.
//

#import "TTCustomAnnotationView.h"

@interface TTCustomAnnotationView ()
@property (strong , nonatomic) UIView *callOutView;

@end

@implementation TTCustomAnnotationView

@synthesize myMapView;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// 1. (heigh of callout + gap + pin height /2 ) * 2;

#define kGapBetweenCalloutAndPin 10.0

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier  view:(UIView *)contentView  pinHeight:(CGFloat)offset {
    
    //self =[super init];
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self)  {
        
        self.callOutView =contentView;
        self.callOutView.hidden = YES;
        CGFloat height = (contentView.frame.size.height+kGapBetweenCalloutAndPin+(offset/2.0))*2;
        self.frame = CGRectMake(0, 0, contentView.frame.size.width, height);
        [self roundifyCallout];
        
        //self.frame =CGRectOffset(frame, -2.2, -2.2);
        
        
        [self addSubview:contentView];
    }
    return self;
}

- (void)roundifyCallout {
    self.callOutView.layer.borderWidth = 1.0;
    self.callOutView.layer.borderColor = [UIColor grayColor].CGColor;
    self.callOutView.layer.cornerRadius = 4.0;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    if (touch.view == self.callOutView) {
        if (self.callOutView.isHidden) {
            [self showCalloutView];
        } else {
            [self hideCalloutView];
        }
    } else {
        [self hideCalloutView];
    }
}

-(void)hideCalloutView {
    self.callOutView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    [UIView animateWithDuration:0.1 animations:^{
        self.callOutView.transform = CGAffineTransformMakeScale(0.25, 0.25);
    } completion:^(BOOL finished) {
        self.callOutView.hidden = YES;
    }];
    
}

-(void)showCalloutView {
    if (self.callOutView.isHidden) {
        self.callOutView.transform = CGAffineTransformMakeScale(0.025, 0.25);
        self.callOutView.hidden = NO;
        [UIView animateWithDuration:0.25 animations:^{
            self.callOutView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:nil];
    }
}
@end
