//
//  Application.swift
//  TheMovieDB_MVVM
//
//  Created by Paulo Gama on 01/08/17.
//  Copyright © 2017 Paulo Gama. All rights reserved.
//

import Foundation

class Application {
    
    var name: String
    var author: String
    var art: String
    
    init(name: String, author: String, art: String) {
        self.name = name
        self.author = author
        self.art = art
    }
    
    convenience init?(dictionary: NSDictionary) {
        guard let name = dictionary["name"] as? String else { return nil }
        guard let author = dictionary["artistName"] as? String else { return nil }
        guard let art = dictionary["artworkUrl100"] as? String else { return nil }
        
        self.init(name: name, author: author, art: art)
    }
    
}
