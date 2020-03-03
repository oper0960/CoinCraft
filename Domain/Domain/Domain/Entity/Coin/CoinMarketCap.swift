//
//  CoinMarketCap.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/03/02.
//  Copyright © 2020 GilwanRyu. All rights reserved.
//

import Foundation

// MARK: - CMCCoin ViewModel
public protocol CoinMarketCapViewable {
    var imageURL: String { get }
    var name: String { get }
    var coinName: String { get }
    var percentage: Double { get }
    var price: String { get }
    var volume: String { get }
    var sortOrder: String { get }
}

public struct CoinMarketCapViewModel: CoinMarketCapViewable {
    private let coin: Coin
    
    public init(coin: Coin) {
        self.coin = coin
    }
    
    public var imageURL: String {
        return Constants.Coin.CoinMarketCap.imageBaseUrl + (self.coin.symbol ?? "")
    }
    
    public var name: String {
        return coin.symbol ?? ""
    }
    
    public var coinName: String {
        return coin.name ?? ""
    }
    
    public var percentage: Double {
        return Double(coin.percent_change_24h ?? "0") ?? 0
    }
    
    public var price: String {
        let doublePrice = Double(coin.price_usd ?? "0")
        return "$\(doublePrice?.addComma ?? "0")"
    }
    
    public var volume: String {
        let doubleVolume = Double(coin.volume_usd_24h ?? "0")
        return "(24Hour) $\(doubleVolume?.addComma ?? "0")"
    }
    
    public var sortOrder: String {
        return coin.rank ?? "0"
    }
}

// MARK: - Coin
public struct Coin: Codable {
    let percent_change_24h: String?
    let percent_change_7d: String?
    let volume_usd_24h: String?
    let last_updated: String?
    let name: String?
    let total_supply: String?
    let market_cap_usd: String?
    let price_usd: String?
    let price_btc: String?
    let percent_change_1h: String?
    let max_supply: String?
    let symbol: String?
    let id: String?
    let available_supply: String?
    let rank: String?
    
    enum CodingKeys: String, CodingKey {
        case percent_change_24h = "percent_change_24h"
        case percent_change_7d = "percent_change_7d"
        case volume_usd_24h = "24h_volume_usd"
        case last_updated = "last_updated"
        case name = "name"
        case total_supply = "total_supply"
        case market_cap_usd = "market_cap_usd"
        case price_usd = "price_usd"
        case price_btc = "price_btc"
        case percent_change_1h = "percent_change_1h"
        case max_supply = "max_supply"
        case symbol = "symbol"
        case id = "id"
        case available_supply = "available_supply"
        case rank = "rank"
    }
}


