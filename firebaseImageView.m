//
//  firebaseImageView.m
//
//  Created by Richard Bakare on 01/13/14.
//  Copyright (c) 2014 Richard Bakare. All rights reserved.
//

#import "firebaseImageView.h"
#import "firebaseMasterView.h"

@interface firebaseImageView ()
- (void)configureView;
@end

@implementation firebaseImageView

@synthesize imageTitle;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
    // These values are passed from your master (or table) view controller
    self.imageTitle.text = self.imageName;
    self.myImage.image = self.image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
