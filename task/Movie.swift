//
//  MovieResponse.swift
//  task
//
//  Created by HASSAN RAZA on 21/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

class Movie: BaseResponseModel {

    var vote_count: Int = 0
    var video:Bool = false
    var vote_average:CGFloat = 0.0
    var title:String = ""
    var popularity: CGFloat = 0.0
    var poster_path:String = ""
    var original_language: String = ""
    var original_title: String = ""
    var genre_ids: NSArray = NSArray()
    var backdrop_path: String = ""
    var adult: Bool = false
    var overview:String = ""
    var release_date: String = ""
    
}
