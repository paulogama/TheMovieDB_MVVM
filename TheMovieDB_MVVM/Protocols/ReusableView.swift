//
//  ReusableView.swift
//  TheMovieDB_MVVM
//
//  Created by Paulo Gama on 16/08/17.
//  Copyright © 2017 Paulo Gama. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
