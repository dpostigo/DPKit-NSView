//
// Created by Dani Postigo on 1/27/14.
//

#import "DPLinedView.h"

@implementation DPLinedView

@synthesize lineColor;
@synthesize spacing;

@synthesize lineWidth;

- (id) init {
    self = [super init];
    if (self) {

        lineWidth = 0.25;
        spacing = 2;
    }

    return self;
}


- (NSColor *) lineColor {
    if (lineColor == nil) {
        lineColor = [NSColor blackColor];
    }
    return lineColor;
}


- (void) drawRect: (NSRect) dirtyRect {
    [[NSColor clearColor] set];
    NSRectFill(self.bounds);

    NSPoint currentPoint;
    NSBezierPath *path = [NSBezierPath bezierPath];

    currentPoint = self.bounds.origin;
    while (currentPoint.y < self.bounds.size.height) {
        [path moveToPoint: currentPoint];
        [path lineToPoint: NSMakePoint(NSMaxX(self.bounds), currentPoint.y)];
        currentPoint.y += spacing;
    }
    [path setLineWidth: self.lineWidth];
    [self.lineColor set];
    [path stroke];

}

- (BOOL) isFlipped {
    return YES;
}


@end