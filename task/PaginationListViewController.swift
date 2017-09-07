//
//  PaginationListViewController.swift
//  task
//
//  Created by HASSAN RAZA on 06/09/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

class PaginationListViewController: BaseServiceController {

    var currentPage: Int = 1
    var totalPages: Int = 0
    var totalResults:Int = 0
    var shouldLoadMore: Bool {
        return currentPage < totalPages
    }
    var nextPage:Int {
        return currentPage + 1
    }
    
    func resetPaging() {
        currentPage = 1
        totalPages = 0
        totalResults = 0
    }
    
}
