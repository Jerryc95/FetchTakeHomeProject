//
//  ImageCache.swift
//  FetchTakeHomeProject
//
//  Created by Jerry Cox on 1/7/25.
//

import SwiftUI

class ImageCache {
    static let shared = ImageCache()
    
    private let imageCache = NSCache<NSString, UIImage>()
    private let fileManager = FileManager.default
    
    func getImage(from url: String) -> UIImage? {
        imageCache.object(forKey: url as NSString)
    }
    
    func setImage(image: UIImage, for url: String) {
        imageCache.setObject(image, forKey: url as NSString)
    }
}
