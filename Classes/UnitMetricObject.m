//
//  UnitMetricObject.m
//  UNHC
//
//  Created by Josh Klobe on 8/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UnitMetricObject.h"


@implementation UnitMetricObject

@synthesize divisor, metricLabel;



+(NSString *)getLabelFromDivisor:(float) divisor

{
	
	NSString *label = @"";
	

	if (divisor  == 100000000000)
				label = @"$ in billions";
	
	else if (divisor == 10000000000)
		label = @"tens billions";
	
	else if (divisor == 1000000000)
				label = @"billions";
	
	else if (divisor == 100000000)
				label = @"hundreds of millions";
	
	else if (divisor == 10000000)
		label = @"$ in tens millions";
	
	else if (divisor == 1000000)
		label = @"# in millions";
		//label = @"$ in millions";
	
	else if (divisor == 100000)
		label = @"hundreds of thousands";
	
	else if (divisor == 10000)
		label = @"tens of thousands";
	
	else if (divisor == 1000)
		label = @"# in 000s";
	
	
	//if ([[UNHCDataManager sharedDataManager].dataInMetricsArray containsObject:[UNHCReportManager getAppStateObjectValueForKey:APP_STATE_KEY_METRIC]])
	//	label = @"# in 000s";
/*	
	if ([[UNHCDataManager sharedDataManager].globalPercentageRepresentationLookupArray containsObject:[UNHCReportManager getAppStateObjectValueForKey:APP_STATE_KEY_METRIC]])
		label = @"";	
*/	
	return label;
	
}

-(id)initUnitMetricFromMaxValue:(float )maxValue
{
	self = [super init];
	
	self.divisor = 100000000000;
	

	while (maxValue < self.divisor)
		self.divisor = self.divisor / 10;

	
	self.divisor = 1000000;
	self.metricLabel = [UnitMetricObject getLabelFromDivisor:self.divisor];
	

	return self;

	
	
}
@end
