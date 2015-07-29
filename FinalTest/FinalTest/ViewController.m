//
//  ViewController.m
//  FinalTest
//
//  Created by yishain on 7/23/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "TableViewController.h"
#import "GV.h"
#import "singleton.h"
@interface ViewController ()

{
    NSMutableArray *email;
    NSMutableArray *text;
    NSMutableArray *username;
    NSMutableArray *userimage;
    NSMutableArray *myFavorite;
    NSString *imageName;
    NSMutableDictionary *dictArr;
    NSDictionary *dic;
    int i;
}
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIButton *timerBtn;
@property (weak, nonatomic) IBOutlet UITextView *userText;
@property (weak, nonatomic) IBOutlet UILabel *userMAil;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    i = arc4random() % 14;
    imageName = [@"Venice" stringByAppendingFormat:@"%d",i];
    self.imageView.image = [UIImage imageNamed:imageName];
    [self getData];
    NSLog(@"text = %@",text);
}

- (IBAction)btnChange3:(id)sender {
    i = arc4random() % 14;
    imageName = [@"Venice" stringByAppendingFormat:@"%d",i];
    self.imageView2.image = [UIImage imageNamed:imageName];
    [UIView animateKeyframesWithDuration:5 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            
            self.imageView2.center =CGPointMake(300, 650);
            self.imageView2.transform = CGAffineTransformScale(self.imageView2.transform , -1.0, 1.0) ;
            self.imageView2.frame =
            CGRectMake(self.imageView2.frame.origin.x, 600,
                       self.imageView2.frame.size.width*2,
                       self.imageView2.frame.size.height*2);
        }];
    } completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getData {
    PFQuery *query = [PFQuery queryWithClassName:@"cardInfomaton"];
    email = [[NSMutableArray alloc]init];
    text  = [[NSMutableArray alloc]init];https://www.parse.com/apps/alphacamp-app/collections#class/cardInfomaton
    username = [[NSMutableArray alloc]init];
    userimage= [[NSMutableArray alloc]init];
    [query findObjectsInBackgroundWithBlock:^(NSArray *arrResult,NSError *error){
        NSLog(@"%@",arrResult);
        for (PFObject *obj in arrResult) {
            [email addObject:obj[@"Email"]];
            [username  addObject:obj[@"Name"]];
            [text addObject:obj[@"Text"]];
            [userimage  addObject:obj[@"image"]];
        }
        NSLog(@"text %@",text);
        NSLog(@"name = %@",username);
        NSLog(@"email = %@",email);
        self.userText.text = text[i];
        self.userMAil.text = email[i];
        self.nameLable.text = username[i];
       
    }];
    dictArr = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
            self.userText.text,@"text",
            self.userMAil.text,@"email",
            self.nameLable.text,@"username", nil];
}

- (IBAction)favoBtn:(id)sender {
    singleton *singletonObj = [singleton sharedInstance];
    
    
    [singletonObj.arrMyFavoriteCards addObject:dictArr];
   
}
- (IBAction)reloadData:(id)sender {
    i = arc4random() % 14;
    imageName = [@"Venice" stringByAppendingFormat:@"%d",i];
    self.imageView.image = [UIImage imageNamed:imageName];
    self.imageView2.image = [UIImage imageNamed:imageName];
    [self getData];
}

@end
