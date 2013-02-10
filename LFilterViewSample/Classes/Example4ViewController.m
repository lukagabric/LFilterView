#import "Example4ViewController.h"
#import "LFilterSection.h"
#import "LFilterElement.h"
#import "LSpacingElement.h"
#import "LTextElement.h"


@implementation Example4ViewController


#pragma mark - View


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Radio";
    
    _filterView.actionDelegate = self;
    
    LFilterSection *section = [LFilterSection new];
    section.sectionType = LSectionTypeRadio;
    
    [self addGroup:@"A" toSection:section withNumberOfItems:3];
    [self addGroup:@"B" toSection:section withNumberOfItems:2];
    [self addGroup:@"C" toSection:section withNumberOfItems:5];
    [self addGroup:@"D" toSection:section withNumberOfItems:5];

    LTextElement *textElement = [LTextElement new];
    textElement.title = @"End";
    textElement.rowHeight = 50;
    [section addElement:textElement];
    
    [_filterView addSection:section];
}


- (void)viewDidUnload
{
    _filterView = nil;
    [super viewDidUnload];
}


#pragma mark - Elements


- (void)addGroup:(NSString *)groupName toSection:(LFilterSection *)section withNumberOfItems:(NSUInteger)noOfItems
{
    LTextElement *textElement = [LTextElement new];
    textElement.title = [NSString stringWithFormat:@"Radio group %@", groupName];
    textElement.cellReuseIdentifier = @"LTextCellReuseIdentifier";
    [section addElement:textElement];
    
    for (int i = 1; i <= noOfItems; i++)
    {
        LFilterElement *element = [LFilterElement new];
        element.title = [NSString stringWithFormat:@"Option %@.%d", groupName, i];
        element.radioGroup = groupName;
        element.cellReuseIdentifier = @"LFilterCellReuseIdentifier";
        [section addElement:element];
    }
    
    LSpacingElement *spacingElement = [LSpacingElement new];
    spacingElement.rowHeight = 40 + arc4random() % (50);
    spacingElement.cellReuseIdentifier = @"LSpacingElementReuseIdentifier";
    [section addElement:spacingElement];
}


#pragma mark - buttonNextAction


- (IBAction)buttonNextAction:(id)sender
{
    
}


#pragma mark -


@end