//
//  ApplicationOverviewViewModelTests.swift
//  TheMovieDB_MVVM
//
//  Created by Paulo Gama on 04/08/17.
//  Copyright © 2017 Paulo Gama. All rights reserved.
//

import XCTest

@testable import TheMovieDB_MVVM

class ApplicationOverviewViewModelTests: XCTestCase {
    
    let application = Application(name: "Snake VS Block",
                                  author: "Voodoo",
                                  art: "http://is2.mzstatic.com/image/thumb/Purple118/v4/c2/95/c3/c295c3d3-38eb-8213-f0f1-49b8d5fc63c1/source/200x200bb.png")
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testReturnsValidViewModel() {
        let applicationViewModel = ApplicationOverviewViewModel()
        
        applicationViewModel.apps.append(application)

        XCTAssertEqual(applicationViewModel.apps.count, 1)
    }
    
    func testReturnsValidDataSource() {
        let application2 = Application(name: "Palavra Guru",
                                      author: "Zentertain Ltd.",
                                      art: "http://is1.mzstatic.com/image/thumb/Purple127/v4/86/7a/46/867a461e-54bd-44dc-93a3-5405bc0a8731/source/200x200bb.png")
        
        let applicationViewModel = ApplicationOverviewViewModel()
        
        applicationViewModel.apps.append(application)
        applicationViewModel.apps.append(application2)
        
        let indexPath = IndexPath(row: 1, section: 0)
        
        XCTAssertEqual(2, applicationViewModel.numberOfItemsToDisplay(in: 0))
        XCTAssertEqual(applicationViewModel.apps[1].name, applicationViewModel.appNameToDisplay(for: indexPath))
        XCTAssertEqual(applicationViewModel.apps[1].author, applicationViewModel.appAuthorToDisplay(for: indexPath))
        XCTAssertEqual(applicationViewModel.apps[1].art, applicationViewModel.appArtToDisplay(for: indexPath))
    }
    
    
}
