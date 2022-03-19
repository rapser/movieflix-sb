//
//  File.swift
//  movieflix
//
//  Created by miguel tomairo on 18/03/22.
//

import UIKit
import Kingfisher
import AVFoundation

class DetailViewController: UIViewController {

    @IBOutlet weak var genresCollectionView: UICollectionView!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImg: UIImageView!

    var movieViewModel = MovieViewModel.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNetwork()
        settingUpUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func prepareNetwork(){
        MovieViewModel.shared.genres = []
        MovieViewModel.shared.fetchMovieDetail{
            self.genresCollectionView.reloadData()
        }
        MovieViewModel.shared.fetchVideo{}
        MovieViewModel.shared.fetchSimilarMovies{}
        
    }
    
    func settingUpUI(){
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        print(movieViewModel.movies.count)
        movieTitle.text = movieViewModel.movies[movieViewModel.fetchMovieIndex()].title
        movieOverview.text = movieViewModel.movies[movieViewModel.fetchMovieIndex()].overview

        let imagePath = movieViewModel.movies[movieViewModel.fetchMovieIndex()].posterPath!
        let url = URL(image: imagePath)
        movieImg.kf.setImage(with: url)
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        guard let key = movieViewModel.video.first?.key else {
            return
        }
//        let movieKey = "https://www.youtube.com/watch?v=\(key)"
//        let url = URL(string: movieKey)!
//        let item = AVPlayerItem(url: url)
        print(key)
        
        let sb = UIStoryboard(name: "Player", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "PlayerViewController") as! PlayerViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
}

extension DetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieViewModel.genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenresCell", for: indexPath) as? GenresCollectionViewCell else { return UICollectionViewCell() }
        cell.gernes.text = movieViewModel.genres[indexPath.row].name
        return cell
    }
    
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 48)
    }
}

