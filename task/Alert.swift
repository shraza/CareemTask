
//
//  Alert.swift
//  task
//
//  Created by HASSAN RAZA on 07/09/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

class Alert: NSObject {

    class func show(_ title:String?, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        AppDelegate.instance().window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
