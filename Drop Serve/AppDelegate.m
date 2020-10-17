//
//  AppDelegate.m
//  Drop Serve
//
//  Created by TW on 10/10/20.
//  Copyright (c) 2020  Teddy Wing
//
//  This file is part of Drop Serve.
//
//  Drop Serve is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Drop Serve is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with Drop Serve. If not, see <https://www.gnu.org/licenses/>.

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
