#import <UIKit/UIKit.h>
#import "LFilterView.h"


@interface Example3ViewController : UIViewController <LFilterViewActionDelegate>
{
    __weak IBOutlet LFilterView *_filterView;
}


- (IBAction)buttonNextAction:(id)sender;


@end