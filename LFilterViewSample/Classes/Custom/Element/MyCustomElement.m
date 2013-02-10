#import "MyCustomElement.h"
#import "MyCustomCell.h"


@implementation MyCustomElement


#pragma mark - Overriden methods


- (Class)cellClass
{
    return [MyCustomCell class];
}


- (NSString *)cellReuseIdentifier
{
    return @"MyCustomCellReuseIdentifier";
}


- (CGFloat)rowHeight
{
    return 71;
}


#pragma -


@end