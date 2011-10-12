//
//  Circle.m
//  Test6
//
//  Created by user on 8/7/11.
//  Copyright 2011 j. All rights reserved.
//

#import "Circle.h"


@implementation Circle

@synthesize fColor, sColor, thickness, unitArea;


- (id)initWithFrame:(CGRect)frame withUnitArea:(float)area andFillColor:(UIColor*)fillColor andStrokeColor:(UIColor*)strokeColor withStrokeThickness:(float)thickness {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor redColor];
		
		self.sColor = strokeColor;
		self.fColor = fillColor;
		self.thickness = thickness;
		self.unitArea = area;
				
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.

	CGContextRef contextRef = UIGraphicsGetCurrentContext();
	
	sColor.setStroke;
	fColor.setFill;
	
	CGContextSetLineWidth(contextRef, self.thickness);
	
	float fudgeX = self.frame.size.width - self.thickness - 2;
	float fudgeY = self.frame.size.height - self.thickness - 2;
	
	float diameterX = (fudgeX) * unitArea;
	float diameterY = (fudgeY) * unitArea;
	
	float offsetX = (self.frame.size.width - (self.unitArea * fudgeX)) / 2;	
	float offsetY = (self.frame.size.height - (self.unitArea * fudgeY)) / 2;
	
	CGContextFillEllipseInRect(contextRef, CGRectMake(offsetX, offsetY, diameterX, diameterY));	
	CGContextStrokeEllipseInRect(contextRef, CGRectMake(offsetX, offsetY, diameterX, diameterY));	
	
	
	
}

- (void)dealloc {
    [super dealloc];
}


@end
