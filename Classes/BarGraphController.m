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

		NSArray *one = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], nil];	
		NSArray *two = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], nil];	
		NSArray *three = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:-((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], nil];	
		NSArray *four = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:-((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], nil];
		
		
		NSDictionary *d1 = [[NSDictionary alloc] initWithObjectsAndKeys:one, @"Apr", nil];
		NSDictionary *d2 = [[NSDictionary alloc] initWithObjectsAndKeys:two, @"May", nil];
		NSDictionary *d3 = [[NSDictionary alloc] initWithObjectsAndKeys:three, @"Jun", nil];
		NSDictionary *d4 = [[NSDictionary alloc] initWithObjectsAndKeys:four, @"Jul", nil];	
		
		NSArray *data = [[NSArray alloc] initWithObjects:d1, d2, d3, d4, nil];
		
		
		NSArray *colors = [[NSArray alloc] initWithObjects:[UIColor redColor], [UIColor blueColor], [UIColor greenColor], [UIColor lightGrayColor], [UIColor purpleColor], nil];
		
		
		
		// lets load all forcasts
		
		
		BarGroupObject *bgo = [[BarGroupObject alloc] init];
		GraphGroupObject *ggo = [[GraphGroupObject alloc] init];
		
		bgo.barColor = [UIColor redColor];
		bgo.barLabel = @"Scheduled";
		bgo.barValues = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], nil];
		
		[ggo.barGroupObjects addObject:bgo];
		[bgo release];
		
		BarGroupObject *bgo = [[BarGroupObject alloc] init];
		
		bgo.barColor = [UIColor greenColor];
		bgo.barLabel = @"Actual";
		bgo.barValues = [[NSArray alloc] initWithObjects:[[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], [[NSNumber alloc] initWithFloat:((float)(arc4random() % 1000))], nil];		
		
		[ggo.barGroupObjects addObject:bgo];
		[bgo release];
		
		ggo.segmentLabels = [[NSArray alloc] initWithObjects:@"Mon", @"Tues", @"Wed", @"Thurs", @"Fri", nil];
		
		ggo.metricLabel = @"ROCKETS";
		ggo.lobLabel = @"IN TO SPACE";
		
		
		
		
		
		NSLog(@"Jay data: %@", data);
		
		VerticalBarGraphView *verticalBarGraphView = [[VerticalBarGraphView alloc] initWithFrame:CGRectMake(10, 20, 460, 260)];
		verticalBarGraphView.backgroundColor = [UIColor whiteColor];
		
		verticalBarGraphView.valuesArray = data;
		verticalBarGraphView.colorsArray = colors;
		
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
