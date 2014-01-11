//
//  MovieListViewController.m
//  tomatoes
//
//  Created by Dan Dosch on 1/7/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieViewController.h"
#import "MovieCell.h"
#import "Movie.h"
#import "UIImageView+AFNetworking.h"

@interface MovieListViewController ()

@property (nonatomic, strong) NSArray *movies;
@property (weak, nonatomic) IBOutlet UILabel *cellTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellSynopsisLabel;

@end

@implementation MovieListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.movies = [NSArray array];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", object);
            
            self.movies = [object valueForKeyPath:@"movies"];
            [self.tableView reloadData];
        }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Movie *movie = [[Movie alloc] initWithDictionary:[self.movies objectAtIndex:indexPath.row]];
    cell.movieTitleLabel.text = movie.title;
    cell.synopsisLabel.text = movie.synopsis;
    cell.ratingLabel.text = movie.rating;
    [cell.thumbnailView setImageWithURL:movie.thumbnail];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
    NSLog(@"Movies: %d", self.movies.count);
    NSLog(@"SelectedRow: %d", selectedRowIndex.row);
    Movie *movie = [[Movie alloc] initWithDictionary:[self.movies objectAtIndex:selectedRowIndex.row]];
    NSLog(@"Movie: %@", movie);
    MovieViewController *movieView = [segue destinationViewController];
    movieView.movie = movie;
}

@end
