//
//  PJParallaxView.m
//  PJParallaxView
//
//  Created by Pratik on 06/03/17.
//  Copyright © 2017 The10Men. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#import "PJParallaxView.h"

@interface PJParallaxViewCollectionReusableView ()

@property UIScrollView *scrollView;
@property UIView *viewToStretch;

@end

@implementation PJParallaxViewCollectionReusableView

- (void)initializeDefaultSetupWithView:(UIView*)view{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _viewToStretch=view;
    _viewToStretch.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _viewToStretch.contentMode = UIViewContentModeScaleAspectFill;
    [_scrollView addSubview:_viewToStretch];
    [self addSubview:_scrollView];
}

- (void)layoutHeaderViewForScrollViewOffset:(CGPoint)offset{
    CGFloat delta = 0.0f;
    CGRect rect = CGRectMake(0, 0, kScreenWidth, self.frame.size.height);
    delta = fabs(MIN(0.0f, offset.y));
    rect.origin.y -= delta;
    rect.size.height += delta;
    _scrollView.frame = rect;
    self.clipsToBounds = NO;
}

- (void)layoutHeaderViewReverseForScrollViewOffset:(CGPoint)offset{
    CGFloat delta = 0.0f;
    CGRect rect = CGRectMake(0, 0, kScreenWidth, self.frame.size.height);
    delta = fabs(MAX(0.0f, offset.y));
    rect.origin.y += delta;
    rect.size.height -= delta;
    _scrollView.frame = rect;
    if (CGRectGetMinY(_viewToStretch.frame)>0) {
        CGRect frame= _viewToStretch.frame;
        frame.origin.y=0;
        if (CGRectGetHeight(frame)<CGRectGetHeight(_scrollView.frame)) {
            frame.size.height=CGRectGetHeight(_scrollView.frame);
        }
        _viewToStretch.frame=frame;
    }
    self.clipsToBounds = NO;
}
@end

@interface PJParallaxView()

@property UIScrollView *scrollView;
@property UIView *viewToStretch;
@property CGFloat height;

@end

@implementation PJParallaxView

+ (id)pj_parallaxViewForTableViewWithHeight:(CGFloat)height viewToStretch:(UIView*)viewToStretch{
    PJParallaxView *parallaxView=[[PJParallaxView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, height)];
    [parallaxView initializeDefaultSetupWithView:viewToStretch forHeight:height];
    return parallaxView;
}

-(void)initializeDefaultSetupWithView:(UIView*)view forHeight:(CGFloat)height{
    _height=height;
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _viewToStretch=view;
    _viewToStretch.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _viewToStretch.contentMode = UIViewContentModeScaleAspectFill;
    [_scrollView addSubview:_viewToStretch];
    [self addSubview:_scrollView];
}

- (void)layoutHeaderViewForScrollViewOffset:(CGPoint)offset{
    CGFloat delta = 0.0f;
    CGRect rect = CGRectMake(0, 0, kScreenWidth, _height);
    delta = fabs(MIN(0.0f, offset.y));
    rect.origin.y -= delta;
    rect.size.height += delta;
    _scrollView.frame = rect;
    self.clipsToBounds = NO;
}

- (void)layoutHeaderViewReverseForScrollViewOffset:(CGPoint)offset{
    CGFloat delta = 0.0f;
    CGRect rect = CGRectMake(0, 0, kScreenWidth, _height);
    delta = fabs(MAX(0.0f, offset.y));
    rect.origin.y += delta;
    rect.size.height -= delta;
    _scrollView.frame = rect;
    if (CGRectGetMinY(_viewToStretch.frame)>0) {
        CGRect frame= _viewToStretch.frame;
        frame.origin.y=0;
        if (CGRectGetHeight(frame)<CGRectGetHeight(_scrollView.frame)) {
            frame.size.height=CGRectGetHeight(_scrollView.frame);
        }
        _viewToStretch.frame=frame;
    }
    self.clipsToBounds = NO;
}

@end

