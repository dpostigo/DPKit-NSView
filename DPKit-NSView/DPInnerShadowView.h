//
// Created by Dani Postigo on 2/2/14.
//

#import <Foundation/Foundation.h>

@interface DPInnerShadowView : NSView {
    NSColor *backgroundColor;
    NSColor *shadowColor;
}

@property(nonatomic, strong) NSColor *backgroundColor;
@property(nonatomic, strong) NSColor *shadowColor;
@end