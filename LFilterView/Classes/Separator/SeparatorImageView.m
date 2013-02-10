#import "SeparatorImageView.h"


@implementation SeparatorImageView


#pragma mark - Init


- (id)init
{
    self = [super init];
    if (self)
    {
        [self initialize];
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initialize];
    }
    return self;
}


- (id)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
    if (self)
    {
        [self initialize];
    }
    return self;
}


- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    self = [super initWithImage:image highlightedImage:highlightedImage];
    if (self)
    {
        [self initialize];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initialize];
    }
    return self;
}


- (void)initialize
{
    if (self.backgroundColor)
    {
        UIImage *image = [[self imageWithColor:self.backgroundColor] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
        
        self.image = image;
    }
}


#pragma mark - Helper


- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}


#pragma mark -


@end