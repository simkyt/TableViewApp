//
//  DetailViewController.swift
//  TableViewApp
//
//  Created by Arkadijs Makarenko on 27/10/2023.
//

import UIKit

class URLTapGestureRecognizer: UITapGestureRecognizer {
    var urlString: String?
}

class DetailViewController: UIViewController {

    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    @IBOutlet weak var movieDescLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var song: Song?
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let mainSong = song {
            scrollView.isScrollEnabled = false
            trackImageView.image = UIImage(named: mainSong.cover)
            trackNameLabel.text = mainSong.track + "\n\(mainSong.album)"
            movieYearLabel.text = ""
            movieGenreLabel.text = ""
            movieDescLabel.text = ""
        }
        
        if let mainMovie = movie {
            trackImageView.image = UIImage(named: mainMovie.image)
            trackImageView.isUserInteractionEnabled = true
            let tapRecognizer = URLTapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            tapRecognizer.urlString = mainMovie.trailerUrl
            trackImageView.addGestureRecognizer(tapRecognizer)
            
            trackNameLabel.text = mainMovie.title
            movieYearLabel.text = "\(mainMovie.year)"
            movieGenreLabel.text = mainMovie.genre
            movieDescLabel.text = mainMovie.description
            movieDescLabel.sizeToFit()
        }
        
//        let views: [UIView] = [trackImageView, trackNameLabel, movieYearLabel, movieGenreLabel, movieDescLabel]
//        for view in views {
//            view.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//            ])
//        }
    }
    
    @objc func imageTapped(_ recognizer: URLTapGestureRecognizer) {
        guard let imageView = recognizer.view else { return }
        
        UIView.animate(withDuration: 0.1, animations: {
            imageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            imageView.alpha = 0.7
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                imageView.transform = CGAffineTransform.identity
                imageView.alpha = 1.0
            }) { _ in
                if let movieURL = recognizer.urlString, let url = URL(string: movieURL) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
