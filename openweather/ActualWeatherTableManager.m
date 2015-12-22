//
//  ActualWeatherTableManager.m
//  openweather
//
//  Created by Toni on 21/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "ActualWeatherTableManager.h"

#import "ActualWeatherViewController.h"
#import "ActualWeather.h"

#import "ForecastViewCell.h"

@interface ActualWeatherTableManager () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ActualWeatherViewController *viewController;
@property (nonatomic, strong) ActualWeather *actualWeatherData;

@end

@implementation ActualWeatherTableManager

- (instancetype)initWithViewController:(ActualWeatherViewController *)viewController
                             tableView:(UITableView *)tableView  {
    self = [super init];
    
    if (self) {
        _tableView = tableView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _viewController = viewController;
    }
    return self;
}


#pragma mark - TableView Delegate


#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (section==0) ? [self.actualWeatherData.forecast count] : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier;
    if (indexPath.section == 0) {
        cellIdentifier = @"forecastCell";
    } else {
        cellIdentifier = @"actualWeatherCell";
    }
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}


#pragma mark - Cell Configuration

- (void)configureCell:(UITableViewCell *)cell atIndexPath:indexPath {
    
    if ([cell isKindOfClass:[ForecastViewCell class]]) {
        [(ForecastViewCell *)cell setupWithForecast:[self.actualWeatherData.forecast objectAtIndex:[indexPath row]]];
    }
         
}



#pragma mark - Public Interface

- (void)updateActualWeather:(id)actualWeather {
    self.actualWeatherData = actualWeather;
    
    [self.tableView reloadData];
}

- (void)updateForecast:(NSArray *)forecast {
    self.actualWeatherData.forecast = forecast;
    
    [self.tableView reloadData];
}


@end
