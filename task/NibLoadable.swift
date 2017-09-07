//
//  NibLoadable.swift
//  protocol extension
//
//  Created by HASSAN RAZA on 15/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

protocol NibLoadable : class { }

extension NibLoadable where Self: UIView {
    
    static var NibName:String {
        return String(describing: self)
    }
    
    static func loadNib<T:UIView>() -> T where T:NibLoadable {
        
        guard let view = Bundle.main.loadNibNamed(T.NibName, owner: self, options: nil)?[0] as? T else {
            fatalError("Could not load Cell with Nib Name: \(T.NibName)")
        }
        
        return view
    }
}
