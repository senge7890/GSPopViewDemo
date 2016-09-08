//
//  WJTableViewController.m
//  绘图
//
//  Created by fengwenjie on 16/8/30.
//  Copyright © 2016年 fengwenjie. All rights reserved.
//

#import "GSTableViewController.h"
#import "GSPopoverViewController.h"

@interface GSTableViewController ()

@property (nonatomic, strong) GSPopoverViewController *popView;

@end

@implementation GSTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:@"ic_add_nor"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 30, 25);
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = bar;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    CGRect rect = [cell convertRect:cell.bounds toView:[UIApplication sharedApplication].keyWindow];
    NSLog(@"%@", NSStringFromCGRect(rect));
    
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.frame = CGRectMake(0, 0, 150, 200);
    vc.view.backgroundColor = [UIColor grayColor];
    self.popView = [[GSPopoverViewController alloc] initWithViewController:vc];
    self.popView.borderColor = [UIColor grayColor];
//    self.popView.positionDirection = GSPopoverViewControllerCellPositionhorizontal;
    [self.popView showPopoverWithTableView:cell animation:YES];
}


@end
