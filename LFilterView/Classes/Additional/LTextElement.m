#import "LTextElement.h"
#import "LFilterCell.h"


@implementation LTextElement


#pragma mark - Getters


- (LFilterCell *)getCell
{
    LFilterCell *cell = [LFilterCell newWithNibName:@"LTextCell"];
    cell.element = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.userInteractionEnabled = NO;
    
    return cell;
}


- (CGFloat)rowHeight
{
    return _rowHeight == 0 ? 44 : _rowHeight;
}


#pragma mark - Setters


- (void)setSelected:(BOOL)selected
{
    
}


#pragma mark -


@end