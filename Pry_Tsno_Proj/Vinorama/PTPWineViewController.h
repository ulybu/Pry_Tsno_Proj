//  ViewController.h
//  Vinorama2
//
//  Created by Paul on 11/01/13.
//  Copyright (c) 2013 Paul. All rights reserved.

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "PTPWineCatalogManager.h"
#import "PTPGestionCommandesDelegate.h"


@interface PTPWineViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>
{
    iCarousel *_carousel;
    UITextView * descriptionTextView;
    UILabel * nameLabel;
    UILabel * priceLabel;
    UILabel * yearLabel;
    
    PTPWineCatalogManager *wineCatalogManager;
    PTPGestionCommandesDelegate *_gestionnaire;
    

}
@property (nonatomic,assign) id <GestionCommandesDelegate> delegate;
@end
