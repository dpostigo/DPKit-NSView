//
// Created by Dani Postigo on 2/28/14.
//

#import <Foundation/Foundation.h>

@interface DPInsetView : NSView {
    NSShadow *innerGlow;
    CGFloat cornerRadius;
    NSColor *backgroundColor;
    NSShadow *innerShadow;
    NSColor *dropShadowColor;
}

@property(nonatomic, strong) NSColor *backgroundColor;
@property(nonatomic, strong) NSShadow *innerShadow;
@property(nonatomic, strong) NSColor *dropShadowColor;
@end