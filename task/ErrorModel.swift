//
//  ErrorModel.swift
//  task
//
//  Created by HASSAN RAZA on 22/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

class ErrorModel: NSObject {

    var exception:String
    var status: ResponseStatus
    
    init(WithErrorMessage message:String, statusCode:Int) {
        
        self.exception = message
        self.status = ResponseStatus(rawValue: statusCode) ?? .badRequest
    }
}
