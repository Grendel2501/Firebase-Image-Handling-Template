//
//  firebaseImageView.h
//
//  Created by Richard Bakare on 01/13/14.
//  Copyright (c) 2014 Richard Bakare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface firebaseImageView : UIViewController <>

@property (strong, nonatomic) id detailItem;

// image label properties for UI
@property (weak, nonatomic) IBOutlet UILabel *imageTitle;

// image object properties from tableView
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) UIImage *myImage;

@end
