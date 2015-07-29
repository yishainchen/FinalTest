//
//  NextViewController.m
//  FinalTest
//
//  Created by yishain on 7/29/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "NextViewController.h"
#import "GV.h"
#import "TableViewCell.h"
#import <MessageUI/MessageUI.h>
#import "singleton.h"
@interface NextViewController ()<MFMailComposeViewControllerDelegate>
{
    NSString *emailBody;
    NSString *imageName1;
}
@property (strong, nonatomic)
MFMailComposeViewController *mailer;
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    singleton *singletonObj = [singleton sharedInstance];
    imageName1 = [@"Venice" stringByAppendingFormat:@"%d",Number];
    self.imageViewA.image = [UIImage imageNamed:imageName1];
    self.labelNameA.text = singletonObj.arrMyFavoriteCards[Number][@"username"];
    self.textViewA.text = singletonObj.arrMyFavoriteCards[Number][@"text"];
    self.btnMail  = singletonObj.arrMyFavoriteCards[Number][@"email"];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sendMail:(id)sender{
    self.mailer = [[MFMailComposeViewController alloc]init];
    self.mailer.mailComposeDelegate = self;
    
    [self.mailer setSubject:@"Test mail"];
    [self.mailer setMessageBody:@"Testing message the test mail" isHTML:NO];
    [self presentModalViewController:self.mailer animated:YES];
     }
     

    
    /* You might want to uncomment the following, if you
     * have images to attach */
    // UIImage *myImage = [UIImage imageNamed:@"myfabolousimage.png"];
    // NSData *imageData = UIImagePNGRepresentation(myImage);
    // [self.mailer addAttachmentData:imageData
    //              mimeType:@"image/png" fileName:@"myfabolousimage.png"];

-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if (result) {
        NSLog(@"Result : %d",result);
    }
    if (error) {
        NSLog(@"Error : %@",error);
    }
    [self dismissModalViewControllerAnimated:YES];
    
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
