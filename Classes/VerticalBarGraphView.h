//
//  BarGraphView.h
//  UNHC
//
//  Created by Josh Klobe on 5/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphGroupObject.h"


@interface VerticalBarGraphView : UIView {

	NSArray *valuesArray;
	NSArray *colorsArray;
	
	GraphGroupObject *graphGroupObject;

	UIColor *actualColor;
	UIColor *budgetColor;
	UIColor *forecastColor;

	
	UILabel *metricLabel;
	UILabel *lobLabel;
	
	UIView *actualBoxView;
	UIView *budgetBoxView;
}

-(void)initialize;

- (id)initWithFrame:(CGRect)frame andGraphGroupObject:(GraphGroupObject*) ggo;

@property (nonatomic, retain) NSArray *valuesArray;
@property (nonatomic, retain) NSArray *colorsArray;

@property (nonatomic, retain) UIColor *actualColor;
@property (nonatomic, retain) UIColor *budgetColor;
@property (nonatomic, retain) UIColor *forecastColor;

@property (nonatomic, retain) UILabel *metricLabel;
@property (nonatomic, retain) UILabel *lobLabel;

@property (nonatomic, retain) UIView *actualBoxView;
@property (nonatomic, retain) UIView *labelColorBoxView;
@property (nonatomic, retain) UIView *budgetBoxView;

@property (nonatomic, retain) GraphGroupObject *graphGroupObject;

@end
