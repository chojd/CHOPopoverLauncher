//
//  CHOPopoverViewController.m
//  CHOPopoverLauncher
//
//  Created by chojd on 2018/4/12.
//

#import "CHOPopoverViewController.h"

#import "CHOPopover.h"

@interface CHOPopoverViewController ()

@property (nonatomic, strong, readwrite) CHOPopover *popover;

@end

@implementation CHOPopoverViewController

- (instancetype)initWithPopover:(CHOPopover *)popover {
    if (self = [super init]) {
        NSParameterAssert(popover);
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
        self.popover = popover;
        popover.container = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.popover viewDidLoad];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    [self.popover viewDidDisappear];
    __weak typeof(self) weakSelf = self;
    self.viewDidDisappearBlock ? self.viewDidDisappearBlock(weakSelf) : nil;
}

- (void)dealloc {
    
}

@end
