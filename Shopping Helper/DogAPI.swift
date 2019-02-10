//
//  DogAPI.swift
//  Shopping Helper
//
//  Created by Sean Lin on 2019/2/8.
//  Copyright © 2019 Sean Lin. All rights reserved.
//

import Foundation
import UIKit

class DogAPI{
    enum Endpoint : String{
        case randomImageFromAllDogsCollection = "https://dog.ceo/api/breeds/image/random"
        
        var url:URL {
            return URL(string: self.rawValue)!
        }
    }
    
    class func requestImageFile(url:URL, completionHandler:@escaping (UIImage?,Error?)-> Void){
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else {
                completionHandler(nil,error)
                return
            }
            let downloadImage = UIImage(data: data)
            completionHandler(downloadImage,nil)
        })
        task.resume()
    }
    
    class func requestRandomImage(completionHandler: @escaping (DogImage?,Error?)-> Void){
        let randomImageEndpoint = DogAPI.Endpoint.randomImageFromAllDogsCollection.url
        let task = URLSession.shared.dataTask(with: randomImageEndpoint) { (data, response, error) in
            guard let data = data else{
                completionHandler(nil,error)
                return
            }
            
            
            let decoder = JSONDecoder()
            let imageData = try! decoder.decode(DogImage.self, from: data)
            completionHandler(imageData,nil)

        }
        task.resume()
    }
}
