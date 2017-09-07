//
//  Protocols.swift
//  protocol extension
//
//  Created by HASSAN RAZA on 15/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit


protocol ReusableView : class { }

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier:String {
        return String(describing: self)
    }
}


