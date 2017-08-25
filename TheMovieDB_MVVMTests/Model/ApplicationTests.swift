//
//  ApplicationTests.swift
//  TheMovieDB_MVVM
//
//  Created by Paulo Gama on 17/08/17.
//  Copyright © 2017 Paulo Gama. All rights reserved.
//

import XCTest

@testable import TheMovieDB_MVVM

class ApplicationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testInitializeWithValidDict() {
        let dictApplication = [
            "name": "NameTest",
            "artistName": "ArtistNameTest",
            "artworkUrl100": "ArtWorkURLTest"
        ]
        
        do {
            let application = try Application(json: dictApplication)
            XCTAssertEqual(application.name, "NameTest")
        } catch {
            XCTFail()
        }
    }
    
}
