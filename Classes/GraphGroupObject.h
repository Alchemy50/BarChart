//
//  GraphGroupObject.h
//  Test6
//
//  Created by jay canty on 10/12/11.
//  Copyright 2011 A 50. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GraphGroupObject : NSObject {
	
	
	NSString *metricLabel;
	NSString *lobLabel;
	
	NSMutableArray *segmentLabels;
	NSMutableArray *barGroupObjects;
	

}

@property (nonatomic, retain) NSString *metricLabel;
@property (nonatomic, retain) NSString *lobLabel;
@property (nonatomic, retain) NSMutableArray *segmentLabels;
@property (nonatomic, retain) NSMutableArray *barGroupObjects;


@end
