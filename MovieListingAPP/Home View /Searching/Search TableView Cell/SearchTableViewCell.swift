//
//  SearchTableViewCell.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/07/05.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet private var movieImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populateCell(with title: String,imageURl: String) {
        movieImage.load(fromStringURL: imageURl)
        movieTitle.text = title
    }

}
