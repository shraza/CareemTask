//
//  TableViewExtension.swift
//  protocol extension
//
//  Created by HASSAN RAZA on 15/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

extension UITableView
{
    func register<T: TableViewCell>(_: T.Type) where T: ReusableView, T:NibLoadable {
        
        let nib = UINib(nibName: T.NibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T:TableViewCell>(forIndexPath indexPath:IndexPath) -> T where T:ReusableView
    {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            return T.instance()
        }
        
        return cell
    }
    
    func dequeueReusableCell<T:UITableViewCell>(forIndexPath indexPath:IndexPath, style:UITableViewCellStyle) -> T
    {
        guard let cell = self.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self)) as? T else {
            return UITableViewCell(style: style, reuseIdentifier: NSStringFromClass(UITableViewCell.self)) as! T
        }
        
        return cell
    }
}
