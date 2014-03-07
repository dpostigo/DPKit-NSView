//
// Created by Dani Postigo on 2/2/14.
//

#import <NSColor-BlendingUtils/NSColor+BlendingUtils.h>
#import "DPInnerShadowView.h"

@implementation DPInnerShadowView

@synthesize shadowColor;
@synthesize backgroundColor;

- (NSColor *) backgroundColor {
    if (backgroundColor == nil) {
        backgroundColor = [NSColor clearColor];
    }
    return backgroundColor;
}

- (NSColor *) shadowColor {
    if (shadowColor == nil) {
        shadowColor = [self.backgroundColor darken: 0.9];
    }
    return shadowColor;
}


- (void) drawRect: (NSRect) dirtyRect {

    NSRect bounds = self.bounds;
    NSShadow *shadow = [[NSShadow alloc] init];

    [shadow setShadowBlurRadius: 3.0];
    [shadow setShadowOffset: NSMakeSize(0, -1)];
    [shadow setShadowColor: self.shadowColor];

    [NSGraphicsContext saveGraphicsState];
    [[NSGraphicsContext currentContext] setCompositingOperation: NSCompositeSourceOver];

    //    [shadow set];
    //    [[NSColor clearColor] set];
    //    [path fill];

    //    [shadow set];
    [self.backgroundColor setFill];
    //    [[NSColor grayColor] setStroke];
    NSRectFillUsingOperation(bounds, NSCompositeSourceOver);

    [shadow set];
    [self.shadowColor set];
    NSFrameRectWithWidthUsingOperation(bounds, 1, NSCompositeSourceOver);

    [NSGraphicsContext restoreGraphicsState];

}

@end