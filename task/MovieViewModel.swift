//
//  MovieViewModel.swift
//  task
//
//  Created by HASSAN RAZA on 21/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit

class MovieViewModel: BaseViewModel, CellRepresentable {

    var moviePoster:String
    var movieName:String
    var movieReleaseDate:String
    var movieOverview:String
    
    var height: CGFloat = UITableViewAutomaticDimension
    
    required init(WithModel model: BaseModel) {
        
        let movie = model as! Movie
        
        self.moviePoster = Constants.Domain.ImageBaseUrl + ImageQuality.w92.rawValue + movie.poster_path
        self.movieName   = movie.title
        self.movieReleaseDate = movie.release_date
        self.movieOverview = movie.overview
        
        super.init(WithModel: model)
    }
    
    func cell(ForTableView tableView: UITableView, AtIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as MovieCell
        cell.loadMovie(self)
        return cell
    }
}
