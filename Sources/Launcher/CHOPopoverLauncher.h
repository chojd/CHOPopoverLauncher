//
//  CHOPopoverLauncher.h
//  CHOPopoverLauncher
//
//  Created by chojd on 2018/4/12.
//

#import <UIKit/UIKit.h>

#import "CHOPopover.h"

@interface CHOPopoverLauncher : NSObject

@property (nonatomic, assign) NSTimeInterval interval;// default 0.5 second

+ (instancetype)sharedLauncher;

- (BOOL)schedulePopover:(CHOPopover *)popover;

@end
