//
//  ApplicationOverview.swift
//  TheMovieDB_MVVM
//
//  Created by Paulo Gama on 01/08/17.
//  Copyright © 2017 Paulo Gama. All rights reserved.
//

import UIKit

class ApplicationOverviewViewModel: NSObject {

    @IBOutlet var apiClient: APIClient!
    
    var apps = [Application]()
    
    func getApps(completion: @escaping () -> Void) {
        apiClient.fetchAppList { [weak self] (appsArray) in
            DispatchQueue.main.async {
                if let appsArray = appsArray {
                    self?.parseArray(appsArray)
                    completion()
                }
            }
        }
        
    }
    
    fileprivate func parseArray(_ arrayDictionary: [NSDictionary]) {
        for dictionary in arrayDictionary {
            if let application = Application(dictionary: dictionary) {
                apps.append(application)
            }
        }
    }
    
    func numberOfItemsToDisplay(in section: Int) -> Int {
        return apps.count 
    }
    
    func appNameToDisplay(for indexPath: IndexPath) -> String {
        return apps[indexPath.row].name
    }

    func appAuthorToDisplay(for indexPath: IndexPath) -> String {
        return apps[indexPath.row].author
    }
    
    func appArtToDisplay(for indexPath: IndexPath) -> String {
        return apps[indexPath.row].art
    }
    
}
