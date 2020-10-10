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
		
		for (int i = 0; i < [files count]; i++) {
			NSString *file = [files objectAtIndex:i];
			BOOL isDirectory = false;

			if ([[NSFileManager defaultManager]
						fileExistsAtPath:file
						isDirectory:&isDirectory]
					&& isDirectory) {
				NSLog(@"%@", file);
				break;
			}
		}
    }
	
    return YES;
}

@end
