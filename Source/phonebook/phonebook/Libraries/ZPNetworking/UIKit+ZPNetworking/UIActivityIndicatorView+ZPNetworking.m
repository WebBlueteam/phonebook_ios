// UIActivityIndicatorView+ZPNetworking.m
//
// Copyright (c) 2013-2014 ZPNetworking (http://zpnetworking.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "UIActivityIndicatorView+ZPNetworking.h"

#if defined(__IPHONE_OS_VERSION_MIN_REQUIRED)

#import "ZPHTTPRequestOperation.h"

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#import "ZPURLSessionManager.h"
#endif

@implementation UIActivityIndicatorView (ZPNetworking)

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
- (void)setAnimatingWithStateOfTask:(NSURLSessionTask *)task {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];

    [notificationCenter removeObserver:self name:ZPNetworkingTaskDidResumeNotification object:nil];
    [notificationCenter removeObserver:self name:ZPNetworkingTaskDidSuspendNotification object:nil];
    [notificationCenter removeObserver:self name:ZPNetworkingTaskDidCompleteNotification object:nil];

    if (task) {
        if (task.state != NSURLSessionTaskStateCompleted) {
            if (task.state == NSURLSessionTaskStateRunning) {
                [self startAnimating];
            } else {
                [self stopAnimating];
            }

            [notificationCenter addObserver:self selector:@selector(zp_startAnimating) name:ZPNetworkingTaskDidResumeNotification object:task];
            [notificationCenter addObserver:self selector:@selector(zp_stopAnimating) name:ZPNetworkingTaskDidCompleteNotification object:task];
            [notificationCenter addObserver:self selector:@selector(zp_stopAnimating) name:ZPNetworkingTaskDidSuspendNotification object:task];
        }
    }
}
#endif

#pragma mark -

- (void)setAnimatingWithStateOfOperation:(ZPURLConnectionOperation *)operation {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];

    [notificationCenter removeObserver:self name:ZPNetworkingOperationDidStartNotification object:nil];
    [notificationCenter removeObserver:self name:ZPNetworkingOperationDidFinishNotification object:nil];

    if (operation) {
        if (![operation isFinished]) {
            if ([operation isExecuting]) {
                [self startAnimating];
            } else {
                [self stopAnimating];
            }

            [notificationCenter addObserver:self selector:@selector(zp_startAnimating) name:ZPNetworkingOperationDidStartNotification object:operation];
            [notificationCenter addObserver:self selector:@selector(zp_stopAnimating) name:ZPNetworkingOperationDidFinishNotification object:operation];
        }
    }
}

#pragma mark -

- (void)zp_startAnimating {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self startAnimating];
    });
}

- (void)zp_stopAnimating {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self stopAnimating];
    });
}

@end

#endif
