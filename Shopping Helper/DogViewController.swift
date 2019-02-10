//
//  DogViewController.swift
//  Shopping Helper
//
//  Created by Sean Lin on 2019/2/8.
//  Copyright © 2019 Sean Lin. All rights reserved.
//

import UIKit

class DogViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        DogAPI.requestRandomImage(completionHandler: handleRandomImageResponse(imageData:error:))
    }
    
    func handleRandomImageResponse(imageData:DogImage?,error: Error?){
        guard let imageURL = URL(string: imageData?.message ?? "") else {
            return
        }
        DogAPI.requestImageFile(url: imageURL, completionHandler: self.handleImageFileResponse(image:error:))
    }
    
    func handleImageFileResponse(image:UIImage?,error:Error?){
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    
}
