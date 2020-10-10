//
//  StatusView.m
//  Drop Serve
//
//  Created by TW on 10/10/20.
//  Copyright (c) 2020 TW. All rights reserved.
//

#import "StatusView.h"
#import "Server.h"

@implementation StatusView

- (void)setPath:(NSString *)path
{
	[_path setStringValue:path];
}

- (IBAction)stopServer:(id)sender
{
	[Server stop];
	[self setHidden:YES];
}

@end
