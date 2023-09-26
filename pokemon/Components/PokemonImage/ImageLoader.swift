//
//  ImageLoader.swift
//  URLImageDemo
//
//  Created by Mohammad Azam on 6/17/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class ImageLoader: ObservableObject {
    
    @Published var downloadedData: Data?
    @Published var isLoading: Bool = true
    
    func downloadImage(url: String) {
        
        self.isLoading = true
        
        guard let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
           
            guard let data = data, error == nil else {
                self.isLoading = false
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = data
                self.isLoading = false
            }
            
        }.resume()
        
    }
    
}
