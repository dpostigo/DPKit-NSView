//
// Created by Dani Postigo on 3/14/14.
//

#import <Foundation/Foundation.h>

@interface DPDisclosureView : NSView {

    BOOL isClosed;
    NSView *headerView;
    NSView *disclosureView;
}

@property(nonatomic, strong) NSView *headerView;
@property(nonatomic, strong) NSView *disclosureView;
@property(nonatomic) BOOL isClosed;
@end