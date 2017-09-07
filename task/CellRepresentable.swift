//
//  CellRepresentable.swift
//  task
//
//  Created by HASSAN RAZA on 14/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

protocol CellRepresentable {
    
    var height:CGFloat {get}
    func cell(ForTableView tableView:UITableView, AtIndexPath indexPath:IndexPath) -> UITableViewCell
}
