//
//  CHOPopover.h
//  CHOPopoverLauncher
//
//  Created by chojd on 2018/4/12.
//

#import <Foundation/Foundation.h>

@interface CHOPopover : NSObject

@property (nonatomic, weak) UIViewController *container;// do not set
@property (nonatomic, weak, readonly) UIView *maskView;
@property (nonatomic, readonly) UIView *view;

- (void)viewDidLoad NS_REQUIRES_SUPER;
- (void)viewDidDisappear NS_REQUIRES_SUPER;

- (void)dismissWithAnimation:(BOOL)animated completion:(void(^)(CHOPopover *popover))completion;

@end
