//
//  ImageLoader.swift
//  SwiftUIVK
//


import Foundation
import UIKit

class ImageLoader {
    
    func getImage(_ imageURL: String) -> UIImage {
        if let data = try? Data(contentsOf: URL(string: imageURL)!) {
         return UIImage(data: data)!
        } else {
            return UIImage(named: "noImage")!
        }
    }
    
    func getPhotoCollection (_ photoCollection: [Photo]) -> [UIImage] {
        var uiImagesArray = [UIImage]()
        
        for photo in photoCollection {
            let image = self.getImage(photo.url)
            uiImagesArray.append(image)
        }
        return uiImagesArray
    }
}
