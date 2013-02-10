#import "LFilterCell.h"
#import "LFilterElement.h"


@implementation LFilterCell


#pragma mark - Synthesize


@synthesize element = _element;


#pragma mark - bindData


- (void)bindData
{
    _labelText.text = _element.title;
    _imageViewCheckmark.image = _element.selected ? [UIImage imageNamed:[self checkedImageName]] : [UIImage imageNamed:[self uncheckedImageName]];
}


#pragma mark - Checkmark images


- (NSString *)checkedImageName
{
    return @"checkmark.png";
}


- (NSString *)uncheckedImageName
{
    return nil;
}


#pragma mark - Cell nib name


+ (NSString *)cellNibName
{
    return NSStringFromClass([self class]);
}


#pragma mark - new


+ (id)new
{
    return [self newWithNibName:[self cellNibName]];
}


+ (id)newWithNibName:(NSString *)nibName
{
	NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    
	for (UIView *view in topLevelObjects)
	{
		if ([view isKindOfClass:([LFilterCell class])])
		{
			return (LFilterCell *)view;
		}
	}
    
	return nil;
}


#pragma mark -


- (void)dealloc
{
    NSLog(@"dealloc LFilterCell");
}


@end