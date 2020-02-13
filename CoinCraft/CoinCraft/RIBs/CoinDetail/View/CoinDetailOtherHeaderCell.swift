//
//  CoinDetailOtherHeaderCell.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/11.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import UIKit

class CoinDetailOtherHeaderCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func bindFeature() {
        titleLabel.text = "Features"
        subTitleLabel.isHidden = true
    }
    
    func bindTotalCoinSupply(totalCoinSupply: String) {
        titleLabel.text = "Total Coin Supply:"
        subTitleLabel.text = totalCoinSupply
    }
    
    func bindStartDate(startDate: String) {
        titleLabel.text = "StartDate:"
        subTitleLabel.text = startDate
    }
}
