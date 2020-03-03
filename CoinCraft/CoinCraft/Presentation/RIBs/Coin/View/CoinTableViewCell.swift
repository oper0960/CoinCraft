//
//  CoinTableViewCell.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/03.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import UIKit
import Kingfisher
import Domain

class CoinTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coinLogoImageView: UIImageView!
    @IBOutlet weak var coinAbbreviationLabel: UILabel!
    @IBOutlet weak var coinRealNameLabel: UILabel!
    @IBOutlet weak var ascentLabel: UILabel!
    @IBOutlet weak var pricePerPieceLabel: UILabel!
    @IBOutlet weak var totalVolumeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(coin: CoinMarketCapViewModel) {
        
        if let imageUrl = URL(string: coin.imageURL) {
            coinLogoImageView.kf.setImage(with: ImageResource(downloadURL: imageUrl, cacheKey: coin.imageURL))
        }
        
        coinAbbreviationLabel.text = coin.name
        coinRealNameLabel.text = coin.coinName
        ascentLabel.text = "\(coin.percentage)%"
        ascentLabel.textColor = coin.percentage < 0 ? #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) : #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        pricePerPieceLabel.text = coin.price
        totalVolumeLabel.text = coin.volume
    }
}