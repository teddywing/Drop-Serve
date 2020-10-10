//
//  Server.h
//  Drop Serve
//
//  Created by TW on 10/10/20.
//  Copyright (c) 2020 TW. All rights reserved.
//

#import <Foundation/Foundation.h>

NSTask *_process;

@interface Server : NSObject

+ (void)serveAtPath:(NSString *)path;
+ (void)stop;

@end
