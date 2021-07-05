//
//  MovieDetailViewController.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/07/04.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet var backDropImageView: UIImageView!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleAndRatingLabel: UILabel!
    @IBOutlet var yearLengthDirectorLabel: UILabel!
    @IBOutlet var castLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    private var movie: Movie!
    
    private lazy var viewModel = MovieDetailsViewModel(movie: movie)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func set(movie: Movie) {
        self.movie = movie
    }
    
    func configureUI() {
        backDropImageView.load(fromStringURL: viewModel.backDropimageURl)
        posterImageView.load(fromStringURL: viewModel.posterImageURL)
        titleAndRatingLabel.text = viewModel.posterTitle
        yearLengthDirectorLabel.text = viewModel.yearLengthDirector
        castLabel.text = viewModel.cast
        descriptionLabel.text = viewModel.description
    }
}
