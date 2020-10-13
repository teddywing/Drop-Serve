//
//  AppDelegate.m
//  Drop Serve
//
//  Created by TW on 10/10/20.
//  Copyright (c) 2020 TW. All rights reserved.
//

#import "AppDelegate.h"

#import "Server.h"

@implementation AppDelegate

- (void)dealloc
{
	[super dealloc];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
{
	return YES;
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
	[Server stop];
}

@end
