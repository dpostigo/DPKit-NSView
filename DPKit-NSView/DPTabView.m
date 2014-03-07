//
// Created by Dani Postigo on 3/3/14.
//

#import "DPTabView.h"

@implementation DPTabView

@synthesize viewDrawingBlock;

- (void) drawRect: (NSRect) dirtyRect {
    //    [super drawRect: dirtyRect];
    if (viewDrawingBlock) {
        viewDrawingBlock(self.bounds);
    }
}


- (BOOL) isOpaque {
    return NO;
}

- (BOOL) isFlipped {
    return YES;
}


@end