//
//  CoinMarketCapCodable.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation

// MARK: - Coin
struct CoinMarketCapCodable: Codable {
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
