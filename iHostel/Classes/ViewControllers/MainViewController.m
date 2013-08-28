//
//  MainViewController.m
//  iHostel
//
//  Created by long.dang on 8/28/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Define.h"

#define CENTER_TAG 1
#define LEFT_PANEL_TAG 2
#define CORNER_RADIUS 4
#define SLIDE_TIMING .2
#define PANEL_WIDTH 60

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Setup View
- (void)setupView
{
	self.homeViewController = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
	self.homeViewController.view.tag = CENTER_TAG;
	self.homeViewController.delegate = self;
	[self.view addSubview:self.homeViewController.view];
	[self addChildViewController:_homeViewController];
	[_homeViewController didMoveToParentViewController:self];
	
	[self setupGestures];
}

- (void)showCenterViewWithShadow:(BOOL)value withOffset:(double)offset
{
	if (value)
    {
		[_homeViewController.view.layer setCornerRadius:CORNER_RADIUS];
	}
    else
    {
		[_homeViewController.view.layer setCornerRadius:0.0f];
		[_homeViewController.view.layer setShadowOffset:CGSizeMake(offset, offset)];
	}
}

- (void)resetMainView
{
	if (_functionViewController != nil)
    {
		[self.functionViewController.view removeFromSuperview];
		self.functionViewController = nil;
		_homeViewController.slideOutButton.tag = 1;
		self.showingFunctionPanel = NO;
	}
	[self showCenterViewWithShadow:NO withOffset:0];
}

- (UIView *)getFunctionView
{
	// init view if it doesn't already exist
	if (_functionViewController == nil)
	{
		// this is where you define the view for the right panel
		self.functionViewController = [[FunctionViewController alloc] initWithNibName:@"FunctionViewController" bundle:nil];
		self.functionViewController.view.tag = LEFT_PANEL_TAG;
		self.functionViewController.delegate = self;
		
		[self.view addSubview:self.functionViewController.view];
		
		[self addChildViewController:self.functionViewController];
		[_functionViewController didMoveToParentViewController:self];
		
		_functionViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
	}
	self.showingFunctionPanel = YES;
    
	// setup view shadows
	[self showCenterViewWithShadow:YES withOffset:1];
    
	UIView *view = self.functionViewController.view;
	return view;
}

#pragma mark Swipe Gesture Setup/Actions
- (void)setupGestures
{
	UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(movePanel:)];
	[panRecognizer setMinimumNumberOfTouches:1];
	[panRecognizer setMaximumNumberOfTouches:1];
	[panRecognizer setDelegate:self];
	[_homeViewController.view addGestureRecognizer:panRecognizer];
}

- (void)movePanel:(id)sender
{
	[[[(UITapGestureRecognizer*)sender view] layer] removeAllAnimations];
    
	CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];
	CGPoint velocity = [(UIPanGestureRecognizer*)sender velocityInView:[sender view]];
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan)
    {
        UIView *childView = nil;
        
        if(velocity.x < 0) {}
        else
        {
            childView = [self getFunctionView];
            [self.view sendSubviewToBack:childView];
            [[sender view] bringSubviewToFront:[(UIPanGestureRecognizer*)sender view]];
        }
	}
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateChanged)
    {
        if (velocity.x >= 0) {
            _showPanel = abs([sender view].center.x - _homeViewController.view.frame.size.width/2) < 250;
        }
        else {
            _showPanel = abs([sender view].center.x - _homeViewController.view.frame.size.width/2) < 10;
        }
        float x = [sender view].center.x + translatedPoint.x;
        if (x < 160) {
            x = 160;
        }
        else if (x > 420) {
            x = 420;
        }
        [sender view].center = CGPointMake(x, [sender view].center.y);
        [(UIPanGestureRecognizer*)sender setTranslation:CGPointMake(0,0) inView:self.view];
        
        _preVelocity = velocity;
	}
    
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded)
    {
        if (!_showPanel)
        {
            [self movePanelToOriginalPosition];
        }
        else
        {
            if (_showingFunctionPanel)
            {
                [self movePanelRight];
            }
        }
	}
}

#pragma mark Action Delegate
- (void)movePanelRight
{
	UIView *childView = [self getFunctionView];
	[self.view sendSubviewToBack:childView];
    
	[UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations: ^{
        _homeViewController.view.frame = CGRectMake(self.view.frame.size.width - PANEL_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
                     completion:^(BOOL finished)
     {
         if (finished)
         {
             _homeViewController.slideOutButton.tag = 0;
         }
     }];
}

- (void)movePanelToOriginalPosition
{
	[UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _homeViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
                     completion:^(BOOL finished)
     {
         if (finished)
         {
             [self resetMainView];
         }
     }];
}

#pragma mark FunctionViewController Delegate
- (void)actionWithKey:(int)key
{
    switch (key) {
        case kActionHome:
            
            break;
        case kActionHome:
            
            break;
        case kActionHome:
            
            break;
        case kActionHome:
            
            break;
        case kActionHome:
            
            break;
        default:
            break;
    }
}
@end
