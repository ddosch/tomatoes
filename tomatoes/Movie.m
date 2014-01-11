//
//  Movie.m
//  tomatoes
//
//  Created by Dan Dosch on 1/7/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = [dictionary objectForKey:@"title"];
        self.synopsis = [dictionary objectForKey:@"synopsis"];
        self.rating = [dictionary objectForKey:@"mpaa_rating"];
        self.year = [NSString stringWithFormat:@"%d", [[dictionary objectForKey:@"year"] intValue]];
        
        NSDictionary *posters = [dictionary objectForKey:@"posters"];
        
        self.thumbnail = [NSURL URLWithString:[posters objectForKey:@"thumbnail"]];
        self.original = [NSURL URLWithString:[posters objectForKey:@"original"]];
    }
    return self;
}


@end
