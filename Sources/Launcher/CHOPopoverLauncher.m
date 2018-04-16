//
//  CHOPopoverLauncher.m
//  CHOPopoverLauncher
//
//  Created by chojd on 2018/4/12.
//

#import "CHOPopoverLauncher.h"

#import "CHOPopoverViewController.h"

@interface CHOPopoverLauncher ()

@property (nonatomic, strong) NSMutableArray *popoverQueue;

@property (nonatomic, weak) CHOPopover *currentPopover;

@end

@implementation CHOPopoverLauncher

+ (instancetype)sharedLauncher {
    static CHOPopoverLauncher *_launcher;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _launcher = [[self alloc] init];
    });
    return _launcher;
}

- (instancetype)init {
    if (self = [super init]) {
        self.interval = 0.5;
        self.popoverQueue = [NSMutableArray arrayWithCapacity:10];
    }
    return self;
}

#pragma mark - Public
- (BOOL)schedulePopover:(CHOPopover *)popover {
    NSAssert([NSThread isMainThread], @"plz call on main thread");
    NSParameterAssert(popover);
    if (popover == nil) { return NO;}
    
    [self.popoverQueue addObject:popover];
    
    if (self.currentPopover == nil) {
        [self presentPopover:popover];
        return YES;
    }
    
    return YES;
}

#pragma mark - Private
- (void)presentPopover:(CHOPopover *)popover {
    NSParameterAssert(popover);
    if (popover == nil) { return; }
    
    self.currentPopover = popover;
    
    UIViewController *rootVC = [UIApplication sharedApplication].delegate.window.rootViewController;
    if (rootVC == nil || rootVC.presentedViewController) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self presentPopover:popover];
        });
        return;
    }

    CHOPopoverViewController *popVC = [[CHOPopoverViewController alloc] initWithPopover:popover];
    [popVC setViewDidDisappearBlock:^(CHOPopoverViewController *viewpopover) {
        [self.popoverQueue removeObject:viewpopover.popover];
        self.currentPopover = nil;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (self.popoverQueue.count == 0) {
                return;
            }
            CHOPopover *newPop = [self.popoverQueue firstObject];
            [self presentPopover:newPop];
        });
    }];
    [rootVC presentViewController:popVC animated:NO completion:^{}];
}

@end
