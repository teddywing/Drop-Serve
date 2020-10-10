//
//  DropZone.h
//  Drop Serve
//
//  Created by TW on 10/10/20.
//  Copyright (c) 2020 TW. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "StatusView.h"

@interface DropZone : NSBox <NSDraggingDestination> {
	IBOutlet NSTextField *_label;
	IBOutlet StatusView *_status_view;
}

@end
