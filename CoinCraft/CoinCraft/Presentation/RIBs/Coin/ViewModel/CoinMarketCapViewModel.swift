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
    private let coin: CoinMarketCapCoin
    
    init(coin: CoinMarketCapCoin) {
        self.coin = coin
    }
    
    var imageURL: String {
        return Constants.Coin.CoinMarketCap.imageBaseUrl + (self.coin.symbol ?? "")
    }

    var symbol: String {
        return coin.symbol ?? ""
    }

    var name: String {
        return coin.name ?? ""
    }

    var percentage: Double {
        return coin.quote?.data?.percentChange24H ?? 0
    }

    var price: String {
        let doublePrice = Double(coin.quote?.data?.price ?? 0)
        return "$\(doublePrice.addComma)"
    }
}
