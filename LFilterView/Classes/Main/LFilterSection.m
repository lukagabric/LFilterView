#import "LFilterSection.h"
#import "LFilterView.h"


@implementation LFilterSection


#pragma mark - Synthesize


@synthesize key = _key;
@synthesize sectionType = _sectionType;
@synthesize sectionConstraint = _sectionConstraint;
@synthesize topPadding = _topPadding;
@synthesize parentFilterView = _parentFilterView;


#pragma mark - Init


- (id)init
{
    self = [super init];
    if (self) [self initialize];
    return self;
}


- (void)initialize
{
    _elements = [NSMutableArray new];
}


#pragma mark - Element


- (void)addElement:(LFilterElement *)element
{
    [_elements addObject:element];
    element.parentSection = self;
}

- (void)removeElement:(LFilterElement *)element
{
    [_elements removeObject:element];
    
}

- (LFilterElement *)elementAtIndex:(NSUInteger)index
{
    return [_elements objectAtIndex:index];
}


- (LFilterElement *)elementWithKey:(NSString *)key
{
    for (LFilterElement *element in _elements)
        if ([element.key isEqualToString:key])
            return element;

    return nil;
}


- (NSArray *)selectedElements
{
    NSMutableArray *sel = [NSMutableArray new];
    
    for (LFilterElement *el in _elements)
        if (el.selected)
            [sel addObject:el];
    
    return [NSArray arrayWithArray:sel];
}


- (NSArray *)elementsOfRadioGroup:(NSString *)radioGroup
{
    if (!radioGroup) return nil;
    
    NSMutableArray *elements = [NSMutableArray new];
    
    for (LFilterElement *el in _elements)
        if (radioGroup && el.radioGroup && [el.radioGroup isEqualToString:radioGroup])
            [elements addObject:el];
    
    return [NSArray arrayWithArray:elements];
}


- (NSArray *)elements
{
    return [NSArray arrayWithArray:_elements];
}


- (void)didSelectElement:(LFilterElement *)element
{
    if (_sectionType == LSectionTypeRadio)
	{
        if (element.selected && _sectionConstraint == LSectionConstraintNone)
        {
            element.selected = NO;
        }
        else
        {
            [self deselectAllElementsOfRadioGroup:element.radioGroup];
            element.selected = YES;
        }
	}
	else if (_sectionType == LSectionTypeCheck)
	{
        if (_sectionConstraint == LSectionConstraintNone)
        {
            element.selected = element.selected ? NO : YES;
        }
        else if (_sectionConstraint == LSectionConstraintAtLeastOneSelected)
        {
            if (!element.selected) //if element is going to be selected nvm
            {
                element.selected = YES;
            }
            else //else the element is going to be deselected so check if at least one other is selected
            {
                if ([[self selectedElements] count] >= 2)
                {
                    element.selected = NO;
                }
            }
        }
	}

}


- (void)didSelectElementAtIndex:(NSUInteger)index
{
    [self didSelectElement:[_elements objectAtIndex:index]];
}


- (void)deselectAllElements
{
    for (LFilterElement *el in _elements)
        if (el.selected)
            el.selected = NO;
}


- (void)deselectAllElementsOfRadioGroup:(NSString *)radioGroup
{
    if (!radioGroup) return;
    
    for (LFilterElement *el in [self elementsOfRadioGroup:radioGroup])
        if (el.selected)
            el.selected = NO;
}


#pragma mark - Element change


- (void)elementDidChange:(LFilterElement *)element
{
    [_parentFilterView element:element didChangeInSection:self];
}


- (void)didChangeRowHeightForElement:(LFilterElement *)element
{
    [_parentFilterView didChangeRowHeightForElement:element inSection:self];
}


#pragma mark -


- (void)dealloc
{
    NSLog(@"dealloc LFilterSection");
}


@end