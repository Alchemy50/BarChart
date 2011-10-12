    //
//  BarGraphController.m
//  Test6
//
//  Created by jay canty on 10/11/11.
//  Copyright 2011 A 50. All rights reserved.
//

#import "BarGraphController.h"


@implementation BarGraphController

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
		
		
		GraphGroupObject *ggo = [[GraphGroupObject alloc] init];
		
		
		BarGroupObject *bgo = [[BarGroupObject alloc] init];	
		bgo.barColor = [UIColor redColor];
		bgo.barLabel = @"Scheduled";
		bgo.barValues = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], nil];
		
		[ggo.barGroupObjects addObject:bgo];
		[bgo release];

		
		BarGroupObject *bgo1 = [[BarGroupObject alloc] init];
		
		bgo1.barColor = [UIColor greenColor];
		bgo1.barLabel = @"Actual";
		bgo1.barValues = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithFloat:(-(float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], nil];		
		
		[ggo.barGroupObjects addObject:bgo1];
		[bgo1 release];
		
		BarGroupObject *bgo2 = [[BarGroupObject alloc] init];
		
		bgo2.barColor = [UIColor grayColor];
		bgo2.barLabel = @"Fake";
		bgo2.barValues = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], nil];		
		
		[ggo.barGroupObjects addObject:bgo2];
		[bgo2 release];
		
		
		BarGroupObject *bgo3 = [[BarGroupObject alloc] init];
		
		bgo3.barColor = [UIColor purpleColor];
		bgo3.barLabel = @"Real";
		bgo3.barValues = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], nil];		
		
		[ggo.barGroupObjects addObject:bgo3];
		[bgo3 release];		
	
		ggo.segmentLabels = [[NSArray alloc] initWithObjects:@"Mon", @"Tues", @"Wed", @"Thurs", @"Fri", nil];
		
		ggo.metricLabel = @"ROCKETS TO MARS";
		ggo.lobLabel = @"VIA SPACE";
		
		
		VerticalBarGraphView *verticalBarGraphView = [[VerticalBarGraphView alloc] initWithFrame:CGRectMake(10, 20, 460, 260) andGraphGroupObject:ggo];
		verticalBarGraphView.backgroundColor = [UIColor whiteColor];
		
		
		verticalBarGraphView.graphGroupObject = ggo;
		
		[verticalBarGraphView initialize];
		
		
		[self.view addSubview:verticalBarGraphView];    
	
	
	}
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
