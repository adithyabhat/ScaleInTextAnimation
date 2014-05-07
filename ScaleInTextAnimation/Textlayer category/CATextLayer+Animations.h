//
//  CATextLayer+Animations.h
//  AudioImage
//
//  Created by Adithya H on 28/05/13.
//  Copyright (c) 2013 Robosoft Technologies. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef void(^completionHandler)(void);

@interface CATextLayer (Animations)

/**
 The function performs scale In animation of the text displayed in the textLayer
 Before calling the funtion, the font and font size for the text in the layer has 
 to be set. Also the layer should be added as a sublayer of some layer.
 
 The arguments fromValue and toValue refer to the zposition of the layer. It can 
 vary from any negetive value to positive value. Best possible would be from 0 to 150;
 
 layerPosition refers to the position property of the layer.
 */

- (void)animateString:(NSString*)messageString
         withDuration:(NSTimeInterval)duration
           atPosition:(CGPoint)layerPosition
            fromValue:(CGFloat)fromValue
              toValue:(CGFloat)toValue
withCompletionHandler:(completionHandler)completionHandler;

@end
