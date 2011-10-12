//
//  UnitMetricObject.h
//  UNHC
//
//  Created by Josh Klobe on 8/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UnitMetricObject : NSObject {

	float divisor;
	NSString *metricLabel;
	
}
+(NSString *)getLabelFromDivisor:(float) divisor;

-(id)initUnitMetricFromMaxValue:(float )maxValue;


@property (nonatomic, assign) float divisor;
@property (nonatomic, retain) NSString *metricLabel;

@end
