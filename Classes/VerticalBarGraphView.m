//
//  BarGraphView.m
//  UNHC
//
//  Created by Josh Klobe on 5/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "VerticalBarGraphView.h"
#import "UnitMetricObject.h"



static int xAxes = 5;

@implementation VerticalBarGraphView

@synthesize actualColor, budgetColor, forecastColor, valuesArray, colorsArray, graphGroupObject;
@synthesize  metricLabel, lobLabel, actualBoxView,  budgetBoxView;

- (id)initWithFrame:(CGRect)frame {

    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor clearColor];
		
		
		self.actualColor = [UIColor greenColor];
		self.budgetColor = [UIColor redColor];
		self.forecastColor = [UIColor blueColor];
		
		
		
		NSString *metricString = @"REVENUES";
		UIFont *metricLabelFont = [UIFont boldSystemFontOfSize:12];
		
		
		self.metricLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width * .02, self.frame.size.height * .02, [metricString sizeWithFont:metricLabelFont].width, [metricString sizeWithFont:metricLabelFont].height)];
		self.metricLabel.backgroundColor = [UIColor clearColor];
		self.metricLabel.textColor = [UIColor blackColor];
		self.metricLabel.font = metricLabelFont;
		self.metricLabel.text = metricString;
		[self addSubview:self.metricLabel];
		
		
		NSString *lobString = @"LOB";
		UIFont *lobLabelFont = [UIFont systemFontOfSize:9];		
		
		self.lobLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.metricLabel.frame.origin.x + self.metricLabel.frame.size.width + 3, self.metricLabel.frame.origin.y, [metricString sizeWithFont:lobLabelFont].width, [metricString sizeWithFont:metricLabelFont].height)];
		self.lobLabel.backgroundColor = [UIColor clearColor];
		self.lobLabel.textColor = [UIColor darkGrayColor];
		lobLabel.font = lobLabelFont;
		lobLabel.textAlignment = UITextAlignmentLeft;
		self.lobLabel.text = lobString;
		[self addSubview:lobLabel];
		
		NSArray *labels = [[NSArray alloc] initWithObjects:@"ACTUAL", @"BUDGET", @"FORECAST", nil];
		
		float totalWidth = 0;
		float startX = 0;

		
		// add legend labels
		

			
    }
    return self;
}

