//
// Created by Dani Postigo on 3/9/14.
//

#import <Foundation/Foundation.h>

@interface DPContainerView : NSView {

    NSViewController *controller;
    NSString *controllerClassString;
    BOOL isFlipped;
}

@property(nonatomic, copy) NSString *controllerClassString;
@property(nonatomic) BOOL isFlipped;
@property(nonatomic, strong) NSViewController *controller;
@end