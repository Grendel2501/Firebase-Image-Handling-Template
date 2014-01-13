//
//  firebaseImagePost.m
//
//  Created by Richard Bakare on 01/13/14.
//  Copyright (c) 2014 Richard Bakare. All rights reserved.
//

#import "firebaseImagePost.h"
#import "firebaseImageView.h"
#import "JSONHelper.h"
#import "image.h"
#import "NSStrinAdditions.h"

@interface firebaseImagePost ()

@end

@implementation firebaseImagePost

@synthesize imageName, saveButton, textFields;

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"Device has no camera");
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

-(IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)takePhoto:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)selectPhoto:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)saveButtonClicked:(id)sender {
    NSString *imageName = self.imageTitle.text;
    UIImage *uploadImage = self.imageView.image;
    NSData *imageData = UIImageJPEGRepresentation(uploadImage, 0.9);
    NSString *imageString = [NSString base64StringFromData:imageData length:[imageData length]];
    
    Firebase* addImageRef = [[Firebase alloc] initWithUrl:@"https://mydb.firebaseio.com/images/data/"];
    
    [addImageRef observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        long numImagesCount = snapshot.childrenCount;
        NSString *indexPath = [NSString stringWithFormat: @"%ld", numImagesCount];
        Firebase* newImageRef = [addImageRef childByAppendingPath:indexPath];
        [newImageRef setValue:@{@"id": indexPath, @"imageName":imageName}];
    }];
    
    [self switchViews];
}

-(IBAction)switchViews {    
    [self performSegueWithIdentifier:@"backHome" sender:self];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self removeFromParentViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
