//
//  CoinDetailTextViewCell.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/11.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import UIKit

class CoinDetailTextViewCell: UITableViewCell {
    
    @IBOutlet weak var descTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(info: String) {
        descTextView.attributedText = info.htmlToAttributedString
    }
}
