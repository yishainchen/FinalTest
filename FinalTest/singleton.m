//
//  singleton.m
//  FinalTest
//
//  Created by yishain on 7/29/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "singleton.h"

@implementation singleton
+ (id)sharedInstance {
    static dispatch_once_t onceToken = 0;
    
    __strong static id _sharedObject = nil;
    
    dispatch_once(&onceToken, ^{
        _sharedObject = [[self alloc]init];
    });
    
    return _sharedObject;
}

- (id)init {
    self = [super init];
    
    if (self) {
        _arrMyFavoriteCards = [[NSMutableArray alloc]init];
        _strCurrentCardNickname = @"";
        _arrImageAvatar = [[NSMutableArray alloc]init];
    }
    return self;
}
@end
