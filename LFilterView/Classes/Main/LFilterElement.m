#import "LFilterElement.h"
#import "LFilterCell.h"
#import "LFilterSection.h"


@implementation LFilterElement


#pragma mark - Synthesize


@synthesize key = _key;
@synthesize radioGroup = _radioGroup;
@synthesize selected = _selected;
@synthesize title = _title;
@synthesize cellClass = _cellClass;
@synthesize nibName = _nibName;
@synthesize rowHeight = _rowHeight;
@synthesize parentSection = _parentSection;
@synthesize customActionDelegate = _customActionDelegate;


#pragma mark - Init


- (id)init
{
    self = [super init];
    if (self)
    {
        _radioGroup = @"default";
        _isEditingEnabled = NO;
        _commitsEditingStyleDelete = NO;
    }
    return self;
}


#pragma mark - Getters


- (LFilterCell *)getCell
{
    LFilterCell *cell;
    
    if (_nibName)
    {
        cell = [[self cellClass] newWithNibName:self.nibName];
    }
    else
    {
        cell = [[self cellClass] new];
    }
    
    cell.element = self;

    return cell;
}


- (CGFloat)rowHeight
{
    return _rowHeight == 0 ? 44 : _rowHeight;
}


- (Class)cellClass
{
    return _cellClass ? _cellClass : [LFilterCell class];
}


#pragma mark - Setters


- (void)setSelected:(BOOL)selected
{
    _selected = selected;

    [_parentSection elementDidChange:self];
}


- (void)setTitle:(NSString *)title
{
    _title = title;
    
    [_parentSection elementDidChange:self];
}


- (void)setRowHeight:(CGFloat)rowHeight
{
    _rowHeight = rowHeight;
    
    [_parentSection didChangeRowHeightForElement:self];
}


#pragma mark -


- (void)dealloc
{
    NSLog(@"dealloc LFilterElement");
}


@end