//
// Created by Dani Postigo on 3/3/14.
//

#import <Foundation/Foundation.h>
#import "DPKitDrawing.h"

@interface DPTabView : NSTabView {
    DPKitDrawingBlock viewDrawingBlock;
}

@property(nonatomic, strong) DPKitDrawingBlock viewDrawingBlock;
@end