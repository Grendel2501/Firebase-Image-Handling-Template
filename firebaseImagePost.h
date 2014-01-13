//
//  firebaseImagePost.h
//
//  Created by Richard Bakare on 01/13/14.
//  Copyright (c) 2014 Richard Bakare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>

@interface firebaseImagePost : UIViewController <UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *imageName;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;

@end
