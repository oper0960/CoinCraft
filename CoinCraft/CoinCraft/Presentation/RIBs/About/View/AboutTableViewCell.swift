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
    @IBOutlet weak var rightArrowImageView: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var version: String? {
        guard let dictionary = Bundle.main.infoDictionary,
            let version = dictionary["CFBundleShortVersionString"] as? String,
            let build = dictionary["CFBundleVersion"] as? String else {return nil}
        
        let versionAndBuild: String = "Ver: \(version), Build: \(build)"
        return versionAndBuild
    }
    
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
            rightArrowImageView.isHidden = false
            subTitleLabel.isHidden = true
        case.feedback:
            titleLabel.text = "Feedback"
            rightArrowImageView.isHidden = false
            subTitleLabel.isHidden = true
        case.version:
            titleLabel.text = "Version"
            subTitleLabel.text = version
            rightArrowImageView.isHidden = true
            subTitleLabel.isHidden = false
        }
    }
}
