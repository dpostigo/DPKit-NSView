@import AppKit;

@interface DisclosureViewController : NSViewController {

    BOOL disclosureIsClosed;
    NSView *_disclosedView;
}

@property IBOutlet NSView *disclosedView;


@property(weak) IBOutlet NSTextField *titleTextField;      // the title of the discloved view
@property(weak) IBOutlet NSButton *disclosureButton;       // the hide/show button
@property(weak) IBOutlet NSView *headerView;               // header/title section of this view controller

@property(strong) NSLayoutConstraint *closingConstraint;   // layout constraint applied to this view controller when closed


- (IBAction) toggleDisclosure: (id) sender;

@end
