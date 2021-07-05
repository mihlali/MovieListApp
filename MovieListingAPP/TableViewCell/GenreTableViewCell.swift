//
//  GenreTableViewCell.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/07/02.
//

import UIKit

protocol collectionViewCellDelegate: class {
    func collectionViewCellTapped(at index: Int, selectedMovie movie: Movie)
}

class GenreTableViewCell: UITableViewCell {
    
    @IBOutlet private var collectionView: UICollectionView!
    private var movielist: [Movie]?
    private weak var delegate: collectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCollectionViewCell")
    }
    func set(delegate: collectionViewCellDelegate) {
        self.delegate = delegate
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
        delegate?.collectionViewCellTapped(at: indexPath.row, selectedMovie: (movielist?[indexPath.row])!)
    }
}
