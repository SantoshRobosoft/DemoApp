//
//  ViewController.m
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 24/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray *arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self doParse];
    self.page=0;
    self.imageArray=_arr;
}
#pragma mark - utility method

/**
    @brief This Method is Responsible to parse the JSON data and stores in model Class
 
 */
- (void)doParse {
    NSError *error=nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"albums"
                                                         ofType:@"json"];
    NSData *dataFromFile = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:dataFromFile
                                                         options:kNilOptions
                                                           error:&error];
    if (error != nil) {
        NSLog(@"Error: was not able to load messages.");
    } else {
        self.arr = [[NSMutableArray alloc]init];
        PGAlbums *albumsObj=[[PGAlbums alloc]init];
        self.albums=[albumsObj initWithAlbum:data];
        for (PGAlbumDetails *pg in self.albums.albumArray) {
        [self.arr addObject:[[pg imageArray] objectAtIndex:0]];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - CollectonViewDatasource()
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_imageArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PGAlbumsCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"albumsCell" forIndexPath:indexPath];
//    UICollectionViewFlowLayout *layout = (id) self.albumsCollectionView.collectionViewLayout;
//    layout.itemSize = self.albumsCollectionView.frame.size;
    [cell.cellactivityIndicator startAnimating];
    PGAlbumDetails *album=[self.albums.albumArray objectAtIndex:indexPath.row];
    NSString * imageURL=[_imageArray objectAtIndex:indexPath.row];
    [cell configureCell:imageURL];
    if (_page==0) {
        [cell.albumName setHidden:NO];
        [cell.imageCount setHidden:NO];
        [cell.imageDesc setHidden:YES];
        cell.imageCount.text=[NSString stringWithFormat:@"%lu",(unsigned long)[[album imageArray] count]];
        cell.albumName.text=[album title];
    } else if(_page==2) {
        [cell.albumName setHidden:YES];
        [cell.imageCount setHidden:YES];
        [cell.imageDesc setHidden:NO];
        cell.imageDesc.text =[[NSString stringWithFormat:@" %ld ",(long)(indexPath.row+1)] stringByAppendingFormat:@"/%ld",(long)_imageArray.count];
    } else {
        [cell.albumName setHidden:YES];
        [cell.imageCount setHidden:YES];
        [cell.imageDesc setHidden:YES];
    }
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_page==0) {
        PGAlbumDetails *pgalbum=[self.albums.albumArray objectAtIndex:indexPath.row];
        NSMutableArray *array=[[NSMutableArray alloc]initWithArray:[pgalbum imageArray]];
        self.imageArray=array;
        self.page=1;
        [self.albumsCollectionView reloadData];
    } else if(_page==1) {
        self.page = 2;
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        [self.albumsCollectionView setCollectionViewLayout:flowLayout];
        [self.albumsCollectionView reloadData];
    } else {
        
    }
}
#pragma mark - UICollectionViewDelegateFlowLayout()
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_page==0) {
        if (indexPath.row==0) {
            return CGSizeMake(390, 200);
//            return CGSizeMake(self.albumsCollectionView.bounds.size.width, self.albumsCollectionView.bounds.size.width/2);
        } else {
            return CGSizeMake(192, 200);
        }
    } else if (_page==1) {
        //self.page=2;
        return CGSizeMake(192, 200);
    } else {
        return CGSizeMake(390, 450);
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}
/**
    @brief This method is responsible for Moving back from each page
 */
- (IBAction)didtapBack:(UIBarButtonItem *)sender {
    if (_page==2) {
        self.page=1;
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        [self.albumsCollectionView setCollectionViewLayout:flowLayout];
        [self.albumsCollectionView reloadData];
    } else if (_page==1){
        self.page=0;
        self.imageArray=_arr;
        [self.albumsCollectionView reloadData];
    } else {
        self.page=0;
    }
}
@end
