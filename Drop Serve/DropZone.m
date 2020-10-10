//
//  DropZone.m
//  Drop Serve
//
//  Created by TW on 10/10/20.
//  Copyright (c) 2020 TW. All rights reserved.
//

#import "DropZone.h"

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
		}

		NSString *file = [files objectAtIndex:0];
		BOOL isDirectory = false;

		if (![[NSFileManager defaultManager]
				fileExistsAtPath:file
				isDirectory:&isDirectory]) {
			NSLog(@"%@ not found", file);

			return NO;
		}

		NSURL *path = [NSURL fileURLWithPath:file isDirectory:isDirectory];

		if (!isDirectory) {
			path = [path URLByDeletingLastPathComponent];
		}

		NSLog(@"%@", path);
    }

    return YES;
}

@end
