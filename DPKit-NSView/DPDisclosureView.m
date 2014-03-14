//
// Created by Dani Postigo on 3/14/14.
//

#import "DPDisclosureView.h"
#import "DisclosureViewController.h"

@implementation DPDisclosureView

@synthesize headerView;
@synthesize disclosureView;

@synthesize isClosed;

- (id) initWithFrame: (NSRect) frameRect {
    //    NSString *string = @"DiclosureViewController";
    DisclosureViewController *controller = [[DisclosureViewController alloc] init];
    self = controller.view;
    self.frame = frameRect;
    return self;
}
//
//
//- (void) awakeFromNib {
//    [super awakeFromNib];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//
//    self.translatesAutoresizingMaskIntoConstraints = NO;
//    NSLog(@"self.frame = %@", NSStringFromRect(self.frame));
//
//    DPRowView *row = [[DPRowView alloc] initWithFrame: self.bounds];
//    row.height = 20;
//
//    headerView = row;
//    [self addSubview: headerView];
//    [headerView superConstrainEdgesH];
//
//    //    headerView = [[NSView alloc] initWithFrame: self.bounds];
//    //    headerView.translatesAutoresizingMaskIntoConstraints = NO;
//    //    headerView.height = 20;
//    //    [self addSubview: headerView];
//
//    self.disclosureView = [[DPRowView alloc] init];
//}
//
//
//- (void) setDisclosureView: (NSView *) disclosureView1 {
//    if (disclosureView != disclosureView1) {
//
//        if (disclosureView && disclosureView.superview) {
//            [disclosureView removeFromSuperview];
//        }
//
//        disclosureView = disclosureView1;
//        disclosureView.translatesAutoresizingMaskIntoConstraints = NO;
//
//        [self addSubview: disclosureView];
//
//        // we want a white background to distinguish between the
//        // header portion of this view controller containing the hide/show button
//        //
//        //        self.disclosedView.wantsLayer = YES;
//        //        self.disclosedView.layer.backgroundColor = [[NSColor whiteColor] CGColor];
//
//        [self addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[disclosureView]|"
//                options: 0
//                metrics: nil
//                views: NSDictionaryOfVariableBindings(disclosureView)]];
//        [self addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:[headerView][disclosureView]"
//                options: 0
//                metrics: nil
//                views: NSDictionaryOfVariableBindings(headerView, disclosureView)]];
//
//        // add an optional constraint (but with a priority stronger than a drag), that the disclosing view
//        [self addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:[disclosureView]-(0@600)-|"
//                options: 0 metrics: nil
//                views: NSDictionaryOfVariableBindings(disclosureView)]];
//    }
//}

@end