//
//  LandmarkTableViewCell.swift
//  Landmaks
//
//  Created by RASHED on 5/24/24.
//

import UIKit

class LandmarkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var landMarkBackgroundView: UIView!
    @IBOutlet weak var landMarkImage: UIImageView!
    @IBOutlet weak var landMarkTitleLabel: UILabel!
    @IBOutlet weak var landmarkSubtitleLabel: UILabel!
    
    var landmark: Landmark? {
        didSet {
            landMarkDetailsConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        landMarkBackgroundView.layer.cornerRadius = 15
        landMarkBackgroundView.backgroundColor = .systemGray6
        landMarkImage.clipsToBounds = true
        landMarkImage.layer.cornerRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func landMarkDetailsConfiguration() {
        guard let landmark = landmark else {
            return
        }
        
        landMarkTitleLabel.text = landmark.name
        landmarkSubtitleLabel.text = landmark.subtitle
        
        if let image = UIImage(named: landmark.imageName) {
            landMarkImage.image = image
        }
    }
}
