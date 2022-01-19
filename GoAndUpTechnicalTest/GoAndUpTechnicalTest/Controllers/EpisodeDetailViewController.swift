//
//  EpisodeDetailViewController.swift
//  GoAndUpTechnicalTest
//
//  Created by Dimitri CADARS on 19/01/2022.
//

import Foundation
import UIKit

class EpisodeDetailViewController: UIViewController {
    
    var episodeViewModel: EpisodeViewModel?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airtimeLabel: UILabel!
    @IBOutlet weak var airdateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    private func setUpInfo() {
        self.nameLabel.text = episodeViewModel?.name
        self.runtimeLabel.text = episodeViewModel?.runtime
        self.airtimeLabel.text = episodeViewModel?.airtime
        self.airdateLabel.text = episodeViewModel?.airdate
        self.descriptionLabel.text = episodeViewModel?.summary.html2String
        
        if let imageOriginal = episodeViewModel?.imageOriginal {
            self.episodeImageView.sd_setImage(with: URL(string: imageOriginal), placeholderImage: UIImage(named: "placeholder.png"))
        }
    }
    
    @IBAction func URLAction(_ sender: Any) {
        if let url = URL(string: episodeViewModel!.url) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func Share(_ sender: Any) {
        
        let firstActivityItem = "Share URL"

        let secondActivityItem : NSURL = NSURL(string: episodeViewModel!.url)!

        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [firstActivityItem, secondActivityItem], applicationActivities: nil)
            
        activityViewController.activityItemsConfiguration = [
            UIActivity.ActivityType.message,
            UIActivity.ActivityType.mail,
            UIActivity.ActivityType.airDrop,
            UIActivity.ActivityType.postToTwitter,
            UIActivity.ActivityType.postToFacebook
        ] as? UIActivityItemsConfigurationReading
        
        activityViewController.isModalInPresentation = true
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}
