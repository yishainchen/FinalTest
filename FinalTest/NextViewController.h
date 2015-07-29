//
//  NextViewController.h
//  FinalTest
//
//  Created by yishain on 7/29/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextViewController : UIViewController
-(IBAction)sendMail:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewA;
@property (weak, nonatomic) IBOutlet UILabel *labelNameA;
@property (weak, nonatomic) IBOutlet UITextView *textViewA;
@property (weak, nonatomic) IBOutlet UIButton *btnMail;

@end
