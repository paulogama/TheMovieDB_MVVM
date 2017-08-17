//
//  NibLoadableView.swift
//  TheMovieDB_MVVM
//
//  Created by Paulo Gama on 16/08/17.
//  Copyright © 2017 Paulo Gama. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
