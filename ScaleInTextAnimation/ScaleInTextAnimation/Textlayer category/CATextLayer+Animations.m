//
//  CATextLayer+Animations.m
//  AudioImage
//
//  Created by Adithya H on 28/05/13.
//  Copyright (c) 2013 Robosoft Technologies. All rights reserved.
//

#import "CATextLayer+Animations.h"

@implementation CATextLayer (Animations)

- (void)animateString:(NSString*)messageString
         withDuration:(NSTimeInterval)duration
           atPosition:(CGPoint)layerPosition
            fromValue:(CGFloat)fromValue
              toValue:(CGFloat)toValue
withCompletionHandler:(completionHandler)completionHandler
{
    CGSize textLayerSize = [messageString sizeWithAttributes:@{NSFontAttributeName : [UIFont fontWithName:self.font size:self.fontSize]}];
    
    self.bounds = (CGRect){.origin = CGPointMake(0.0f, 0.0f), .size = textLayerSize};
    self.position = layerPosition;
    
    self.contentsScale = [[UIScreen mainScreen] scale];

    self.string = messageString;
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0/250;
    [[self superlayer] setSublayerTransform:perspective];
    
    [CATransaction begin];
    {
        [CATransaction setCompletionBlock:completionHandler];
        
        CABasicAnimation *scaleZ = [CABasicAnimation animationWithKeyPath:@"transform.translation.z"];
        scaleZ.fromValue = [NSNumber numberWithFloat:fromValue];
        scaleZ.toValue = [NSNumber numberWithFloat:toValue];
        
        CABasicAnimation *alphaChange = [CABasicAnimation animationWithKeyPath:@"opacity"];
        alphaChange.fromValue = [NSNumber numberWithFloat:1.0f];
        alphaChange.toValue = [NSNumber numberWithFloat:0.0f];
        
        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        animationGroup.animations = [NSArray arrayWithObjects:scaleZ, alphaChange, nil];
        animationGroup.duration = duration;
        animationGroup.removedOnCompletion = NO;
        animationGroup.fillMode = kCAFillModeForwards;
        
        [self addAnimation:animationGroup forKey:@"animateMessageString"];
    }
    [CATransaction commit];
}

@end
