@class LFilterSection;
@class LFilterCell;

@protocol CustomActionDelegate;


@interface LFilterElement : NSObject
{
    NSString *_key;
    NSString *_radioGroup;
    
    BOOL _selected;
    NSString *_title;
    
    __strong Class _cellClass;
    NSString *_nibName;
    
    CGFloat _rowHeight;
    
    __weak LFilterSection *_parentSection;

    __weak id _customActionDelegate;
}


@property (strong, nonatomic) NSString *key;

//if nil element not part of any group
@property (strong, nonatomic) NSString *radioGroup;

//name of the nib to get LFilterCell from
@property (strong, nonatomic) NSString *nibName;

//if nibName is not defined cellClass will be used
//if cellClass is not defined LFilterCell class will be used
@property (strong, nonatomic) Class cellClass;
@property (strong, nonatomic) NSString *cellReuseIdentifier;

//if not defined use frame height
@property (assign, nonatomic) CGFloat rowHeight;

@property (weak, nonatomic) LFilterSection *parentSection;

@property (assign, nonatomic) BOOL selected;
@property (strong, nonatomic) NSString *title;

@property (weak, nonatomic) id <CustomActionDelegate> customActionDelegate;


- (LFilterCell *)getCell;


@end


@protocol CustomActionDelegate <NSObject>


- (void)didPerformAction:(NSString *)action withParams:(NSDictionary *)params;


@end