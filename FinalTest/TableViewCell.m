//
//  TableViewCell.m
//  FinalTest
//
//  Created by yishain on 7/29/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "TableViewCell.h"
#import "ViewController.h"
#import "GV.h"
#import "singleton.h"
@implementation TableViewCell
{
    NSString *imageName;
    int a ;
}
- (void)awakeFromNib {
   
    singleton *singletonObj = [singleton sharedInstance];
    a = i;
    NSLog(@"arr = %@",singletonObj.arrMyFavoriteCards);
    self.labelName.text = singletonObj.arrMyFavoriteCards[0][@"username"];
    self.labelView.text = singletonObj.arrMyFavoriteCards[0][@"email"];
    self.textDetail.text = singletonObj.arrMyFavoriteCards[0][@"text"];
 
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


    
    
    // Configure the view for the selected state
}






@end
