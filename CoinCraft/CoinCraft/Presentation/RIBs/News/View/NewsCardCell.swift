//
//  NewsCardCell.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/02/12.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import UIKit
import Kingfisher
import Domain

class NewsCardCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIViewCustom!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(news: NewsViewable) {
        
        self.indicator.startAnimating()
        
        if let imageUrl = URL(string: news.sourceImageUrl) {
            thumbnailImageView.kf.setImage(with: ImageResource(downloadURL: imageUrl, cacheKey: news.imageUrl),
                                          placeholder: nil,
                                          options: nil,
                                          progressBlock: nil)
            { result in
                self.indicator.stopAnimating()
            }
        }
        companyNameLabel.text = news.sourceName
        bodyLabel.text = news.title
        tagsLabel.text = news.tags
    }
}
