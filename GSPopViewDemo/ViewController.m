//
//  ViewController.m
//  GSPopViewDemo
//
//  Created by 龚胜 on 16/9/1.
//  Copyright © 2016年 gongsheng. All rights reserved.
//

#import "ViewController.h"
#import "GSPopoverViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) GSPopoverViewController *popView;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showButtonTapped:(UIButton *)sender forEvent:(UIEvent *)event
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.frame = CGRectMake(0, 0, 100, 400);
    vc.view.backgroundColor = [UIColor grayColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelPopViewFromSuperView)];
    [vc.view addGestureRecognizer:tap];
    
    //    self.popView = [[GSPopoverViewController alloc] initWithViewController:vc];
    
    self.popView = [[GSPopoverViewController alloc] init];
    self.popView.viewController = vc;
    
    //    self.popView.offSet = -20;
    
    //    self.popView.showAnimation = GSPopoverViewShowAnimationLeftRight;
    
    [self.popView showPopoverWithTouch:event animation:YES];
    
}


- (IBAction)givenRectTapped:(id)sender
{
    self.popView = [[GSPopoverViewController alloc] initWithShowView:self.tableView];
    self.popView.borderColor = [UIColor orangeColor];
    self.popView.borderWidth = 5;
    //    self.popView.arrowDirection = WJPopoverViewControllerArrowDirectionBottom;
    [self.popView showPopoverWithRect:(CGRect){200, 200, 20, 20} animation:YES];
}



// 右上角加号
- (IBAction)touchUpInSide:(UIButton *)sender forEvent:(UIEvent *)event
{
    //   [self creatPopViewWithEvent:event];
    
    self.popView = [[GSPopoverViewController alloc] initWithShowView:self.tableView];
    self.popView.borderWidth = 0;
    [self.popView showPopoverWithBarButtonItemTouch:event animation:YES];
    //    [self.popView showPopoverWithBarButtonItemTouch:event directionAnimation:WJPopoverViewShowAnimationTopRight];
}


- (IBAction)youTapped:(id)sender forEvent:(UIEvent *)event
{
    [self creatPopViewWithEvent:event];
}

- (void)creatPopViewWithEvent:(UIEvent *)event
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.frame = CGRectMake(0, 0, 100, 200);
    vc.view.backgroundColor = [UIColor grayColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelPopViewFromSuperView)];
    [vc.view addGestureRecognizer:tap];
    
    self.popView = [[GSPopoverViewController alloc] initWithViewController:vc];
    
    [self.popView showPopoverWithBarButtonItemTouch:event animation:YES];
}

- (void)cancelPopViewFromSuperView
{
    [GSPopoverViewController dissPopoverViewWithAnimation:YES];
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 0, 150, 200);
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 50;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor blueColor];
    cell.selectedBackgroundView = view;
    cell.textLabel.text = [NSString stringWithFormat:@"cell%ld", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@", indexPath);
    [GSPopoverViewController dissPopoverViewWithAnimation:NO];
    _tableView = nil;
}


@end
