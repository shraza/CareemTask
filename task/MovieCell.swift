//
//  MovieCell.swift
//  task
//
//  Created by HASSAN RAZA on 22/08/2017.
//  Copyright © 2017 HASSAN RAZA. All rights reserved.
//

import UIKit
import MapleBacon

class MovieCell: TableViewCell {

    @IBOutlet weak var imgMoviePoster: UIImageView!
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblMovieReleaseDate: UILabel!
    @IBOutlet weak var lblMovieOverview: UILabel!
    
    func loadMovie(_ movieViewModel:MovieViewModel) {

        self.lblMovieTitle.text = movieViewModel.movieName
        self.lblMovieOverview.text = movieViewModel.movieOverview
        self.lblMovieReleaseDate.text = movieViewModel.movieReleaseDate
        
        if let imageUrl = URL(string: movieViewModel.moviePoster), let placeholder = UIImage(named: Constants.moviePosterPlaceholder) {
            self.imgMoviePoster.setImage(withUrl: imageUrl, placeholder: placeholder)
        }
    }
}
