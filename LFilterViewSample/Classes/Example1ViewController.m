#import "Example1ViewController.h"
#import "Example2ViewController.h"
#import "LFilterSection.h"
#import "LFilterElement.h"


@implementation Example1ViewController


#pragma mark - View


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Example 1";
    
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


#pragma mark -


@end