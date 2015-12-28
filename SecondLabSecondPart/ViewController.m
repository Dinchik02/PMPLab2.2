
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (self.todoList == nil) {
        self.todoList = [NSMutableArray new];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.todoList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *cellID	=	@"CellID";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    if (cell){
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        if (indexPath.row % 2  != 0) {
            UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
            cell.accessoryView = switchView;
            [switchView setOn:NO animated:NO];
        } else {
            UISlider *slider = [[UISlider alloc] initWithFrame:CGRectZero];
            [cell.contentView addSubview:slider];
            slider.bounds = CGRectMake(100, 0, cell.contentView.bounds.size.width - 350, slider.bounds.size.height);
            slider.center = CGPointMake(CGRectGetMaxX(cell.contentView.bounds), CGRectGetMidY(cell.contentView.bounds));
            slider.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        }
    }
    cell.textLabel.text =[NSString stringWithFormat :@"%@ S:%ld R:%ld",self.todoList[indexPath.row],(long)indexPath.section,(long)indexPath.row];
    return cell;
}


- (void) switchChanged:(id)sender {
    UISwitch* switchControl = sender;
    NSLog( @"The switch is %@", switchControl.on ? @"ON" : @"OFF" );
}

-(void)sliderChanged:(UISlider *)sender{
//    UIS* slideControl = sender;
    NSLog( @"The slider is");
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Removing row:	%lu",	indexPath.row);
    [self.todoList removeObjectAtIndex:indexPath.row];
    [self.customTableView reloadData];
}

- (IBAction)addButton:(id)sender {
    [self.todoList insertObject: self.customTextField.text atIndex: 0];
    [self.customTableView reloadData];
    self.customTextField.text = @"";
}

@end
