//
//  MovieListModel.swift
//  task
//
//  Created by HASSAN RAZA on 22/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

class MovieListModel: BaseListModel
{
    
    var movies:[CellRepresentable] = []
    
    var results:NSArray = NSArray() {
        willSet(newValue){
            for object in newValue {
                movies.append(MovieViewModel(WithModel: Movie(WithDictionary: object as! Dictionary<String, AnyObject>)))
            }
        }
    }
}
