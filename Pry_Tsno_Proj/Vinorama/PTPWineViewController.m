//
//  ViewController.m
//  Vinorama2
//
//  Created by Paul on 11/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//


#import "PTPWineViewController.h"
#import "PTPWine.h"

@interface WineOverlayView : UIView

@end

@interface PTPWineViewController ()
{  ;
    WineOverlayView *_overlay;
}
@end

@implementation PTPWineViewController
@synthesize delegate=_delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        titre et item de la nav bar
        self.title=@"Vins Disponibles";
        UIBarButtonItem *shopItem = [[UIBarButtonItem alloc]  initWithImage:[UIImage imageNamed:@"shopping-cart"] style:UIBarButtonItemStylePlain target:self action:@selector(addToShopCart:)];
        self.navigationItem.rightBarButtonItem=shopItem;
        
        //    Gestionnaire de Commandes
        _gestionnaire = [PTPGestionCommandesDelegate sharedGestionCommandes];
    }
    return self;
}
- (void) addToShopCart : (id)sender {
    if(_delegate==nil){
        _delegate=  _gestionnaire.commandesController;
    }
    [_delegate nouvelleCommande:[wineCatalogManager.wineCatalog objectAtIndex:_carousel.currentItemIndex]];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
     _delegate=  _gestionnaire.commandesController;
 
    [_delegate nouvelleCommande:nil];
    // LE RESTE
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    wineCatalogManager = [[PTPWineCatalogManager alloc] init];
    
    _carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 300.0, CGRectGetWidth(self.view.bounds), 111.0 /*depends strongly of values in overlay*/)];
    // these values in initWithFrame should be fixed, having hardcoded values is not great!
    
    _carousel.type = iCarouselTypeLinear; // Try other values to see what happens
    _carousel.delegate = self;
    _carousel.dataSource = self;
    _carousel.clipsToBounds = NO;
    _carousel.userInteractionEnabled = YES;
    [self.view addSubview:_carousel];
    
    _overlay = [[WineOverlayView alloc] initWithFrame:self.view.bounds];
    _overlay.userInteractionEnabled = NO;
    [self.view addSubview:_overlay];
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(40.0, 0.0, 250.0, 90.0)];
    nameLabel.numberOfLines = 2;
    nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont boldSystemFontOfSize:19.0];
    [self.view addSubview:nameLabel];
    
    priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(40.0, 78.0, 81.0, 21.0)];
    priceLabel.textColor = [UIColor redColor];
    priceLabel.font = [UIFont boldSystemFontOfSize:18.0];
    [self.view addSubview:priceLabel];
    
    yearLabel = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 78.0, 50.0, 21.0)];
    yearLabel.textColor = [UIColor blackColor];
    yearLabel.font = [UIFont boldSystemFontOfSize:17.0];
    [self.view addSubview:yearLabel];
    
    descriptionTextView = [[UITextView alloc] initWithFrame:CGRectMake(34.0, 110.0, 246.0, 160.0)];
    descriptionTextView.textColor = [UIColor blackColor];
    descriptionTextView.font = [UIFont systemFontOfSize:15.0];
    descriptionTextView.textAlignment = NSTextAlignmentJustified;
    descriptionTextView.editable = NO;
    [self.view addSubview:descriptionTextView];
    
    nameLabel.text = ((PTPWine*)[wineCatalogManager.wineCatalog objectAtIndex:0]).name;
    priceLabel.text = [NSString stringWithFormat:@"%.02f€", ((PTPWine*)[wineCatalogManager.wineCatalog objectAtIndex:0]).price];
    yearLabel.text = [NSString stringWithFormat:@"%d", ((PTPWine*)[wineCatalogManager.wineCatalog objectAtIndex:0]).year];
    descriptionTextView.text = ((PTPWine*)[wineCatalogManager.wineCatalog objectAtIndex:0]).description;
    _carousel.currentItemIndex = 0;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [wineCatalogManager.wineCatalog count]; /*This is where you will set count values from server response*/;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    //create new view if no view is available for recycling
    if (view == nil)
    {
//        view = [[UIImageView alloc] initWithImage:[wineCatalogManager getImageAtIndex:index]];
        view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bouteille.png"]];
    }

    // Use for example SDWebImageView to load the image from internet in an asynchronous way
    
    return view;
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return 90.0; /*image width*/
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel;
{
//    _textView.text = [NSString stringWithFormat:@"This is where you should place the text from the bottle. Current index is %d", carousel.currentItemIndex];
    nameLabel.text = ((PTPWine*)[wineCatalogManager.wineCatalog objectAtIndex:carousel.currentItemIndex]).name;
    priceLabel.text = [NSString stringWithFormat:@"%.02f€", ((PTPWine*)[wineCatalogManager.wineCatalog objectAtIndex:carousel.currentItemIndex]).price];
    yearLabel.text = [NSString stringWithFormat:@"%d", ((PTPWine*)[wineCatalogManager.wineCatalog objectAtIndex:carousel.currentItemIndex]).year];
    descriptionTextView.text = ((PTPWine*)[wineCatalogManager.wineCatalog objectAtIndex:carousel.currentItemIndex]).description;
    
}

@end


@implementation WineOverlayView

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void) drawRect:(CGRect)rect
{
    // Get the context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Build the path with triangle
    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, 0.0, 300.0);
    CGContextAddLineToPoint(context, 140.0, 300.0);
    CGContextAddLineToPoint(context, 160.0, 320.0);
    CGContextAddLineToPoint(context, 180.0, 300.0);
    CGContextAddLineToPoint(context, 320.0, 300.0);
    CGContextAddLineToPoint(context, 320.0, 0.0);
    
    // Close it
    CGContextClosePath(context);
    // Set fill color with white
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    // Add some shadows
    CGContextSetShadowWithColor(context, CGSizeMake(0.0, 2.0), 5.0, [UIColor blackColor].CGColor);
    // Fill the path
    CGContextFillPath(context);
}

@end
