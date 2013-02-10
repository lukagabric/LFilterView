#import <UIKit/UIKit.h>
#import "LFilterView.h"


@interface Example5ViewController : UIViewController <LFilterViewActionDelegate, CustomActionDelegate>
{
    __weak IBOutlet LFilterView *_filterView;
}


@end