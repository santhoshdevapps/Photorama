//
//  PhotosViewController.swift
//  Photorama
//
//  Created by santhosh damodharan on 2018-03-12.
//  Copyright © 2018 santhosh damodharan. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var store : PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchInterstingPhotos{
            (photosResult)  -> Void in
            switch photosResult{
            case let .success(photos): print("successfully found \(photos.count) photos.")
            
            if let firstPhoto = photos.first{
                self.updateImageView(for: firstPhoto)
                }
                
            case let .failure(error):
                print("Error fetching interesting photos:  \(error)")
            }
            
        }
        
    }

    func updateImageView(for photo: Photo){
        store.fetchImage(for: photo){
            (imageResult) -> Void in
            
            switch imageResult {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error downloading image: \(error)")
            }
        }
    }

}
