//
//  ApplicationTableViewCell.swift
//  TheMovieDB_MVVM
//
//  Created by Paulo Gama on 01/08/17.
//  Copyright © 2017 Paulo Gama. All rights reserved.
//

import UIKit

class ApplicationTableViewCell: UITableViewCell {

    @IBOutlet weak var artImageView: UIImageView!
    @IBOutlet weak var applicationLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
