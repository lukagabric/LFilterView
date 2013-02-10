#import "Example2ViewController.h"
#import "LFilterSection.h"
#import "LFilterElement.h"
#import "LSpacingElement.h"
#import "LTextElement.h"
#import "Example3ViewController.h"


@implementation Example2ViewController


#pragma mark - View


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Text & Spacing";
    
    _filterView.actionDelegate = self;
    
    LFilterSection *section = [LFilterSection new];
    
    LTextElement *textElement = [LTextElement new];
    textElement.title = @"Text element";
    [section addElement:textElement];
    
    for (int i = 1; i <= 10; i++)
    {
        LFilterElement *element = [LFilterElement new];
        element.title = [NSString stringWithFormat:@"Option %d", i];
        element.cellReuseIdentifier = @"LFilterCellReuseIdentifier";
        [section addElement:element];
        
        if (i == 3)
        {
            LSpacingElement *spacing = [LSpacingElement new];
            spacing.rowHeight = 80;
            [section addElement:spacing];
        }
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
    [self.navigationController pushViewController:[Example3ViewController new] animated:YES];
}


#pragma mark -


@end