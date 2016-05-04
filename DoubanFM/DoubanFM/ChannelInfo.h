//
//  ChannelInfo.h
//  DoubanFM
//
//  Created by lkjy on 16/5/4.
//  Copyright © 2016年 何健. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, DFMChannelType) {
    DFMChannelTypeReccommend = 1,
    DFMChannelTypeUpTrending,
    DFMChannelTypeHot,
};

@interface ChannelInfo : NSObject

@property (nonatomic) NSString *ID;
@property (nonatomic) NSString *name;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

+ (NSMutableArray *)channels;

+ (instancetype)currentChannel;
+ (void)updateCurrentCannel:(ChannelInfo *)channel;

+ (NSArray *)channelsTitleArray;
+ (void)updateChannelsTitleArray:(NSArray *)array;

@end
