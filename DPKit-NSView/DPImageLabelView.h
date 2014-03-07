//
// Created by Dani Postigo on 2/4/14.
//

#import <Foundation/Foundation.h>

@interface DPImageLabelView : NSView {

    NSImageView *imageView;
    NSTextField *textLabel;
    NSTextField *detailTextLabel;

}

@property(nonatomic, strong) NSImageView *imageView;
@property(nonatomic, strong) NSTextField *textLabel;
@property(nonatomic, strong) NSTextField *detailTextLabel;
@end