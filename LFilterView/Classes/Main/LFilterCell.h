#import "SeparatorImageView.h"


@class LFilterElement;


@interface LFilterCell : UITableViewCell
{
    __weak IBOutlet UIImageView *_imageViewCheckmark;
    __weak IBOutlet UILabel *_labelText;
    __weak IBOutlet SeparatorImageView *_separator;
    
    __weak LFilterElement *_element;
}


@property (weak, nonatomic) LFilterElement *element;


- (void)bindData;


+ (NSString *)cellNibName;
+ (id)newWithNibName:(NSString *)nibName;


@end