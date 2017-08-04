//
//  UIImageView+URL.swift
//  TheMovieDB_MVVM
//
//  Created by Paulo Gama on 03/08/17.
//  Copyright © 2017 Paulo Gama. All rights reserved.
//

import UIKit

extension UIImageView {
    
    fileprivate func downloadFrom(url: URL) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
        }.resume()
        
    }
 
    func downloadFrom(url: String) {
        guard let url = URL(string: url) else { return }
        downloadFrom(url: url)
    }
}
