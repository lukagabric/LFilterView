#import "LFilterElement.h"
#import "LFilterCell.h"
#import "LFilterSection.h"


@protocol LFilterViewActionDelegate;


@interface LFilterView : UIView <UITableViewDelegate, UITableViewDataSource>
{
	UITableView *_tableViewFilter;
    
    NSMutableArray *_sections;
    
    __weak id _actionDelegate;
}


@property (weak, nonatomic) id <LFilterViewActionDelegate> actionDelegate;
@property (readonly, nonatomic) CGSize contentSize;


- (void)reloadFilter;

- (void)addSection:(LFilterSection *)section;
- (void)removeSection:(LFilterSection *)section;
- (void)removeSectionWithKey:(NSString *)key;
- (void)removeAllSections;
- (NSArray *)sections;
- (LFilterSection *)sectionAtIndex:(NSUInteger)index;
- (LFilterSection *)sectionWithKey:(NSString *)key;

- (void)element:(LFilterElement *)element didChangeInSection:(LFilterSection *)section;
- (void)didChangeRowHeightForElement:(LFilterElement *)element inSection:(LFilterSection *)section;


@end


#pragma mark - Protected


@interface LFilterView()


- (void)initialize;


@end


#pragma mark - LFilterViewActionDelegate


@protocol LFilterViewActionDelegate <NSObject>


@optional
- (void)didSelectElementAtIndex:(NSUInteger)elementIndex inSectionAtIndex:(NSUInteger)sectionIndex;
- (void)didSelectElement:(LFilterElement *)element inSection:(LFilterSection *)section;


@end


#pragma mark -