//
//  WeChatModel.m
//  TableView自定义
//
//  Created by alexganggao on 2020/6/23.
//  Copyright © 2020 alexganggao. All rights reserved.
//

#import "WeChatModel.h"

@interface WeChatModel()
@property(nonatomic, strong) NSArray *pics;
@property(nonatomic, strong) NSArray *titles;
@property(nonatomic, strong) NSArray *times;
@property(nonatomic, strong) NSArray *contents;
@property (nonatomic,strong) NSMutableArray<WeChatModel *> *wechats;

@end

@implementation WeChatModel

- (NSMutableArray *)getModels{
    return self.wechats;
}

- (NSArray<WeChatModel *> *)wechats{
    if(_wechats == nil){
        _wechats = [NSMutableArray array];
        for (int i=0; i<self.titles.count; i++) {
            WeChatModel *model = [[WeChatModel alloc] init];
            model.picName=self.pics[i];
            model.contentText=self.contents[i];
            model.timeText=self.times[i];
            model.titleText=self.titles[i];
            [_wechats addObject:model];
        }
    }
    return _wechats;
}

- (NSArray *)pics{
    if(_pics == nil){
        _pics=@[@"add_friend_icon_addgroup_36x36_",@"Contact_icon_ContactTag_36x36_",@"plugins_FriendNotify_36x36_",@"Plugins_WeSport_36x36_",@"ReadVerified_icon_36x36_"];
    }
    return _pics;
}

- (NSArray *)titles{
    if(_titles ==nil){
        _titles=@[@"小龙女哀悼金庸", @"坠江公交黑匣子",@"新iPad发布",@"金庸去世", @"苹果发布会"];
    }
    return _titles;
}

- (NSArray *)times{
    if(_times == nil){
        _times=@[@"10:12", @"10:15", @"10:20", @"10:50", @"11:00"];
    }
    return _times;
}

- (NSArray *)contents{
    if(_contents ==nil){
        _contents=@[@"小龙女哀悼金庸:他笔下的小龙女给予我一切一切", @"重庆坠江公交车黑匣子打捞出水 已交公安部门", @"新iPad发布 苹果10月发布会发布三款新品", @"94岁金庸去世 网友明星悼念:他带着武侠梦睡着了", @"苹果于10月30号晚上22点召开新品发布会"];
    }
    return  _contents;
}


@end
