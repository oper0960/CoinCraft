//
//  CoinModel.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/03.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit

struct Coin: Codable {
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

struct AllCoinResponse: Decodable {
    let allCoins: [AllCoin]
    
    enum CodingKeys: String, CodingKey {
        case data = "Data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let data = try values.decode(Dictionary<String,AllCoin>.self, forKey: .data)
        allCoins = Array(data.values)
//        print(data)
    }
}

struct AllCoin: Decodable {
    let id: String?
    let url: String?
    let imageUrl: String?
    let contentCreatedOn: Int?
    let name: String?
    let symbol: String?
    let coinName: String?
    let fullName: String?
    let algorithm: String?
    let proofType: String?
    let fullyPremined: String?
    let totalCoinSupply: String?
    let builtOn: String?
    let smartContractAddress: String?
    let decimalPlaces: Int?
    let preMinedValue: String?
    let totalCoinsFreeFloat: String?
    let sortOrder: String?
    let sponsored: Bool?
    let taxonomy: Taxonomy?
    let rating: Rating?
    let isTrading: Bool?
    let totalCoinsMined: Double?
    let blockNumber: Int?
    let netHashesPerSecond: Double?
    let blockReward: Double?
    let blockTime: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case url = "Url"
        case imageUrl = "ImageUrl"
        case contentCreatedOn = "ContentCreatedOn"
        case name = "Name"
        case symbol = "Symbol"
        case coinName = "CoinName"
        case fullName = "FullName"
        case algorithm = "Algorithm"
        case proofType = "ProofType"
        case fullyPremined = "FullyPremined"
        case totalCoinSupply = "TotalCoinSupply"
        case builtOn = "BuiltOn"
        case smartContractAddress = "SmartContractAddress"
        case decimalPlaces = "DecimalPlaces"
        case preMinedValue = "PreMinedValue"
        case totalCoinsFreeFloat = "TotalCoinsFreeFloat"
        case sortOrder = "SortOrder"
        case sponsored = "Sponsored"
        case taxonomy = "Taxonomy"
        case rating = "Rating"
        case isTrading = "IsTrading"
        case totalCoinsMined = "TotalCoinsMined"
        case blockNumber = "BlockNumber"
        case netHashesPerSecond = "NetHashesPerSecond"
        case blockReward = "BlockReward"
        case blockTime = "BlockTime"
    }
}

struct Taxonomy: Decodable {
    let access: String?
    let fca: String?
    let finma: String?
    let industry: String?
    let collateralizedAsset: String?
    let collateralizedAssetType: String?
    let collateralType: String?
    let collateralInfo: String?
    
    enum CodingKeys: String, CodingKey {
        case access = "Access"
        case fca = "FCA"
        case finma = "FINMA"
        case industry = "Industry"
        case collateralizedAsset = "CollateralizedAsset"
        case collateralizedAssetType = "CollateralizedAssetType"
        case collateralType = "CollateralType"
        case collateralInfo = "CollateralInfo"
    }
}

struct Rating: Decodable {
    let weiss: Weiss
    
    enum CodingKeys: String, CodingKey {
        case weiss = "Weiss"
    }
}

struct Weiss: Decodable {
    let rating: String?
    let technologyAdoptionRating: String?
    let marketPerformanceRating: String?
    
    enum CodingKeys: String, CodingKey {
        case rating = "Rating"
        case technologyAdoptionRating = "TechnologyAdoptionRating"
        case marketPerformanceRating = "MarketPerformanceRating"
    }
}


