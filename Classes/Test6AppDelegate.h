//
//  Test6AppDelegate.h
//  Test6
//
//  Created by user on 8/7/11.
//  Copyright 2011 j. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Circle.h"
#import "VerticalBarGraphView.h"
#import "BarGraphController.h"

@interface Test6AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	BarGraphController *bgc;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BarGraphController *bgc;

@end

