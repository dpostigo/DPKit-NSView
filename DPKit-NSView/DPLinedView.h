//
// Created by Dani Postigo on 1/27/14.
//

#import <Foundation/Foundation.h>

@interface DPLinedView : NSView {

    NSColor *lineColor;
    CGFloat lineWidth;
    CGFloat spacing;
}

@property(nonatomic, strong) NSColor *lineColor;
@property(nonatomic) CGFloat spacing;
@property(nonatomic) CGFloat lineWidth;
@end