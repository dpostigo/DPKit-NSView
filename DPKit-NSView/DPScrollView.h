//
// Created by Dani Postigo on 2/6/14.
//

#import <Foundation/Foundation.h>

@class DPFlippedView;

@interface DPScrollView : NSScrollView {

    DPFlippedView *flippedView;
}

@property(nonatomic, strong) DPFlippedView *flippedView;
@end