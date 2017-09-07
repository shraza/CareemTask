//
//  BaseView.swift
//  task
//
//  Created by HASSAN RAZA on 22/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

class BaseView: UIView{

    @IBInspectable var borderWidth:CGFloat = 0
    @IBInspectable var borderColor:UIColor = UIColor.clear
    @IBInspectable var cornerRadius:CGFloat = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if borderWidth > 0 {
            self.layer.borderWidth = self.borderWidth
            self.layer.borderColor = self.borderColor.cgColor
        }
        
        if self.cornerRadius > 0 {
            self.layer.cornerRadius = self.cornerRadius
            self.clipsToBounds = true
        }
    }
}
