//
//  CHOPopover.m
//  CHOPopoverLauncher
//
//  Created by chojd on 2018/4/12.
//

#import "CHOPopover.h"

@interface CHOPopover ()

@property (nonatomic, weak, readwrite) UIView *maskView;

@end

@implementation CHOPopover

#pragma mark - Access
- (UIView *)view {
    return self.container.view;
}

#pragma mark - Public
- (void)viewDidLoad {
    UIView *maskView = [[UIView alloc] initWithFrame:self.view.bounds];
    maskView.backgroundColor = [UIColor blackColor];
    maskView.alpha = 0.5f;
    [self.view addSubview:maskView];
    self.maskView = maskView;
}

- (void)viewDidDisappear {}

- (void)dismissWithAnimation:(BOOL)animated completion:(void(^)(CHOPopover *popover))completion {
    __weak typeof(self) weakSelf = self;
    [self.container dismissViewControllerAnimated:animated completion:^{
        if (weakSelf == nil) { return;}
        __strong typeof(weakSelf) strongSelf = weakSelf;
        completion ? completion(strongSelf) : nil;
    }];
}

@end
