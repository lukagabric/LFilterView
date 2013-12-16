#import "LFilterView.h"
#import "LFilterCell.h"
#import "LFilterElement.h"


@implementation LFilterView


#pragma mark - Synthesize


@synthesize actionDelegate = _actionDelegate;


#pragma mark - Init


- (id)init
{
    self = [super init];
    if (self)
    {
        [self initialize];
    }
    return self;
}


- (id)initWithFrame:(CGRect)theFrame
{
    self = [super initWithFrame:theFrame];
    if (self)
	{
		[self initialize];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self)
	{
		[self initialize];
	}

	return self;
}


- (void)initialize
{
    _sections = [NSMutableArray new];
    
	_tableViewFilter = [[UITableView alloc] initWithFrame:self.bounds];
	_tableViewFilter.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	_tableViewFilter.tableFooterView = [UIView new];
	_tableViewFilter.backgroundColor = [UIColor clearColor];
	_tableViewFilter.separatorStyle = UITableViewCellSeparatorStyleNone;
	_tableViewFilter.dataSource = self;
	_tableViewFilter.delegate = self;
    
    [self addSubview:_tableViewFilter];

	self.clipsToBounds = YES;
}


#pragma mark - Frame


- (void)setFrame:(CGRect)frame
{
	[super setFrame:frame];

	_tableViewFilter.frame = self.bounds;
}


#pragma mark - Section


- (void)addSection:(LFilterSection *)section
{
    [_sections addObject:section];
    section.parentFilterView = self;
    [self reloadFilter];
}


- (void)removeSection:(LFilterSection *)section
{
    [_sections removeObject:section];
    [self reloadFilter];
}


- (void)removeSectionWithKey:(NSString *)key
{
    for (LFilterSection *section in _sections)
    {
        if ([section.key isEqualToString:key])
        {
            [self removeSection:section];
            return;
        }
    }
}


- (void)removeAllSections
{
    [_sections removeAllObjects];
    [self reloadFilter];
}


- (NSArray *)sections
{
    return [NSArray arrayWithArray:_sections];
}


- (LFilterSection *)sectionAtIndex:(NSUInteger)index
{
    return [_sections objectAtIndex:index];
}


- (LFilterSection *)sectionWithKey:(NSString *)key
{
    for (LFilterSection *section in _sections)
        if ([section.key isEqualToString:key])
            return section;
    
    return nil;
}


#pragma mark - Table view Delegate & Data source


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LFilterSection *section = [_sections objectAtIndex:indexPath.section];
    LFilterElement *element = [[section elements] objectAtIndex:indexPath.row];

    [section didSelectElement:element];
	
    if ([_actionDelegate respondsToSelector:@selector(didSelectElementAtIndex:inSectionAtIndex:)])
    {
        [_actionDelegate didSelectElementAtIndex:indexPath.row inSectionAtIndex:indexPath.section];
    }
    
    if ([_actionDelegate respondsToSelector:@selector(didSelectElement:inSection:)])
    {
        [_actionDelegate didSelectElement:element inSection:section];
    }
    
    [_tableViewFilter deselectRowAtIndexPath:indexPath animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    LFilterSection *sec = [_sections objectAtIndex:section];
    
    return sec.topPadding;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *emptyView = [UIView new];
	emptyView.backgroundColor = [UIColor clearColor];
	return emptyView;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [_sections count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{		
    LFilterSection *sec = [_sections objectAtIndex:section];
    return [[sec elements] count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LFilterSection *section = [_sections objectAtIndex:indexPath.section];
    LFilterElement *element = [[section elements] objectAtIndex:indexPath.row];
    
    return element.rowHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LFilterSection *section = [_sections objectAtIndex:indexPath.section];
    LFilterElement *element = [[section elements] objectAtIndex:indexPath.row];

    LFilterCell *cell = nil;
    
    if (element.cellReuseIdentifier)
        cell = [tableView dequeueReusableCellWithIdentifier:element.cellReuseIdentifier];

    if (!cell)
        cell = [element getCell];
    
    cell.element = element;
	
	return cell;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [(LFilterCell *)cell bindData];
}

// Override to support conditional editing of the table view.
// This only needs to be implemented if you are going to be returning NO
// for some items. By default, all items are editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    LFilterSection *section = [_sections objectAtIndex:indexPath.section];
    LFilterElement *element = [[section elements] objectAtIndex:indexPath.row];
    return element.isEditingEnabled;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        LFilterSection *section = [_sections objectAtIndex:indexPath.section];
        LFilterElement *element = [[section elements] objectAtIndex:indexPath.row];
        if (element.commitsEditingStyleDelete) {
            [section removeElement:element];
            [_tableViewFilter reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }
}


#pragma mark - Reload filter


- (void)reloadFilter
{	
	[_tableViewFilter reloadData];
	_tableViewFilter.tableFooterView = [UIView new];
}


- (void)element:(LFilterElement *)element didChangeInSection:(LFilterSection *)section
{
    NSIndexPath *changedIndexPath = [NSIndexPath indexPathForRow:[section.elements indexOfObject:element] inSection:[_sections indexOfObject:section]];

    LFilterCell *cell = (LFilterCell*)[_tableViewFilter cellForRowAtIndexPath:changedIndexPath];
    [cell bindData];
}


- (void)didChangeRowHeightForElement:(LFilterElement *)element inSection:(LFilterSection *)section
{
    NSIndexPath *changedIndexPath = [NSIndexPath indexPathForRow:[section.elements indexOfObject:element] inSection:[_sections indexOfObject:section]];
    
    [_tableViewFilter reloadRowsAtIndexPaths:[NSArray arrayWithObject:changedIndexPath] withRowAnimation:UITableViewRowAnimationNone];
}


#pragma mark - Getters


- (CGSize)contentSize
{
    return _tableViewFilter.contentSize;
}


#pragma mark - 


- (void)dealloc
{
    NSLog(@"dealloc LFilterView");
}


@end