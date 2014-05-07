//
//  ViewController.m
//  ScaleInTextAnimation
//
//  Created by Adithya H Bhat on 07/05/14.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>
#import "CATextLayer+Animations.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self performScaleInAnimationOnMessageString:@"Hello"];
}

- (IBAction)animateInText:(id)sender
{
    [self performScaleInAnimationOnMessageString:@"Hello"];
}

- (void)performScaleInAnimationOnMessageString:(NSString*)messageString
{
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self.view addSubview:backgroundView];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.font = (CTFontRef)@"Helvetica-Bold";
    textLayer.fontSize = 35.0f;
    [[backgroundView layer] addSublayer:textLayer];
    
    [textLayer animateString:messageString
                withDuration:0.8f
                  atPosition:[self.view.layer position]
                   fromValue:10.0f
                     toValue:140.0f
       withCompletionHandler:^{
           [UIView animateWithDuration:0.5f animations:^{
               backgroundView.alpha = 0.0;
               [textLayer removeFromSuperlayer];
           } completion:^(BOOL finished) {
               [backgroundView removeFromSuperview];
           }];
       }];
}

@end
