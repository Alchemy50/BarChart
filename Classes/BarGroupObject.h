//
//  BarGroupObject.h
//  Test6
//
//  Created by jay canty on 10/12/11.
//  Copyright 2011 A 50. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BarGroupObject : NSObject {
	
	
	UIColor *barColor;
	NSMutableArray *barValues;
	NSString *barLabel;
	

}


@property (nonatomic, retain) UIColor *barColor;
@property (nonatomic, retain) NSMutableArray *barValues;
@property (nonatomic, retain) NSString *barLabel;

@end
