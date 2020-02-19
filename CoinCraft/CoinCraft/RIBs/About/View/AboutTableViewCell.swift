//
//  AboutTableViewCell.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/13.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(menu: SettingMenu) {
        
        switch menu {
        case .opensource:
            titleLabel.text = "OpenSource License"
        case.feedback:
            titleLabel.text = "Feedback"
        case.version:
            titleLabel.text = "Version"
        }
    }
}
