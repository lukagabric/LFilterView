#import "MyCustomCell.h"
#import "LFilterElement.h"
#import "MyCustomElement.h"


@implementation MyCustomCell


#pragma mark - Overriden method


- (void)bindData
{
    [super bindData];
    
    _labelSubtitle.text = self.myElement.subtitle;
}


#pragma mark - Button action


- (IBAction)actionInfoButton:(id)sender
{
    [_element.customActionDelegate element:_element didPerformAction:@"infoButton" withParams:nil];
}


#pragma mark - My Element Geter


- (MyCustomElement *)myElement
{
    return (MyCustomElement *)_element;
}


#pragma mark -


@end