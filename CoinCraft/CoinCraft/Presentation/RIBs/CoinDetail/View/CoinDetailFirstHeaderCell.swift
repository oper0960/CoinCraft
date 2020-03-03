//
//  CoinDetailFiirstHeaderCell.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/11.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa
import Domain

protocol DetailHeaderDelegate: class {
    func setBackground(color: UIColor)
}

class CoinDetailFirstHeaderCell: UITableViewCell {
    
    weak var delegate: DetailHeaderDelegate?
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var coinSymbolLabel: UILabel!
    @IBOutlet weak var coinNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func bind(info: CompareCoinDetailViewModel) {
        if let url = info.imageUrl, let image = URL(string: url) {
            logoImageView.kf.setImage(with: ImageResource(downloadURL: image, cacheKey: url), placeholder: nil, options: nil, progressBlock: nil) { result in
                if let backColor = self.logoImageView.image?.averageColor {
                    self.delegate?.setBackground(color: backColor)
                }
            }
        }
        coinSymbolLabel.text = info.symbol
        coinNameLabel.text = info.name
    }
}
