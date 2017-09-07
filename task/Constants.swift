//
//  Constants.swift
//  task
//
//  Created by HASSAN RAZA on 22/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import Foundation

enum HttpResult {
    case success(BaseResponseModel)
    case error(ErrorModel)
}

enum ResponseStatus : Int {
    case ok             = 200
    case badRequest     = 400
    case serverError    = 500
}

enum ContentType : String {
    case json       = "application/json; charset=utf-8"
    case urlEncoded = "application/x-www-form-urlencoded"
}

enum ImageQuality : String{
    case w92    = "w92"
    case w185   = "w185"
    case w500   = "w500"
    case w780   = "w780"
}

struct Constants {
    
    static let moviePosterPlaceholder = "poster-placeholder.png"
    
    struct Domain {
        static let BaseURL = "http://api.themoviedb.org/3/"
        static let ImageBaseUrl = "http://image.tmdb.org/t/p/"
    }
    
}
