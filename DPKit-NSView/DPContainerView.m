//
// Created by Dani Postigo on 3/9/14.
//

#import "DPContainerView.h"
#import "NSView+NewConstraint.h"

@implementation DPContainerView

@synthesize controllerClassString;

@synthesize isFlipped;

- (void) awakeFromNib {
    [super awakeFromNib];

    if (self.controllerClass) {
        NSViewController *controller = [[self.controllerClass alloc] init];
        controller.view.frame = self.bounds;
        [self addSubview: controller.view];
        [controller.view superConstrainEdges: 0];


    }
}

- (Class) controllerClass {
    return self.controllerClassString ? NSClassFromString(self.controllerClassString) : nil;
}

- (BOOL) isFlipped {
    return isFlipped;
}


@end