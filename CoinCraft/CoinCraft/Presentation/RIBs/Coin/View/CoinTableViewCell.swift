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
import RxSwift

class CoinTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coinLogoImageView: UIImageView!
    @IBOutlet weak var coinAbbreviationLabel: UILabel!
    @IBOutlet weak var coinRealNameLabel: UILabel!
    @IBOutlet weak var mineableLabel: UILabel!
    @IBOutlet weak var maxSupplyLabel: UILabel!
    @IBOutlet weak var circulatingSupplyLabel: UILabel!
    @IBOutlet weak var totalSupplyLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var volume24Label: UILabel!
    @IBOutlet weak var change1Label: UILabel!
    @IBOutlet weak var change24Label: UILabel!
    @IBOutlet weak var change7Label: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(coin: CoinViewable) {
        
        self.indicator.startAnimating()
        
        if let imageUrl = URL(string: coin.imageURL) {
            
            let placeholder: UIImage = #imageLiteral(resourceName: "coinPlaceholder")
            
            coinLogoImageView.kf.setImage(with: ImageResource(downloadURL: imageUrl, cacheKey: coin.imageURL),
                                          placeholder: placeholder,
                                          options: nil,
                                          progressBlock: nil)
            { result in
                self.indicator.stopAnimating()
            }
        }
        
        coinAbbreviationLabel.text = coin.symbol
        coinRealNameLabel.text = coin.name
        mineableLabel.text = coin.mineable
        mineableLabel.textColor = coin.mineable == "true" ? #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        maxSupplyLabel.text = "\(coin.maxSupply) \(coin.symbol)"
        circulatingSupplyLabel.text = "\(coin.circulatingSupply) \(coin.symbol)"
        totalSupplyLabel.text = "\(coin.totalSupply) \(coin.symbol)"
        priceLabel.text = coin.price
        volume24Label.text = coin.volume24h
        change1Label.text = "\(coin.change1h)%"
        change1Label.textColor = coin.change1h < 0 ? #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) : #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        change24Label.text = "\(coin.change24h)%"
        change24Label.textColor = coin.change24h < 0 ? #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) : #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        change7Label.text = "\(coin.change7d)%"
        change7Label.textColor = coin.change7d < 0 ? #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) : #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
}
