//
//  StatusView.h
//  Drop Serve
//
//  Created by TW on 10/10/20.
//  Copyright (c) 2020 TW. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StatusView : NSView {
	IBOutlet NSTextField *_path;
}

- (void)setPath:(NSString *)path;
- (IBAction)stopServer:(id)sender;

@end
