//
//  TableViewCellExtension.swift
//  protocol extension
//
//  Created by HASSAN RAZA on 15/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    class func instance<T:TableViewCell>() -> T where T:NibLoadable, T:ReusableView{
        
        return T.loadNib()
    }
}
