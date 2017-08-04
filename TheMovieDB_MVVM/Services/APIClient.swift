//
//  APIClient.swift
//  TheMovieDB_MVVM
//
//  Created by Paulo Gama on 02/08/17.
//  Copyright © 2017 Paulo Gama. All rights reserved.
//

import UIKit

class APIClient: NSObject {

    func fetchAppList(completion: @escaping ([NSDictionary]?) -> Void) {
        
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/br/ios-apps/top-free-games/10/explicit/json") else {
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            guard let unwrappedData = data else { print(data ?? "Error getting data"); return }
            
            do {
                if let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData,
                                                                       options: .allowFragments) as? NSDictionary {
                    
                    if let apps = responseJSON.value(forKeyPath: "feed.results") as? [NSDictionary] {
                        completion(apps)
                    }
                    
                }
            } catch {
                completion(nil)
                print("Error getting API data: \(error.localizedDescription)")
            }
        }
        
        dataTask.resume()
        
    }
    
}
