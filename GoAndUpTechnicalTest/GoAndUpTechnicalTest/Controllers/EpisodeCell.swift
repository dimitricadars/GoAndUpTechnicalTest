//
//  EpisodeCell.swift
//  GoAndUpTechnicalTest
//
//  Created by Dimitri CADARS on 19/01/2022.
//

import Foundation
import UIKit
import SDWebImage

class EpisodeCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    
    func configure(vm: EpisodeViewModel) {
        self.nameLabel.text = vm.name
        self.seasonLabel.text = vm.season
        self.numberLabel.text = vm.number
        self.episodeImageView.sd_setImage(with: URL(string: vm.imageOriginal), placeholderImage: UIImage(named: "placeholder.png"))
    }
}
