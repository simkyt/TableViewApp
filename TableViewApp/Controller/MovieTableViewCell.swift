//
//  MovieTableViewCell.swift
//  TableViewApp
//
//  Created by Arkadijs Makarenko on 27/10/2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var moviewImageView: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
