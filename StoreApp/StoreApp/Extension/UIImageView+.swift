//
//  UIImageView.swift
//  StoreApp
//
//  Created by 이청원 on 2021/02/03.
//

import UIKit

extension UIImageView {
    func setImageUrl(_ url: String) {
        let cacheKey = NSString(string: url)
        
        if let cachedImage = ImageCacheManager.shared.object(forKey: cacheKey) {
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            if let imageUrl = URL(string : url) {
                URLSession.shared.dataTask(with: imageUrl) {
                    (data, rse, err) in
                    if let _ = err {
                        DispatchQueue.main.async {
                            self.image = UIImage()
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        if let data = data, let image = UIImage(data:data) {
                            ImageCacheManager.shared.setObject(image, forKey: cacheKey)
                            self.image = image
                        }
                    }
                }.resume()
            }
        }
    }
}
