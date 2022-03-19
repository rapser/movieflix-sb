//
//  File.swift
//  movieflix
//
//  Created by miguel tomairo on 18/03/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ item : Movie){
        movieTitle.text = item.title
        let url = URL(image: item.posterPath!)
        movieImg.kf.setImage(with: url)
        
        guard let fecha = item.releaseDate, let popularidad = item.popularity else {return}
        movieReleaseDate.text = "Fecha : \(fecha)"
        movieDirector.text = "Popularidad: \(popularidad)"
        
    }
}
