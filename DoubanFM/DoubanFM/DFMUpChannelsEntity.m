//
//  DFMUpChannelsEntity.m
//  DoubanFM
//
//  Created by lkjy on 16/5/4.
//  Copyright © 2016年 何健. All rights reserved.
//

#import "DFMUpChannelsEntity.h"
#import "ChannelInfo.h"

@implementation DFMUpChannelsEntity

+ (NSDictionary *)objectClassInArray
{
    return @{@"channels" : NSStringFromClass([ChannelInfo class]),};
}
@end
