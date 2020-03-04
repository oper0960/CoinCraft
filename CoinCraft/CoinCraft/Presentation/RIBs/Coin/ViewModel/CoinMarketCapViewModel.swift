//
//  CoinMarketCapViewModel.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation
import Domain

struct CoinMarketCapCoinViewModel: CoinViewable {
    private let coin: CoinMarketCapCodable
    
    init(coin: CoinMarketCapCodable) {
        self.coin = coin
    }
    
    var imageURL: String {
        return Constants.Coin.CoinMarketCap.imageBaseUrl + (self.coin.symbol ?? "")
    }
    
    var name: String {
        return coin.symbol ?? ""
    }
    
    var coinName: String {
        return coin.name ?? ""
    }
    
    var percentage: Double {
        return Double(coin.percent_change_24h ?? "0") ?? 0
    }
    
    var price: String {
        let doublePrice = Double(coin.price_usd ?? "0")
        return "$\(doublePrice?.addComma ?? "0")"
    }
    
    var volume: String {
        let doubleVolume = Double(coin.volume_usd_24h ?? "0")
        return "(24Hour) $\(doubleVolume?.addComma ?? "0")"
    }
    
    var sortOrder: String {
        return coin.rank ?? "0"
    }
}
