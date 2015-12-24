//
//  ViewController.h
//  SecondLabSecondPart
//
//  Created by Yan on 12/23/15.
//  Copyright © 2015 DianaVolodchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *customTableView;
@property (weak, nonatomic) IBOutlet UIButton *customButton;
@property (weak, nonatomic) IBOutlet UITextField *customTextField;

@property (strong, nonatomic) NSMutableArray *todoList;

@end

