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
    let coins: [CoinMarketCapCoin]?
    
    enum CodingKeys: String, CodingKey {
        case coins = "data"
    }
}

// MARK: - Datum
struct CoinMarketCapCoin: Codable {
    let id: Int?
    let name: String?
    let symbol: String?
    let slug: String?
    let numMarketPairs: Int?
    let dateAdded: String?
    let tags: [String]?
    let maxSupply: Double?
    let circulatingSupply: Double?
    let totalSupply: Double?
    let platform: Platform?
    let cmcRank: Int?
    let lastUpdated: String?
    let quote: Quote?

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug
        case numMarketPairs = "num_market_pairs"
        case dateAdded = "date_added"
        case tags
        case maxSupply = "max_supply"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case platform
        case cmcRank = "cmc_rank"
        case lastUpdated = "last_updated"
        case quote = "quote"
    }
}

// MARK: - Platform
struct Platform: Codable {
    let id: Int?
    let name: String?
    let symbol: String?
    let slug: String?
    let tokenAddress: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case slug
        case tokenAddress = "token_address"
    }
}
//
// MARK: - Quote
struct Quote: Codable {
    let data: QuoteInfo?
    
    enum CodingKeys: String, CodingKey {
        case data = "USD"
    }
}

// MARK: - Usd
struct QuoteInfo: Codable {
    let price: Double?
    let volume24H: Double?
    let percentChange1H: Double?
    let percentChange24H: Double?
    let percentChange7D: Double?
    let marketCap: Double?
    let lastUpdated: String?

    enum CodingKeys: String, CodingKey {
        case price
        case volume24H = "volume_24h"
        case percentChange1H = "percent_change_1h"
        case percentChange24H = "percent_change_24h"
        case percentChange7D = "percent_change_7d"
        case marketCap = "market_cap"
        case lastUpdated = "last_updated"
    }
}
