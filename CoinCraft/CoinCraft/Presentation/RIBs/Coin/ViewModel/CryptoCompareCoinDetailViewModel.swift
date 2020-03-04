//
//  CryptoCompareCoinDetailViewModel.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation
import Domain

struct CryptoCompareCoinDetailViewModel: CoinDetailViewable {
    let detail: CryptoCompareCoinDetail
    
    init(detail: CryptoCompareCoinDetail) {
        self.detail = detail
    }
    
    var id: String {
        return detail.general?.id ?? ""
    }
    
    var symbol: String {
        return detail.general?.symbol ?? ""
    }
    
    var name: String {
        return detail.general?.name ?? ""
    }
    
    var totalCoinSupply: String {
        if let coinSupply = detail.general?.totalCoinSupply, !coinSupply.isEmpty {
            let supply: Double = Double(coinSupply.trimmingCharacters(in: .whitespacesAndNewlines))!
            return supply.addComma
        } else {
            return "0"
        }
    }
    
    var startDate: String {
        return detail.general?.startDate ?? ""
    }
    
    var description: String? {
        return detail.general?.generalDescription
    }
    
    var features: String? {
        return detail.general?.features
    }
    
    var imageUrl: String? {
        guard let base = detail.seo?.baseImageURL, let image = detail.seo?.ogImageURL else {
            return nil
        }
        return base + image
    }
}
