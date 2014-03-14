#import "DisclosureViewController.h"

@import QuartzCore;   // for kCAMediaTimingFunctionEaseInEaseOut



#pragma mark -

@implementation DisclosureViewController

- (id) init {
    return [self initWithNibName: @"DisclosureViewController" bundle: nil];
}

- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil {
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self != nil) {
        disclosureIsClosed = NO;
    }
    return self;
}

- (void) awakeFromNib {
    disclosureIsClosed = NO;
}

- (void) setTitle: (NSString *) title {
    [super setTitle: title];
    [self.titleTextField setStringValue: title];
}


#pragma mark Getter / Setter
- (NSView *) disclosedView {
    return _disclosedView;
}

- (void) setDisclosedView: (NSView *) disclosedView {
    if (_disclosedView != disclosedView) {
        [self.disclosedView removeFromSuperview];
        _disclosedView = disclosedView;
        [self.view addSubview: self.disclosedView];

        // we want a white background to distinguish between the
        // header portion of this view controller containing the hide/show button


        self.disclosedView.wantsLayer = YES;
        self.disclosedView.layer.backgroundColor = [[NSColor whiteColor] CGColor];

        [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[_disclosedView]|"
                options: 0
                metrics: nil
                views: NSDictionaryOfVariableBindings(_disclosedView)]];
        [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:[_headerView][_disclosedView]"
                options: 0
                metrics: nil
                views: NSDictionaryOfVariableBindings(_headerView, _disclosedView)]];

        // add an optional constraint (but with a priority stronger than a drag), that the disclosing view
        [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:[_disclosedView]-(0@600)-|"
                options: 0 metrics: nil
                views: NSDictionaryOfVariableBindings(_disclosedView)]];
    }
}

// The hide/show button was clicked
//
- (IBAction) toggleDisclosure: (id) sender {
    if (!disclosureIsClosed) {
        CGFloat distanceFromHeaderToBottom = NSMinY(self.view.bounds) - NSMinY(self.headerView.frame);

        if (!self.closingConstraint) {
            // The closing constraint is going to tie the bottom of the header view to the bottom of the overall disclosure view.
            // Initially, it will be offset by the current distance, but we'll be animating it to 0.
            self.closingConstraint = [NSLayoutConstraint constraintWithItem: self.headerView attribute: NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem: self.view attribute: NSLayoutAttributeBottom multiplier: 1 constant: distanceFromHeaderToBottom];
        }
        self.closingConstraint.constant = distanceFromHeaderToBottom;
        [self.view addConstraint: self.closingConstraint];

        [NSAnimationContext runAnimationGroup: ^(NSAnimationContext *context) {
            context.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
            // Animate the closing constraint to 0, causing the bottom of the header to be flush with the bottom of the overall disclosure view.
            self.closingConstraint.animator.constant = 0;
            self.disclosureButton.title = @"Show";
        } completionHandler: ^{
            disclosureIsClosed = YES;
        }];
    }
    else {
        [NSAnimationContext runAnimationGroup: ^(NSAnimationContext *context) {
            context.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
            // Animate the constraint to fit the disclosed view again
            self.closingConstraint.animator.constant -= self.disclosedView.frame.size.height;
            self.disclosureButton.title = @"Hide";
        } completionHandler: ^{
            // The constraint is no longer needed, we can remove it.
            [self.view removeConstraint: self.closingConstraint];
            disclosureIsClosed = NO;
        }];
    }
}

@end
