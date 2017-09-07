//
//  TableViewCell.swift
//  SellupAlpha
//
//  Created by HASSAN RAZA on 16/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell , NibLoadable, ReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
