//
//  GraphGroupObject.m
//  Test6
//
//  Created by jay canty on 10/12/11.
//  Copyright 2011 A 50. All rights reserved.
//

#import "GraphGroupObject.h"


@implementation GraphGroupObject


@synthesize  metricLabel, lobLabel, segmentLabels, barGroupObjects, xAxes, metricType;


- (id)init {
	
	barGroupObjects = [[NSMutableArray alloc] init];
	segmentLabels = [[NSMutableArray alloc] init];

	return self;
}

@end
