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
    
    var mineable: String {
        guard let tags = coin.tags else { return "false" }
        if !tags.contains("mineable") {
            return "false"
        }
        return "true"
    }
    
    var maxSupply: String {
        let doubleMaxSupply = Double(coin.maxSupply ?? 0)
        return doubleMaxSupply.addComma.description
    }
    
    var circulatingSupply: String {
        let doubleCirculSupply = Double(coin.circulatingSupply ?? 0)
        return doubleCirculSupply.addComma.description
    }
    
    var totalSupply: String {
        let doubleTotalSupply = Double(coin.totalSupply ?? 0)
        return doubleTotalSupply.addComma.description
    }
    
    var volume24h: String {
        let doubleVolume = Double(coin.quote?.data?.volume24H ?? 0)
        return "$\(doubleVolume.addComma)"
    }
    
    var change1h: Double {
        return coin.quote?.data?.percentChange1H ?? 0
    }
    
    var change24h: Double {
        return coin.quote?.data?.percentChange24H ?? 0
    }
    
    var change7d: Double {
        return coin.quote?.data?.percentChange7D ?? 0
    }
}
