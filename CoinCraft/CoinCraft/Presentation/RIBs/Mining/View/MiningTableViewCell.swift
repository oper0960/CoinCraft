//
//  MiningTableViewCell.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit
import Kingfisher
import Domain

protocol MiningCellDelegate: class {
    func selectedWebsiteButton(index: Int)
    func selectedTwitterButton(index: Int)
}

class MiningTableViewCell: UITableViewCell {
    
    weak var delegate: MiningCellDelegate?
    
    @IBOutlet weak var logoImageView: UIImageViewCustom!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var serverLocationLabel: UILabel!
    @IBOutlet weak var coinsLabel: UILabel!
    @IBOutlet weak var averageFeeLabel: UILabel!
    @IBOutlet weak var poolFeaturesLabel: UILabel!
    @IBOutlet weak var paymentTypeLabel: UILabel!
    @IBOutlet weak var websiteButton: UIButtonCustom!
    @IBOutlet weak var twitterButton: UIButtonCustom!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - Bind
extension MiningTableViewCell {
    func bind(index: Int, datum: MiningViewable) {
        
        self.indicator.startAnimating()
        
        if let imageUrl = URL(string: datum.logoUrl) {
            logoImageView.kf.setImage(with: ImageResource(downloadURL: imageUrl, cacheKey: datum.logoUrl),
                                          placeholder: nil,
                                          options: nil,
                                          progressBlock: nil)
            { result in
                self.indicator.stopAnimating()
            }
        }
        
        websiteButton.tag = index
        twitterButton.tag = index
        
        nameLabel.text = datum.name
        serverLocationLabel.text = datum.serverLocations.joined(separator: ", ")
        coinsLabel.text = datum.coins.joined(separator: ", ")
        averageFeeLabel.text = datum.averageFee
        poolFeaturesLabel.text = datum.poolFeatures.joined(separator: ", ")
        paymentTypeLabel.text = datum.paymentType.joined(separator: ", ")
        
        twitterButton.isEnabled = !datum.twitter.isEmpty
        twitterButton.backgroundColor = !datum.twitter.isEmpty ? #colorLiteral(red: 0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1) : #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    }
}

// MARK: - Button
extension MiningTableViewCell {
    @IBAction func websiteButton(_ sender: UIButton) {
        delegate?.selectedWebsiteButton(index: sender.tag)
    }
    
    @IBAction func twitterButton(_ sender: UIButton) {
        delegate?.selectedTwitterButton(index: sender.tag)
    }
}
