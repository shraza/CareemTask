//
//  ViewControllerExtension.swift
//  task
//
//  Created by HASSAN RAZA on 22/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

extension UIView
{
    func showHUD() {
        self.showToast(self)
    }
    
    func hideHUD() {
        self.hideAllToasts()
    }
}
