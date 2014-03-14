//
// Created by Dani Postigo on 3/9/14.
//

#import "DPContainerView.h"
#import "NSView+NewConstraint.h"

@implementation DPContainerView

@synthesize controllerClassString;
@synthesize isFlipped;

@synthesize controller;

- (void) awakeFromNib {
    [super awakeFromNib];

    if (self.controllerClass) {
        self.controller = [[self.controllerClass alloc] init];

    }
}


- (void) setController: (NSViewController *) controller1 {
    if (controller != controller1) {
        if (controller && controller.view.superview) {
            [controller.view removeFromSuperview];
        }
        controller = controller1;

        if (controller) {
            //            controller.view.frame = self.bounds;
            controller.view.translatesAutoresizingMaskIntoConstraints = NO;
            [self addSubview: controller.view];
            [controller.view superConstrainEdges: 0];
        }

        [self setNeedsUpdateConstraints: YES];
        [self setNeedsDisplay: YES];
    }
}

- (Class) controllerClass {
    return self.controllerClassString ? NSClassFromString(self.controllerClassString) : nil;
}

- (BOOL) isFlipped {
    return isFlipped;
}


@end