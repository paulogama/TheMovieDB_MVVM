//
//  ApplicationViewModel.swift
//  TheMovieDB_MVVM
//
//  Created by Paulo Gama on 08/08/17.
//  Copyright © 2017 Paulo Gama. All rights reserved.
//

import Foundation

protocol ApplicationViewModel {

    var apiClient: APIClient! { get }
    var apps: [Application] { get }
    
    func getApps(completion: @escaping () -> Void)
    func numberOfItemsToDisplay(in section: Int) -> Int
    func appNameToDisplay(for indexPath: IndexPath) -> String
    func appAuthorToDisplay(for indexPath: IndexPath) -> String
    func appArtToDisplay(for indexPath: IndexPath) -> String
    
}
