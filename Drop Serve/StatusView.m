//
//  StatusView.m
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
