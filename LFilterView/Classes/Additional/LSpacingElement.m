#import "LSpacingElement.h"
#import "LFilterCell.h"


@implementation LSpacingElement


- (LFilterCell *)getCell
{
    LFilterCell *cell = [[LFilterCell alloc] init];
    cell.element = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.userInteractionEnabled = NO;
    
    return cell;
}


- (void)setSelected:(BOOL)selected
{

}


@end