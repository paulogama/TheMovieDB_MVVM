//
//  ApplicationOverview.swift
//  TheMovieDB_MVVM
//
//  Created by Paulo Gama on 01/08/17.
//  Copyright © 2017 Paulo Gama. All rights reserved.
//

import UIKit

class ApplicationOverviewViewModel: NSObject, ApplicationViewModel {

    @IBOutlet var apiClient: APIClient!
    
    var apps = [Application]()
    
    func getApps(completion: @escaping () -> Void) {
        apiClient.fetchAppList { [weak self] (appsJSON) in
            DispatchQueue.main.async {
                if let appsJSON = appsJSON {
                    self?.parseJSON(appsJSON)
                    completion()
                }
            }
        }
        
    }
    
    fileprivate func parseJSON(_ jsonArray: [[String: Any]]) {
        do {
            for json in jsonArray {
                let application = try Application(json: json)
                apps.append(application)
            }
        } catch Serialization.missing(let missing) {
            print("Data '\(missing)' is missing")
        } catch {
            print("General error: \(error.localizedDescription)")
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
