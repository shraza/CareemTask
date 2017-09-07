//
//  SearchQuery.swift
//  task
//
//  Created by HASSAN RAZA on 22/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

class SearchSuggession: BaseModel {

    var query: String
    var date:Double
    
    init(query:String , date:Double) {
        
        self.query = query
        self.date = date
    }
}
