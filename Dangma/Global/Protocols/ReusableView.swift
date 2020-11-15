//
//  ReusableView.swift
//  Dangma
//
//  Created by 오준현 on 2020/11/14.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

