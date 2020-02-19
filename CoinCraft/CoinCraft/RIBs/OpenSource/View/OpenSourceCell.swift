//
//  OpenSourceCell.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/13.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import UIKit

class OpenSourceCell: UITableViewCell {

    @IBOutlet weak var openSourceNameLabel: UILabel!
    @IBOutlet weak var licenseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(openSource: OpenSource) {
        openSourceNameLabel.text = openSource.opensourceName
        licenseLabel.text = openSource.license.licenseTitle
    }
}
