//
//  MovieCollectionViewCell.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/06/29.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var moviePoster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    func configureCell() {
        moviePoster?.layer.cornerRadius = 10
        moviePoster?.clipsToBounds = true
        setNeedsLayout()
    }
    
    func setImage(posterImageURLString: String) {
        moviePoster.load(fromStringURL: posterImageURLString)
      
    }
}
