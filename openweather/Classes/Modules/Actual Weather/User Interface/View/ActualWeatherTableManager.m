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
#import "DetailWeatherViewCell.h"
#import "ActualWeatherHeaderViewCell.h"

static NSString * const ForecastViewCellIdentifier = @"forecastViewCell";
static NSString * const DetailWeatherViewCellIdentifier = @"detailWeatherViewCell";
static NSString * const ActualWeatherHeaderViewCellIdentifier = @"ActualWeatherHeaderViewCell";

@interface ActualWeatherTableManager () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ActualWeather *actualWeatherData;
@property (nonatomic, weak) id <ActualWeatherTableManagerDelegate> delegate;

@end

@implementation ActualWeatherTableManager

- (instancetype)initWithTableView:(UITableView *)tableView andDelegate:(id <ActualWeatherTableManagerDelegate>)delegate  {
    self = [super init];
    
    if (self) {
        _delegate = delegate;
        _tableView = tableView;
        [self setupTableView];
    }
    return self;
}

- (void)setupTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.contentInset = UIEdgeInsetsMake(90, 0, 0, 0);
}


#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return (section == 0) ? 0 : 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return (section == 0) ? 1 : 25;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 25)];
        view.backgroundColor = [UIColor clearColor];
        return view;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 0) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 1)];
        view.backgroundColor = [UIColor whiteColor];
        return view;
    }
    
    if (section == 1) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 25)];
        view.backgroundColor = [UIColor clearColor];
        return view;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (section == 0) ? [self.actualWeatherData.forecast count] : [self.actualWeatherData.detail count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 50;
    } else {
        return 25;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier;
    
    if (indexPath.section == 0) {
        cellIdentifier = ForecastViewCellIdentifier;
    } else {
        cellIdentifier = DetailWeatherViewCellIdentifier;
    }
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}


#pragma mark - Scrolling

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
   CGFloat dY = (self.tableView.contentInset.top + scrollView.contentOffset.y);
    if (dY > 100) {
        dY = 100;
    }
    [self.delegate updateHeaderWithValue:dY];
}


#pragma mark - Cell Configuration

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    if ([cell isKindOfClass:[ForecastViewCell class]]) {
        [(ForecastViewCell *)cell setupWithForecast:[self.actualWeatherData.forecast objectAtIndex:indexPath.row]];
    }
    
    if ([cell isKindOfClass:[DetailWeatherViewCell class]]) {
        [(DetailWeatherViewCell *)cell setupWithDetailWeather:[self.actualWeatherData.detail objectAtIndex:indexPath.row]];
    }
         
}


#pragma mark - Public Interface

- (void)updateActualWeather:(ActualWeather *)actualWeather {
    self.actualWeatherData = actualWeather;
    
    [self.tableView reloadData];
}

- (void)updateForecast:(NSArray <Forecast *> *)forecast {
    self.actualWeatherData.forecast = forecast;
    
    [self.tableView reloadData];
}


@end
