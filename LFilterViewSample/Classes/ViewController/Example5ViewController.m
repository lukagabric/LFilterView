#import "Example5ViewController.h"
#import "LFilterSection.h"
#import "MyCustomElement.h"
#import "LSpacingElement.h"
#import "LTextElement.h"


@implementation Example5ViewController


#pragma mark - View


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Custom";
    
    _filterView.actionDelegate = self;
    
    LFilterSection *section = [LFilterSection new];
    section.sectionType = LSectionTypeRadio;
    
    [self addGroup:@"A" toSection:section withNumberOfItems:3];
    [self addGroup:@"B" toSection:section withNumberOfItems:2];
    
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
        MyCustomElement *element = [MyCustomElement new];
        element.title = [NSString stringWithFormat:@"Option %@.%d", groupName, i];
        element.subtitle = [NSString stringWithFormat:@"Subtitle %@.%d", groupName, i];
        element.radioGroup = groupName;
        element.customActionDelegate = self;
        [section addElement:element];
    }
    
    LSpacingElement *spacingElement = [LSpacingElement new];
    spacingElement.rowHeight = 40 + arc4random() % (50);
    spacingElement.cellReuseIdentifier = @"LSpacingElementReuseIdentifier";
    [section addElement:spacingElement];
}


#pragma mark - CustomActionDelegate


- (void)element:(LFilterElement *)element didPerformAction:(NSString *)action withParams:(NSDictionary *)params
{
    [[[UIAlertView alloc] initWithTitle:nil
                                message:[NSString stringWithFormat:@"Tapped on element with title: %@", element.title]
                               delegate:nil cancelButtonTitle:@"Close"
                      otherButtonTitles:nil] show];
}


#pragma mark -


@end