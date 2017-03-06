//
//  PJParallaxView.h
//  PJParallaxView
//
//  Created by Pratik on 06/03/17.
//  Copyright © 2017 The10Men. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PJParallaxViewCollectionReusableView : UICollectionReusableView

- (void)initializeDefaultSetupWithView:(UIView*)view;
- (void)layoutHeaderViewForScrollViewOffset:(CGPoint)offset;
- (void)layoutHeaderViewReverseForScrollViewOffset:(CGPoint)offset;

@end

@interface PJParallaxView : UIView

+ (id) pj_parallaxViewForTableViewWithHeight:(CGFloat)height viewToStretch:(UIView*)viewToStretch;
- (void)layoutHeaderViewForScrollViewOffset:(CGPoint)offset;
- (void)layoutHeaderViewReverseForScrollViewOffset:(CGPoint)offset;

@end
