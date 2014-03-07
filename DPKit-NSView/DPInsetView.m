//
// Created by Dani Postigo on 2/28/14.
//

#import "DPInsetView.h"
#import "NSBezierPath+MCAdditions.h"
#import "NSBezierPath+RoundedCorners.h"

@implementation DPInsetView

@synthesize backgroundColor;
@synthesize innerShadow;
@synthesize dropShadowColor;

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {
        [self setup];
    }

    return self;
}

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {
        [self setup];
    }

    return self;
}


- (void) setup {

    backgroundColor = [NSColor colorWithDeviceWhite: 0.000 alpha: 0.150];
    dropShadowColor = [NSColor colorWithDeviceWhite: 1.000 alpha: 0.100];
    cornerRadius = 5.0;

    innerGlow = [NSShadow new];
    innerGlow.shadowColor = [NSColor colorWithDeviceWhite: 0.0 alpha: 0.3];
    innerGlow.shadowOffset = NSMakeSize(0, 0);
    innerGlow.shadowBlurRadius = 3.0;

    innerShadow = [NSShadow new];
    innerShadow.shadowColor = [NSColor colorWithDeviceWhite: 0.000 alpha: 0.4];
    innerShadow.shadowOffset = NSMakeSize(0, -1);
    innerShadow.shadowBlurRadius = 3.0;

}

- (void) drawRect: (NSRect) dirtyRect {

    NSRect backgroundRect = self.bounds;
    backgroundRect.size.height -= 1.f;

    NSBezierPath *backgroundPath = [NSBezierPath bezierPathWithRoundedRect: backgroundRect radius: cornerRadius];
    [backgroundColor set];
    [backgroundPath fill];
    [backgroundPath fillWithInnerShadow: innerGlow];

    NSRect innerShadowRect = NSInsetRect(backgroundRect, 0.f, 0.f);
    //    innerShadowRect.size.height *= 2.f;
    NSBezierPath *shadowPath = [NSBezierPath bezierPathWithRoundedRect: innerShadowRect radius: cornerRadius];
    [shadowPath fillWithInnerShadow: innerShadow];

    NSRect dropShadowRect = backgroundRect;
    dropShadowRect.origin.y = NSMaxY(self.bounds) - 1.f;
    NSBezierPath *dropShadowPath = [NSBezierPath bezierPathWithRoundedRect: dropShadowRect radius: cornerRadius];
    [dropShadowColor set];
    [dropShadowPath fill];

    //        [NSBezierPath fillRect: dropShadowRect];

    // Draw the text vertically centered
    //    NSSize textSize = [self cellSizeForBounds: self.bounds];
    //    NSRect textRect = NSMakeRect(backgroundRect.origin.x, round(NSMidY(backgroundRect) - (textSize.height / 2.f)) - SNRTextFieldTextVerticalOffset, backgroundRect.size.width, textSize.height);

}


- (BOOL) isOpaque {
    return NO;
}

- (BOOL) isFlipped {
    return YES;
}


@end