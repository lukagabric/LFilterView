#import "Example1ViewController.h"
#import "Example2ViewController.h"
#import "LFilterSection.h"
#import "LFilterElement.h"


@implementation Example1ViewController


#pragma mark - View


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Checkbox";
    
    _filterView.actionDelegate = self;
    
    LFilterSection *section = [LFilterSection new];
    
    for (int i = 1; i <= 15; i++)
    {
        LFilterElement *element = [LFilterElement new];
        element.title = [NSString stringWithFormat:@"Option %d", i];
        element.cellReuseIdentifier = @"LFilterCellReuseIdentifier";
        [section addElement:element];
    }
    
    [_filterView addSection:section];
}


- (void)viewDidUnload
{
    _filterView = nil;
    [super viewDidUnload];
}


#pragma mark - buttonNextAction


- (IBAction)buttonNextAction:(id)sender
{
    Example2ViewController *example2ViewController = [Example2ViewController new];
    [self.navigationController pushViewController:example2ViewController animated:YES];
}

#pragma mark LFilterView Action Delegate Protocol implementation

- (BOOL)filterView:(LFilterView *)filterView shouldEditElement:(LFilterElement *)element inSection:(LFilterSection *)section atIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)filterView:(LFilterView *)filterView shouldCommitEditingStyle:(UITableViewCellEditingStyle)editingStyle forElement:(LFilterElement *)element inSection:(LFilterSection *)section atIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        return YES;
    }
    return NO;
}

- (void)filterView:(LFilterView *)filterView didDeleteElement:(LFilterElement *)element inSection:(LFilterSection *)section atIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"deleted element %@", element.title);
}

#pragma mark -


@end