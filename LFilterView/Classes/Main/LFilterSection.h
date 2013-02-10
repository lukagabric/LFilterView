#import "LFilterElement.h"


@class LFilterView;


typedef enum
{
	LSectionConstraintNone = 0,
	LSectionConstraintAtLeastOneSelected = 1
}LSectionConstraint;


typedef enum
{
	LSectionTypeCheck,
	LSectionTypeRadio,
}LSectionType;


@interface LFilterSection : NSObject
{
    NSMutableArray *_elements; //array of LFilterElement objects
    
    NSString *_key;
    LSectionType _sectionType;
    LSectionConstraint _sectionConstraint;
    CGFloat _topPadding;
    
    __weak LFilterView *_parentFilterView;
}


@property (strong, nonatomic) NSString *key;
@property (assign, nonatomic) LSectionType sectionType;
@property (assign, nonatomic) LSectionConstraint sectionConstraint;
@property (assign, nonatomic) CGFloat topPadding;
@property (weak, nonatomic) LFilterView *parentFilterView;


- (void)addElement:(LFilterElement *)element;

- (LFilterElement *)elementAtIndex:(NSUInteger)index;
- (LFilterElement *)elementWithKey:(NSString *)key;
- (NSArray *)selectedElements;
- (NSArray *)elementsOfRadioGroup:(NSString *)radioGroup;
- (NSArray *)elements;

- (void)didSelectElement:(LFilterElement *)element;
- (void)didSelectElementAtIndex:(NSUInteger)index;

- (void)deselectAllElements;
- (void)deselectAllElementsOfRadioGroup:(NSString *)radioGroup;

- (void)elementDidChange:(LFilterElement *)element;
- (void)didChangeRowHeightForElement:(LFilterElement *)element;


@end


#pragma mark - Protected


@interface LFilterSection ()


- (void)initialize;


@end


#pragma mark -