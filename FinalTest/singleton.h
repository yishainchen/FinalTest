//
//  singleton.h
//  FinalTest
//
//  Created by yishain on 7/29/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface singleton : NSObject
@property NSMutableArray *arrMyFavoriteCards;
@property NSString *strCurrentCardNickname;
@property NSMutableArray *arrImageAvatar;

+ (id)sharedInstance;
@end
