//
//  CHOPopoverViewController.h
//  CHOPopoverLauncher
//
//  Created by chojd on 2018/4/12.
//

#import <UIKit/UIKit.h>

@class CHOPopover;
@interface CHOPopoverViewController : UIViewController

@property (nonatomic, strong, readonly) CHOPopover *popover;
@property (nonatomic, copy) void(^viewDidDisappearBlock)(CHOPopoverViewController *viewpopover);

- (instancetype)initWithPopover:(CHOPopover *)popover;

@end
