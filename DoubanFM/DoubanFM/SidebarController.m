//
//  SidebarController.m
//  DoubanFM
//
//  Created by ljky on 16/5/4.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "SidebarController.h"
#import "PlayerViewController.h"
#import "ChannelsTableViewController.h"

@interface SidebarController ()

{
    CDSideBarController* sideBar;
    PlayerViewController* playVC;
    ChannelsTableViewController* channelsVC;
    UserInfoViewController* userInfoVC;
    AppDelegate* appDelegate;
}

@end

@implementation SidebarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSArray* imageList = @[[UIImage imageNamed:@"menuPlayer"],
                           [UIImage imageNamed:@"menuChannel"],
                           [UIImage imageNamed:@"menuLogin"],
                           [UIImage imageNamed:@"menuClose.png"]];
    sideBar = [CDSideBarController sharedInstanceWithImages:imageList];
    sideBar.delegate = self;
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    playVC = [[PlayerViewController alloc] init];
    
    channelsVC = [[ChannelsTableViewController alloc] init];
    //channelsVC.delegate = (id)self;
    userInfoVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"userInfoVC"];
    self.viewControllers = @[playVC,channelsVC,userInfoVC];
    
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBar.hidden = YES;
    for (UIView* child  in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
    [sideBar insertMenuButtonOnView:self.view atPosition:CGPointMake(self.view.frame.size.width-50, 30)];
}

#pragma mark --- CDSidebar Delegate
-(void)menuButtonClicked:(int)index
{
    self.selectedIndex = index;
    switch (index) {
        case 0:
        case 1:
        case 2:
            self.selectedIndex = index;
            break;
        case 3:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
