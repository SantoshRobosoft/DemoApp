//
//  PGImageViewController.m
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 25/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "PGImageViewController.h"

@interface PGImageViewController ()

@property (strong,nonatomic) PGContentView *contentView;

@property (strong,nonatomic) UIPageViewController* pageViewController;
@property (weak, nonatomic) IBOutlet UIView *pageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation PGImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurePageView];
    
}
- (void) configurePageView {
    self.pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:UIPageViewControllerOptionInterPageSpacingKey]];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    PGContentView *contentView = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"contentView"];
    [contentView doSetImageFromUrl:[_album.imageArray objectAtIndex:_imageIndex]];
    [self.pageViewController setViewControllers:@[contentView] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil
     ];
    
    [self addChildViewController:self.pageViewController];
    self.pageViewController.view.frame = self.pageView.bounds;
    [self.pageView addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    //NSInteger currentIndex = _imageIndex ;
    NSInteger index= ((PGImageViewController*) viewController).imageIndex;
    if (index == 0) {
        
        return nil;
    } else {
        index --;
        return [self viewControllerAtIndex:index];
    }
    
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index= ((PGImageViewController*) viewController).imageIndex;
    if (index == _album.imageArray.count -1) {
        return nil;
    }else {
        index++;
        return [self viewControllerAtIndex:index];
    }
    

}
- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    PGContentView *contentView = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"contentView"];
    [contentView doSetImageFromUrl:[_album.imageArray objectAtIndex:index]];
    return contentView;
}
@end
