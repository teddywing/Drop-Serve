//
//  Server.m
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

#import "Server.h"

@implementation Server

+ (void)serveAtPath:(NSString *)path
{
	[self stop];

	_process = [[NSTask alloc] init];
	[_process setCurrentDirectoryPath:path];
	[_process setLaunchPath:@"/usr/bin/python"];
	[_process setArguments:[NSArray arrayWithObjects:
		@"-m",
		@"SimpleHTTPServer",
		nil]];

	NSLog(@"%@", _process);

	[_process launch];
}

+ (void)stop
{
	if ([_process isRunning]) {
		[_process terminate];
	}

	[_process dealloc];
}

+ (void)openInBrowser
{
	[[NSWorkspace sharedWorkspace]
		openURL:[NSURL URLWithString:@"http://localhost:8000"]];
}

@end
