//
//  TableViewController.m
//  FinalTest
//
//  Created by yishain on 7/28/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "ViewController.h"
#import "GV.h"
#import "singleton.h"
@interface TableViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    int Number;
    NSString *imageName;
    int a ;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView1;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;
    a = i;
   

    // Do any additional setup after loading the view.
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     singleton *singletonObj = [singleton sharedInstance];
    // Return the number of rows in the section.
    return singletonObj.arrMyFavoriteCards.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Number = indexPath.row ;
    static NSString *CellIdentifier = @"Cell";
    singleton *singletonObj = [singleton sharedInstance];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    UILabel *iv1 = (UILabel *)[cell viewWithTag:200];
    //    iv1.text = arraylabel[indexPath.row][@"eventName"];
    iv1.text = singletonObj.arrMyFavoriteCards[Number][@"username"];
    NSLog(@"%@",iv1.text);
    
    UILabel *iv2 = (UILabel *)[cell viewWithTag:300];
    iv2.text = singletonObj.arrMyFavoriteCards[Number][@"email"];    //    iv2.text = arraydate[indexPath.row][@"dateString"];
    
    UITextField *iv3 = (UITextField *)[cell viewWithTag:400];
    iv3.text = singletonObj.arrMyFavoriteCards[Number][@"text"];
    //    iv3.text = arraydetail[indexPath.row][@"content"];
    
    //    _webButton = (UIButton *)[cell viewWithTag:500];
    
    UIImageView *iv4 = (UIImageView *)[cell viewWithTag:500];
    imageName = [@"Venice" stringByAppendingFormat:@"%d",Number];
    iv4.image = [UIImage imageNamed:imageName];
    

    
    if (cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
        //    [iv4 addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200.0f;
}

@end
