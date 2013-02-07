//
//  ModelController.h
//  Traffic
//
//  Created by Thomas Therrien on 2/1/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (MainMenuViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(MainMenuViewController *)viewController;

@end
