//
//  ApplicationViewController.swift
//  TheMovieDB_MVVM
//
//  Created by Paulo Gama on 01/08/17.
//  Copyright © 2017 Paulo Gama. All rights reserved.
//

import UIKit

let cellIdentifier = "ApplicationTableViewCell"

class ApplicationViewController: UIViewController {

    @IBOutlet weak var applicationsTableView: UITableView!
    @IBOutlet var applicationViewModel: ApplicationOverviewViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        adjustTableView()
        
        applicationViewModel.getApps {
            self.applicationsTableView.reloadData()
        }
    }
    
    func adjustTableView() {
        applicationsTableView.register(UINib(nibName: "ApplicationTableViewCell", bundle: nil),
                                       forCellReuseIdentifier: cellIdentifier)

        applicationsTableView.rowHeight = UITableViewAutomaticDimension
        applicationsTableView.estimatedRowHeight = 71
    }

}

extension ApplicationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applicationViewModel.numberOfItemsToDisplay(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ApplicationTableViewCell
        
        cell.artImageView.downloadFrom(url: applicationViewModel.appArtToDisplay(for: indexPath))
        cell.applicationLabel.text = applicationViewModel.appNameToDisplay(for: indexPath)
        cell.authorLabel.text = applicationViewModel.appAuthorToDisplay(for: indexPath)
        
        return cell
    }
    
}
