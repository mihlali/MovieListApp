//
//  GenreTableViewCell.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/07/02.
//

import UIKit

class GenreTableViewCell: UITableViewCell {

    @IBOutlet private var collectionView: UICollectionView!
    private var movielist: [Movie]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCollectionViewCell")
    }
     
    func populateViewWith(movies: [Movie]) {
        self.movielist = movies
    }
}

extension GenreTableViewCell: UICollectionViewDelegate,  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movielist?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        let movie = movielist?[indexPath.row]
        cell.setImage(posterImageURLString: movie?.posterURL ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: 250, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // if the user presses
    }
}
