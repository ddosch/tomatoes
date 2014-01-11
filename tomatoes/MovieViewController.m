//
//  MovieViewController.m
//  tomatoes
//
//  Created by Dan Dosch on 1/7/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"
#import "UIImageView+AFNetworking.h"

@interface MovieViewController ()

@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;

@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self updateValues];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateValues];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateValues {
    self.movieTitleLabel.text = self.movie.title;
    self.yearLabel.text = self.movie.year;
    self.ratingLabel.text = self.movie.rating;
    self.synopsisLabel.text = self.movie.synopsis;
    [self.movieImageView setImageWithURL:self.movie.original];
}

@end
