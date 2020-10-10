//
//  Server.m
//  Drop Serve
//
//  Created by TW on 10/10/20.
//  Copyright (c) 2020 TW. All rights reserved.
//

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
