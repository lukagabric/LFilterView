#import "Example3ViewController.h"
#import "LFilterSection.h"
#import "LFilterElement.h"
#import "LSpacingElement.h"
#import "LTextElement.h"


@implementation Example3ViewController


#pragma mark - View


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Radio";
    
    _filterView.actionDelegate = self;
    
    LFilterSection *section = [LFilterSection new];
    section.sectionType = LSectionTypeRadio;
    
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
    
}


#pragma mark -


@end