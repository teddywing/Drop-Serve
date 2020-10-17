//
//  DropZone.m
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

#import "DropZone.h"
#import "Server.h"

@implementation DropZone

- (id)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self registerForDraggedTypes:[NSArray arrayWithObjects:
			NSFilenamesPboardType, nil]];
	}
	return self;
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
	[_label setStringValue:@""];

	NSPasteboard *pboard;
	NSDragOperation sourceDragMask;

	sourceDragMask = [sender draggingSourceOperationMask];
	pboard = [sender draggingPasteboard];

	if ([[pboard types] containsObject:NSFilenamesPboardType]) {
		return NSDragOperationLink;
	}

	return NSDragOperationNone;
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
	NSPasteboard *pboard;
	NSDragOperation sourceDragMask;

	sourceDragMask = [sender draggingSourceOperationMask];
	pboard = [sender draggingPasteboard];

	if ([[pboard types] containsObject:NSFilenamesPboardType]) {
		NSArray *files = [pboard propertyListForType:NSFilenamesPboardType];

		if ([files count] > 1) {
			[_label setStringValue:@"Please drop a single folder"];

			return NO;
		}

		NSString *file = [files objectAtIndex:0];
		BOOL isDirectory = false;

		if (![[NSFileManager defaultManager]
				fileExistsAtPath:file
				isDirectory:&isDirectory]) {
			NSLog(@"%@ not found", file);

			return NO;
		}

		NSURL *url = [NSURL fileURLWithPath:file isDirectory:isDirectory];

		if (!isDirectory) {
			url = [url URLByDeletingLastPathComponent];
		}

		NSLog(@"%@", url);

		NSString *path = [url path];

		[Server serveAtPath:path];

		[_status_view setPath:path];
		[_status_view setHidden:NO];

		// Sleep to give the server time to start up before opening the page.
		[NSThread sleepForTimeInterval:0.5];
		[Server openInBrowser];
	}

	return YES;
}

@end
