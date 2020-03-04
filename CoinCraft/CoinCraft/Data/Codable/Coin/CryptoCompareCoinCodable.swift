//
//  CryptoCompareCoinCodable.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation

struct CryptoCompareCoinCodable: Decodable {
    let coins: [CryptoCompareCoin]
    
    private enum CodingKeys: String, CodingKey {
        case data = "Data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let data = try values.decode(Dictionary<String,CryptoCompareCoin>.self, forKey: .data)
        coins = Array(data.values)
    }
}

// MARK: - CompareCoin
struct CryptoCompareCoin: Codable {
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
    
    private enum CodingKeys: String, CodingKey {
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
