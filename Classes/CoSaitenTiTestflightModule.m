/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "CoSaitenTiTestflightModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TestFlight.h"

@implementation CoSaitenTiTestflightModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"8beda686-5822-408e-873d-a111c6b94360";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"co.saiten.ti.testflight";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

- (id)addCustomEnvironmentInformation:(id)args
{
  ENSURE_UI_THREAD(addCustomEnvironmentInformation, args);
  
  ENSURE_ARG_COUNT(args, 2)
  id key = [args objectAtIndex:0];
  id info = [args objectAtIndex:1];
  ENSURE_STRING(key);
  ENSURE_STRING(info);
  [TestFlight addCustomEnvironmentInformation:info forKey:key];
  return nil;
}

- (id)setOptions:(id)args
{
  ENSURE_UI_THREAD(setOptions, args);
  
  ENSURE_ARG_COUNT(args, 1);
  id options = [args objectAtIndex:0];
  ENSURE_DICT(options);
  [TestFlight setOptions:options];
  return nil;
}

- (id)takeOff:(id)args
{
  ENSURE_UI_THREAD(takeOff, args);
  
  ENSURE_ARG_COUNT(args, 1);
  id teamToken = [args objectAtIndex:0];
  ENSURE_STRING(teamToken);
  [TestFlight takeOff:teamToken];
  return nil;
}

- (id)openFeedbackView:(id)args
{
  ENSURE_UI_THREAD(openFeedbackView, args);
  
  [TestFlight openFeedbackView];
  return nil;
}

- (id)passCheckpoint:(id)args
{
  ENSURE_UI_THREAD(passCheckpoint, args);
  
  ENSURE_ARG_COUNT(args, 1);
  id checkPoint = [args objectAtIndex:0];
  ENSURE_STRING(checkPoint);
  [TestFlight passCheckpoint:checkPoint];
  return nil;
}

@end
