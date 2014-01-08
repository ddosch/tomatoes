//
//  Movie.h
//  tomatoes
//
//  Created by Dan Dosch on 1/7/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) UIImage *thumbnail;
@property (nonatomic, strong) UIImage *original;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
