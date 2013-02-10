#import "LFilterCell.h"
#import "MyCustomElement.h"


@interface MyCustomCell : LFilterCell
{
    __weak IBOutlet UILabel *_labelSubtitle;
}


@property (readonly, nonatomic) MyCustomElement *myElement;


@end