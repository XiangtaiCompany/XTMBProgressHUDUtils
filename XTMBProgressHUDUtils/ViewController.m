//
//  ViewController.m
//  XTMBProgressHUDUtils
//
//  Created by 何凯楠 on 2017/4/28.
//  Copyright © 2017年 HeXiaoBa. All rights reserved.
//

#import "ViewController.h"
#import "XTMBProgressHUDUtils.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, nullable, strong) UITableView *tableView;
@property (nonatomic, nullable, strong) NSArray *contents;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];

    
}

- (NSArray *)contents
{
    if (!_contents) {
        _contents = @[@"showMessage", @"showIndeterminateForMessage", @"showIndeterminate", @"Determinate", @"DeterminateHorizontalBar", @"AnnularDeterminate", @"customView"];
    }
    return _contents;
}

#pragma mark- UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.textLabel.font = [UIFont systemFontOfSize:16.f];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSString *content = self.contents[indexPath.row];
    cell.textLabel.text = content;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            [XTMBProgressHUDUtils xtMB_showMessage:@"123"];
        }
            break;
        case 1:
        {
            [XTMBProgressHUDUtils xtMB_showIndeterminateToView:self.view message:@"正在加载..."];
            [XTMBProgressHUDUtils xtMB_hiddenAfterDelay:3];
        }
            break;
        case 2:
        {
            [XTMBProgressHUDUtils xtMB_showIndeterminate];
            [XTMBProgressHUDUtils xtMB_hiddenAfterDelay:3];
        }
            break;
        case 3:
        {
            MBProgressHUD *hud = [XTMBProgressHUDUtils xtMB_showView:self.view mode:MBProgressHUDModeDeterminate message:@"Determinate"];
            [self setTaskWithHUD:hud];
        }
            break;
        case 4:
        {
            MBProgressHUD *hud = [XTMBProgressHUDUtils xtMB_showView:self.view mode:MBProgressHUDModeDeterminateHorizontalBar message:@"DeterminateHorizontalBar"];
            [self setTaskWithHUD:hud];
        }
            break;
        case 5:
        {
            MBProgressHUD *hud = [XTMBProgressHUDUtils xtMB_showView:self.view mode:MBProgressHUDModeAnnularDeterminate message:@"AnnularDeterminate"];
            [self setTaskWithHUD:hud];
        }
            break;
        case 6:
        {

            UIImageView *customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"对号"]];
            [XTMBProgressHUDUtils xtMB_showView:self.view customView:customView  message:@"customView"];
            [XTMBProgressHUDUtils xtMB_hiddenAfterDelay:3];
            
        }
            break;
        default:
            break;
    }
    
}

- (void)setTaskWithHUD:(MBProgressHUD *)hud {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        float progress = 0.0f;
        while (progress < 1.0f) {
            progress += 0.01f;
            dispatch_async(dispatch_get_main_queue(), ^{
                hud.progress = progress;
            });
            usleep(50000);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
        
    });
}

#pragma mark- Getter
- (UITableView *)tableView
{
    if (!_tableView) {
        CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}



@end
