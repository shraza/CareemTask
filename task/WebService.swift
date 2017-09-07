//
//  Service.swift
//  task
//
//  Created by HASSAN RAZA on 22/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

class WebService : NSObject
{
    func getMovies(ForTitle title:String, page:Int, completion:@escaping Completion) {
        
        let restendFacade = RestAPIFacade(
            
            requestType: "search/movie",
            responseType: MovieListModel.self,
            requestMethod: .get,
            headers: nil,
            data: nil,
            params: "api_key=2696829a81b1b5827d515ff121700838&query=\(title)&page=\(page)"
        )
        
        restendFacade.executeRequest(WithCompletion: completion)
    }
}