-(void)initialize
{	
	
	
	//NSLog(@"Jay values array:  %@", valuesArray);
	

	
	
	for (int i=0; i<[labels count]; i++)
	{			
		
		NSString *labelString = [labels objectAtIndex:i];
		
		UIFont *labelStringFont = [UIFont systemFontOfSize:9];
		
		if (i>0)
			totalWidth += [labelString sizeWithFont:labelStringFont].width + 13 + 6;
		else 
			startX = [labelString sizeWithFont:labelStringFont].width + 6;
		
		UILabel *legendTextLabel =  [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - startX - totalWidth, self.frame.size.height * .02, [labelString sizeWithFont:labelStringFont].width, [labelString sizeWithFont:metricLabelFont].height)];
		legendTextLabel.backgroundColor = [UIColor clearColor];
		legendTextLabel.textColor = lobLabel.textColor;
		legendTextLabel.font = labelStringFont;
		legendTextLabel.text = labelString;
		[self addSubview:legendTextLabel];
		[legendTextLabel release];
		[labelString release];
		
		UIView *labelColorBoxView = [[UIView alloc] initWithFrame:CGRectMake(legendTextLabel.frame.origin.x - 13 - 3, legendTextLabel.frame.origin.y + 4, 13, 4)];
		labelColorBoxView.backgroundColor = self.forecastColor;
		[self addSubview:labelColorBoxView];
		[labelColorBoxView release];
		
	}	
	

	
	if ([valuesArray count] > 0)
	{
		
		float maxValue = 0.0;
		float minValue = 100000000000000;
		
		
		
		// get max and min vals
		for (int i = 0; i < [valuesArray count]; i++)
		{				
			NSString *key = [[[valuesArray objectAtIndex:i] allKeys] objectAtIndex:0]; 
			NSArray *ar = [[valuesArray objectAtIndex:i] objectForKey:key];
			
			NSLog(@"Jay key: %@", key);
			NSLog(@"Jay ar: %@", ar);
			
			for (int j = 0; j < [ar count]; j++)
			{
				
				
				if (![[ar objectAtIndex:j] isKindOfClass:[NSNull class]])
				{
					float val = [[ar objectAtIndex:j] floatValue];
					if (val > maxValue)
						maxValue = val;
					if (val < minValue)
						if (val != 0)
							minValue = val;
				}
				
			}
		}
		
		if (minValue == 100000000000000)
			minValue = 0;
		
		minValue = minValue - (fabs(minValue) * .1);		
	

		float xAxisYTop = self.frame.size.height * .14;
		float xAxisYBottom = self.frame.size.height * .91;
		float xAxisStart = self.frame.size.width * .05;
		float xAxisEnd = self.frame.size.width * .85;		  

		
		
		//		Jay need a formater strategy
		NSNumberFormatter *axisNumFormatter = [[NSNumberFormatter alloc] init];
		[axisNumFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
		[axisNumFormatter setMaximumFractionDigits:1];

		

 
	/*	float labelTotal = fabsf(maxValue) + fabsf(minValue);
		if (minValue > 0)
			labelTotal = fabsf(maxValue) - fabsf(minValue);
	*/
		float total = fabsf(maxValue) + fabsf(minValue);
		float viewSpace = xAxisYBottom - xAxisYTop;
		
		
		// sets the y axis on right
		
		for (int i = 0; i <= xAxes; i++)
		{
			
			float separatorDistance = viewSpace / xAxes;
			
			
			UIView *axis = [[UIView alloc] initWithFrame:CGRectMake(xAxisStart, xAxisYBottom - (i * separatorDistance), xAxisEnd - xAxisStart, 1)];
			axis.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.03];
			[self addSubview:axis];
			
			float distancePercentage = (i * separatorDistance) / viewSpace;
			
			float totalDiff = maxValue - minValue;
			//float value = minValue + (total * distancePercentage);				
			float value = minValue + (totalDiff  * distancePercentage);		

			UILabel *axisLabel = [[UILabel alloc] initWithFrame:CGRectMake(xAxisEnd+2.5, axis.frame.origin.y - 7, 60, 15)];
//			axisLabel.backgroundColor = [UIColor colorWithRed:218/255.0F green:220/255.0F blue:222/255.0F alpha:1];
			axisLabel.backgroundColor = [UIColor clearColor];
			axisLabel.textColor = [UIColor blackColor];
			axisLabel.textAlignment = UITextAlignmentRight;
			axisLabel.text = [axisNumFormatter stringFromNumber:[NSNumber numberWithFloat:value]];
			axisLabel.font = [UIFont systemFontOfSize:12];
			if (!isnan(value))
				[self addSubview:axisLabel];
			
			[axisLabel release];
		}
		
		
/////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		
		float monthWidth = (xAxisEnd - xAxisStart) / [valuesArray count];	
				
		float barPadding = monthWidth/9;
		
		float barWidth = monthWidth - barPadding/2;
		
		
		
		
		for (int i = 0; i < [valuesArray count]; i++)
		{
			
			NSString *key = [[[valuesArray objectAtIndex:i] allKeys] objectAtIndex:0]; 
			NSArray *ar = [[valuesArray objectAtIndex:i] objectForKey:key];
			
			
			// set x-axis label
			
			UILabel *monthLabel = [[UILabel alloc] initWithFrame:CGRectMake(i * monthWidth, xAxisYBottom , monthWidth, 15)];
			monthLabel.backgroundColor = [UIColor clearColor];
			monthLabel.textColor = [UIColor blackColor];
			monthLabel.font = [UIFont systemFontOfSize:10];
			monthLabel.textAlignment = UITextAlignmentCenter;
			NSString *keyString = key;
			keyString = [keyString stringByReplacingOccurrencesOfString:@"(" withString:@""];
			keyString = [keyString stringByReplacingOccurrencesOfString:@")" withString:@""];					 
			monthLabel.text = [keyString uppercaseString];
			[self addSubview:monthLabel];
			[monthLabel release];			
			
			
			for (int j = 0; j < [ar count]; j++)
			{
				
				
				UIView *view0 = [[UIView alloc] initWithFrame:CGRectMake(monthLabel.frame.origin.x + barPadding + (barWidth / [ar count] * j), xAxisYBottom, barWidth / [ar count], 0)];

				NSLog(@"ar[%d]: %@", j, [ar objectAtIndex:j]);
				
				if (![[ar objectAtIndex:j] isKindOfClass:[NSNull class]] )
				{
					view0.backgroundColor = [colorsArray objectAtIndex:j];   //actualColor;
					[self addSubview:view0];
					
					float realValue = [[ar objectAtIndex:j] floatValue];
					float resizedValue = fabsf(minValue) + realValue;			
					float pctOfTotal = resizedValue / total;
					
					if (minValue > 0)
					{
						float totalDiff = maxValue - minValue;				
						float thisDiff = fabsf(minValue - realValue);
						pctOfTotal = thisDiff / totalDiff;
						
					}
					float y0 = xAxisYBottom - (pctOfTotal * viewSpace);
					
					if (!isnan(y0) && !isinf(y0))
						if ([[ar objectAtIndex:0] intValue] != 0.0)
						{
							[UIView beginAnimations:nil context:nil]; // begins animation block
							[UIView setAnimationDuration:.75];        // sets animation duration
							[UIView setAnimationDelegate:nil];        // sets delegate for this block		
							view0.frame = CGRectMake(view0.frame.origin.x, y0 , view0.frame.size.width, xAxisYBottom - y0);
							[UIView commitAnimations];   // commits the animation block.  This Block is done.
						}
					
					
				}
				[view0 release];				
				
			}
		}
        [axisNumFormatter release];
	}	

}


- (void)dealloc {
	
	[self.metricLabel release];
	[self.actualColor release];	
	[self.budgetColor release];
	[self.forecastColor release];	
	[self.valuesArray release];
	[self.lobLabel release];	
	[self.actualBoxView release];
	[self.labelColorBoxView release];	
	[self.budgetBoxView release];

	
    [super dealloc];
}


@end
