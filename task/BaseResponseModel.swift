//
//  BaseResponseModel.swift
//  task
//
//  Created by HASSAN RAZA on 22/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

class BaseResponseModel: BaseModel {

    var id:Int = 0
    
    required override init() {
        super.init()
    }
    
    required init(WithDictionary dictionary:Dictionary<String, AnyObject>) {
        super.init()
        self.setValuesForKeys(dictionary)
    }
}
