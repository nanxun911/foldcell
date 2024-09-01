//
//  ViewController.h
//  zhediecell
//
//  Created by nanxun on 2024/8/31.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property UITableView* tableView;
@property UIButton* btn;
@property NSMutableArray* array;

@end

