//
//  ProtocolClass.h
//  DoubanFM
//
//  Created by ljky on 16/5/4.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DoubanDelegate <NSObject>

@optional
/**
 *  登录界面
 */

-(void)setCaptchaImageWithURLInString:(NSString *)url;

-(void)loginSuccess;
-(void)logoutSuccess;

/**
 *  播放列表delegate
 */
-(void)reloadTableviewData;

/**
 *  初始化歌曲delegate
 */
-(void)initSongInfomation;

/**
 *  初始化用户信息delegate
 */
-(void)setUserInfo;

-(void)menuButtonClicked:(int)index;

@end

@interface ProtocolClass : NSObject

@end
