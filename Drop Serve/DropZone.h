//
//  DropZone.h
//  Drop Serve
//
//  Created by TW on 10/10/20.
//  Copyright (c) 2020 TW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DropZone : NSBox <NSDraggingDestination> {
	IBOutlet NSTextField *_label;
}

@end
