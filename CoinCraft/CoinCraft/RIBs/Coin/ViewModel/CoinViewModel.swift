//
//  CoinViewModel.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/03.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit

protocol CoinViewModelViewable {
    var imageURL: String { get }
    var name: String { get }
    var coinName: String { get }
    var percentage: Double { get }
    var price: String { get }
    var volume: String { get }
    var sortOrder: String { get }
}

struct CoinViewModel: CoinViewModelViewable {
    private let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
    }
    
    var imageURL: String {
        return Constants.CoinMarketCap.imageBaseUrl + (self.coin.symbol ?? "")
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
