//
//  BarGraphView.m
//  UNHC
//
//  Created by Josh Klobe on 5/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "VerticalBarGraphView.h"
#import "UnitMetricObject.h"
#import "BarGroupObject.h"



static int xAxes = 5;

@implementation VerticalBarGraphView

@synthesize actualColor, budgetColor, forecastColor, valuesArray, colorsArray, graphGroupObject;
@synthesize  metricLabel, lobLabel, actualBoxView,  budgetBoxView;

- (id)initWithFrame:(CGRect)frame andGraphGroupObject:(GraphGroupObject*) ggo {

    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor clearColor];

		self.graphGroupObject = ggo;

		NSString *metricString = self.graphGroupObject.metricLabel;
		UIFont *metricLabelFont = [UIFont boldSystemFontOfSize:(self.frame.size.width/35 /* 9 for 460 width */)];		
		
		self.metricLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width * .02, self.frame.size.height * .02, [metricString sizeWithFont:metricLabelFont].width, [metricString sizeWithFont:metricLabelFont].height)];
		self.metricLabel.backgroundColor = [UIColor clearColor];
		self.metricLabel.textColor = [UIColor blackColor];
		self.metricLabel.font = metricLabelFont;
		//self.metricLabel.text = metricString;
		self.metricLabel.text = self.graphGroupObject.metricLabel;
		
		[self addSubview:self.metricLabel];
		
		
		NSString *lobString = self.graphGroupObject.lobLabel;
		UIFont *lobLabelFont = [UIFont systemFontOfSize:(self.frame.size.width/51 /* 9 for 460 width */)];		
		
		self.lobLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.metricLabel.frame.origin.x + self.metricLabel.frame.size.width + (self.frame.size.width/153 /* 3 for 460 width */), self.metricLabel.frame.origin.y, [lobString sizeWithFont:lobLabelFont].width, [metricString sizeWithFont:metricLabelFont].height)];
		self.lobLabel.backgroundColor = [UIColor clearColor];
		self.lobLabel.textColor = [UIColor darkGrayColor];
		lobLabel.font = lobLabelFont;
		lobLabel.textAlignment = UITextAlignmentLeft;
		//self.lobLabel.text = lobString;
		self.lobLabel.text = self.graphGroupObject.lobLabel;
		
		[self addSubview:lobLabel];
				
		float totalWidth = 0;
		float startX = 0;

		
		// add legend labels		
		for (int i=0; i<[graphGroupObject.barGroupObjects count]; i++)
		{			
			
			
			// Need to invert the array (writing like in arabic) ensures left most bar = left most legend
			BarGroupObject *bgo = [graphGroupObject.barGroupObjects objectAtIndex:[graphGroupObject.barGroupObjects count] - i - 1];
			
			
			NSString *labelString = bgo.barLabel;			
			UIFont *labelStringFont = [UIFont systemFontOfSize:(self.frame.size.width/51 /* 9 for 460 width */)];
			
			if (i>0)
				totalWidth += [labelString sizeWithFont:labelStringFont].width + (self.frame.size.width/35 /* 13 for 460 width */) + (self.frame.size.width/77 /* 6 for 460 width */);
			else 
				startX = [labelString sizeWithFont:labelStringFont].width + (self.frame.size.width/77 /* 6 for 460 width */);
			
			UILabel *legendTextLabel =  [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - startX - totalWidth, self.frame.size.height * .02, [labelString sizeWithFont:labelStringFont].width, [labelString sizeWithFont:metricLabelFont].height)];
			legendTextLabel.backgroundColor = [UIColor clearColor];
			legendTextLabel.textColor = lobLabel.textColor;
			legendTextLabel.font = labelStringFont;
			legendTextLabel.text = labelString;
			[self addSubview:legendTextLabel];
			[legendTextLabel release];
			[labelString release];
			
			UIView *labelColorBoxView = [[UIView alloc] initWithFrame:CGRectMake(legendTextLabel.frame.origin.x - (self.frame.size.width/35 /* 13 for 460 width */) - (self.frame.size.width/153 /* 3 for 460 width */), legendTextLabel.frame.origin.y + 4, (self.frame.size.width/35 /* 13 for 460 width */), (self.frame.size.width/115 /* 4 for 460 width */))];
			labelColorBoxView.backgroundColor = bgo.barColor;
			[self addSubview:labelColorBoxView];
			[labelColorBoxView release];
			
		}	
			
    }
    return self;
}

