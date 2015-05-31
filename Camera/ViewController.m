//
//  ViewController.m
//  Camera
//
//  Created by Fukazawa kota on 2015/05/21.
//  Copyright (c) 2015年 Kota Fukazawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIImagePickerControllerDelegate , UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showImagePicker:(id)sender {
    UIImagePickerControllerSourceType sourceType
    = UIImagePickerControllerSourceTypeCamera;
    
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        
        picker.sourceType = sourceType;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:NULL];
    
        
    }
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self dismissViewControllerAnimated:YES completion:^{
        self.imageView.image = image;
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }];
     
    }



     

@end


