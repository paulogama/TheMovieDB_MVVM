//
//  Application.swift
//  TheMovieDB_MVVM
//
//  Created by Paulo Gama on 01/08/17.
//  Copyright © 2017 Paulo Gama. All rights reserved.
//

import Foundation

enum Serialization: Error {
    case missing(String)
    case invalid(String, Any)
}

struct Application {
    
    let name: String
    let author: String
    let art: String
    
}

extension Application {
    
    init(json: [String: Any]) throws {
        
        guard let name = json["name"] as? String else {
            throw Serialization.missing("name")
        }
        
        guard let author = json["artistName"] as? String else {
            throw Serialization.missing("artistName")
        }
        
        guard let art = json["artworkUrl100"] as? String else {
            throw Serialization.missing("artworkUrl100")
        }
        
        self.name = name
        self.author = author
        self.art = art
    }
    
}
