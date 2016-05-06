//
//  ChannelsTableViewController.m
//  DoubanFM
//
//  Created by lkjy on 16/5/4.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "ChannelsTableViewController.h"
#import <MJRefresh/MJRefresh.h>
@interface ChannelsTableViewController ()
{
    AFHTTPRequestOperationManager *manager;
    AppDelegate *appDelegate;
    NetworkManager *networkManager;
    PlayerController *playerController;
}

@end

@implementation ChannelsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight = 80;
    self.tableView.rowHeight = 60;
    //初始化工具类
    appDelegate = [[UIApplication sharedApplication]delegate];
    networkManager = [[NetworkManager alloc]init];
    //networkManager.delegate = self;
    playerController = [[PlayerController alloc]init];
    //初始化tableviewCell
    UINib *cell = [UINib nibWithNibName:@"ChannelsTableViewCell" bundle:nil];
    [self.tableView registerNib:cell forCellReuseIdentifier:@"theReuseIdentifier"];
}
-(void)viewWillAppear:(BOOL)animated{
    //用MJRefresh做下来刷新
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(initChannelInfo)];
    
    // 设置文字
    [self.tableView.header setTitle:@"往下拉可刷新哦" forState:MJRefreshHeaderStateIdle];
    [self.tableView.header setTitle:@"松开来就刷新啦" forState:MJRefreshHeaderStatePulling];
    [self.tableView.header setTitle:@"~~刷~~新~~中~~" forState:MJRefreshHeaderStateRefreshing];
    
    // 设置字体
    self.tableView.header.font = [UIFont systemFontOfSize:15];
    
    // 设置颜色
    self.tableView.header.textColor = [UIColor grayColor];
    // 马上进入刷新状态
    [self.tableView.header beginRefreshing];
    
    // 此时self.tableView.header == self.tableView.legendHeader
    [super viewWillAppear:animated];
}
//-(void)initChannelInfo{
//    if (appDelegate.userInfo.cookies == nil) {
//        [networkManager setChannel:1 withURLWithString:@"http://douban.fm/j/explore/get_recommend_chl"];
//    }
//    else{
//        [networkManager setChannel:1 withURLWithString:[NSString stringWithFormat:@"http://douban.fm/j/explore/get_login_chls?uk=%@",appDelegate.userInfo.userID]];
//    }
//    [networkManager setChannel:2 withURLWithString:@"http://douban.fm/j/explore/up_trending_channels"];
//    [networkManager setChannel:3 withURLWithString:@"http://douban.fm/j/explore/hot_channels"];
//    //MJRefresh停止刷新
//    [self.tableView.header endRefreshing];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [ChannelInfo updateCurrentCannel:[[[ChannelInfo channels] objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]];
    //[networkManager loadPlaylistwithType:@"n"];
    [self.delegate menuButtonClicked:0];

}

- (void)reloadTableviewData
{
    [self.tableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
