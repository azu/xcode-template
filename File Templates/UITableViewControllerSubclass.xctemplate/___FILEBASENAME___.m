#import "___FILEBASENAME___.h"

#define kCellIdentifier @"CellIdentifier"

@interface ___FILEBASENAMEASIDENTIFIER___ ()

@end

@implementation ___FILEBASENAMEASIDENTIFIER___ {
@private
    NSArray *dataSource_;
}

@synthesize dataSource = dataSource_;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (!self){
        return nil;
    }

    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // DataSource init
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    // Update Navigation
    [self updateNavigationItemAnimated:animated];

    // deselect cell
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];

    //  update visible cells
    [self updateVisibleCells];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//--------------------------------------------------------------//
#pragma mark -- ViewOutlets Update --
//--------------------------------------------------------------//

- (void)updateNavigationItemAnimated:(BOOL)animated {
}
#pragma mark - Cell Operation
- (void)updateVisibleCells {
    // セルの表示更新
    for (UITableViewCell *cell in [self.tableView visibleCells]){
        [self updateCell:cell atIndexPath:[self.tableView indexPathForCell:cell]];
    }
}

- (void)updateCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    // Update Cells
}
//--------------------------------------------------------------//
#pragma mark -- UITableViewDataSource --
//--------------------------------------------------------------//
/* セクションタイトル
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.sectionTitles objectAtIndex:section];
}
*/
// Section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataSource count];
}

// Section -> Row
- (NSInteger)tableView:(UITableView *)tableView
             numberOfRowsInSection:(NSInteger)section {
    return [[self.dataSource objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
                     cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = kCellIdentifier;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell){
        cell = [[[UITableViewCell alloc]
                                  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier]
                                  autorelease];
    }
    // Configure the cell...
    cell.accessoryType = UITableViewCellAccessoryNone;
    [self updateCell:cell atIndexPath:indexPath];

    return cell;
}

//--------------------------------------------------------------//
#pragma mark -- UITableViewDelegate --
//--------------------------------------------------------------//

- (void)tableView:(UITableView *)tableView
        didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // ハイライトを外す
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)dealloc {
    [dataSource_ release], dataSource_ = nil;
    [super dealloc];
}
@end
