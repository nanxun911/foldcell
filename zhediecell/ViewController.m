//
//  ViewController.m
//  zhediecell
//
//  Created by nanxun on 2024/8/31.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.array = [NSMutableArray arrayWithArray:@[@"cell01",@"cell02",@"cell03",@"cell04",@"cell05"]];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(200, 300, 100, 30) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.btn.frame = CGRectMake(280, 300, 20, 20);
    [self.btn setImage:[UIImage imageNamed:@"youjiantou.png"] forState:UIControlStateNormal];
    [self.btn setImage:[UIImage imageNamed:@"xiajiantou.png"] forState:UIControlStateSelected];
    [self.btn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    // Do any additional setup after loading the view.
}
#pragma mark tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //NSLog(@"%ld", self.array.count);
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell01 = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (cell01 == nil) {
        cell01 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
    cell01.textLabel.text = _array[indexPath.section];
    return cell01;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* str = _array[indexPath.section];
    [_array removeObjectAtIndex:indexPath.section];
    [_array insertObject:str atIndex:0];
    [self.tableView reloadData];
    [self press:self.btn];
}
-(void)press:(UIButton*)btn {
    if (btn.selected) {
        self.tableView.frame = CGRectMake(200, 300, 100, 30);
    } else {
        self.tableView.frame = CGRectMake(200, 300, 100, 150);
    }
    btn.selected = !btn.selected;
}


@end
