//
//  File.swift
//  movieflix
//
//  Created by miguel tomairo on 18/03/22.
//

import UIKit
import Kingfisher

class RelatedMovieViewController: UIViewController {
    let baseUrl = "https://image.tmdb.org/t/p/w185/"
    var movieViewModel = MovieViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension RelatedMovieViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieViewModel.similarMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RelatedMovies", for: indexPath) as? RelatedMovieCell else { return UICollectionViewCell() }        
        guard let posterPath = movieViewModel.similarMovies[indexPath.row].posterPath else {return UICollectionViewCell() }
        let url = URL(string: "\(baseUrl)\(posterPath)")
        cell.RelatedMovieImg.kf.setImage(with: url)
        return cell
    }
    
}

extension RelatedMovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 600)
    }
}

class RelatedMovieCell: UICollectionViewCell {
    @IBOutlet weak var RelatedMovieImg: UIImageView!
}
