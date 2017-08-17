//
//  ApplicationTableViewCell.swift
//  TheMovieDB_MVVM
//
//  Created by Paulo Gama on 01/08/17.
//  Copyright © 2017 Paulo Gama. All rights reserved.
//

import UIKit

class ApplicationTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var artImageView: UIImageView!
    @IBOutlet weak var applicationLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