-(void)initialize
{	
	
	
	//NSLog(@"Jay values array:  %@", valuesArray);
	if (graphGroupObject != nil)
	{
		
		float maxValue = 0.0;
		float minValue = 100000000000000;
		
		
		
		// get max and min vals
		for (int i = 0; i < [graphGroupObject.barGroupObjects count]; i++)
		{				
			BarGroupObject *bgo = [graphGroupObject.barGroupObjects objectAtIndex:i]; //values array
			NSArray *ar = bgo.barValues;
			
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

			UILabel *axisLabel = [[UILabel alloc] initWithFrame:CGRectMake(xAxisEnd, axis.frame.origin.y - 7, (self.frame.size.width/7.7 /* 60 for 460 width */), (self.frame.size.width/31 /* 15 for 460 width */))];
//			axisLabel.backgroundColor = [UIColor colorWithRed:218/255.0F green:220/255.0F blue:222/255.0F alpha:1];
			axisLabel.backgroundColor = [UIColor clearColor];
			axisLabel.textColor = [UIColor blackColor];
			axisLabel.textAlignment = UITextAlignmentRight;
			axisLabel.text = [axisNumFormatter stringFromNumber:[NSNumber numberWithFloat:value]];
			axisLabel.font = [UIFont systemFontOfSize:(self.frame.size.width/38 /* 12 for 460 width */)];
			if (!isnan(value))
				[self addSubview:axisLabel];
			
			[axisLabel release];
		}
		
				
		float monthWidth = (xAxisEnd - xAxisStart) / [graphGroupObject.segmentLabels count];
		
		float barPadding = monthWidth/30;
		
		float barsWidth = monthWidth - barPadding * 2;
		
		float barWidth = barsWidth / [graphGroupObject.barGroupObjects count];
		
		NSLog(@"Jay segValues:  %d", [graphGroupObject.segmentLabels count]);
		
		
		for (int i = 0; i < [graphGroupObject.segmentLabels count]; i++)
		{
			
			NSString *key = [graphGroupObject.segmentLabels objectAtIndex:i]; 
			
			
			// set x-axis/segment label
			
			UILabel *monthLabel = [[UILabel alloc] initWithFrame:CGRectMake(i * monthWidth + xAxisStart, xAxisYBottom , monthWidth, 15)];
			monthLabel.backgroundColor = [UIColor clearColor];
			monthLabel.textColor = [UIColor blackColor];
			monthLabel.font = [UIFont systemFontOfSize:(self.frame.size.width/46 /* 10 for 460 width */)];
			monthLabel.textAlignment = UITextAlignmentCenter;
			NSString *keyString = key;
			keyString = [keyString stringByReplacingOccurrencesOfString:@"(" withString:@""];
			keyString = [keyString stringByReplacingOccurrencesOfString:@")" withString:@""];					 
			monthLabel.text = [keyString uppercaseString];
			[self addSubview:monthLabel];
			[monthLabel release];		
			
			
			for (int j = 0; j < [graphGroupObject.barGroupObjects count]; j++)
			{

				BarGroupObject *bgo = [graphGroupObject.barGroupObjects objectAtIndex:j];
				
				
				UIView *view0 = [[UIView alloc] initWithFrame:CGRectMake(monthLabel.frame.origin.x + barPadding + (barWidth * j), xAxisYBottom, barWidth, 0)];
				
				if (![[bgo.barValues objectAtIndex:i] isKindOfClass:[NSNull class]] )
				{
					
					
					
					view0.backgroundColor = [[graphGroupObject.barGroupObjects objectAtIndex:j] barColor];   //actualColor;
					[self addSubview:view0];
				
					float realValue = [[bgo.barValues objectAtIndex:i] floatValue];
				
					//NSLog(@"Jay realValue:  %f", realValue);
					
					//float realValue = [[ar objectAtIndex:j] floatValue];
					float resizedValue = fabsf(minValue) + realValue;			
					float pctOfTotal = resizedValue / total;
					
					if (minValue > 0)
					{
						float totalDiff = maxValue - minValue;				
						float thisDiff = fabsf(minValue - realValue);
						pctOfTotal = thisDiff / totalDiff;
						
					}
					float y0 = xAxisYBottom - (pctOfTotal * viewSpace);
				
					NSLog(@"Jay realValue:  %f", y0);
					
					if (!isnan(y0) && !isinf(y0))  
						if ([[bgo.barValues objectAtIndex:0] intValue] != 0.0)
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
