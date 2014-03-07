//
// Created by Dani Postigo on 2/6/14.
//

#import <NSView-NewConstraints/NSView+NewConstraint.h>
#import "DPScrollView.h"
#import "DPFlippedView.h"

@implementation DPScrollView {
    NSView *_documentView;
}

@synthesize flippedView;

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {
        [self setup];
    }

    return self;
}

- (void) setup {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.drawsBackground = NO;

    flippedView = [[DPFlippedView alloc] init];
    flippedView.translatesAutoresizingMaskIntoConstraints = NO;
    super.documentView = flippedView;

    //    [flippedView superConstrainWidth];
    //    [flippedView superConstrainCenterX];
    //    [flippedView superConstrainTop];
    //    [flippedView setNeedsUpdateConstraints: YES];

    // TODO: Implement the rest of DPScrollView


}

#pragma mark Automatically flip document view

- (void) setDocumentView: (NSView *) aView {
    //    [super setDocumentView: aView];
    _documentView = aView;
}


@end