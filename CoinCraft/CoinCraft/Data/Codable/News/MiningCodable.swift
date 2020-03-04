//
//  MiningCodable.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Buxi. All rights reserved.
//

import Foundation

struct MiningCodable: Decodable {
    let datums: [Datum]

    enum CodingKeys: String, CodingKey {
        case data = "Data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let data = try values.decode(Dictionary<String,Datum>.self, forKey: .data)
        datums = Array(data.values)
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id: String?
    let url: String?                    // Sub URL
    let logoURL: String?                // Logo URL
    let name: String?                   // Site Name
    let recommended: Bool?
    let sponsored: Bool?
    let mergedMining: Bool?             // 병합된 코인이있는지 (true 면 mergedMiningCoins 에 데이터가 있음)
    let txFeeSharedWithMiner: Bool?
    let affiliateURL: String?           // Main URL
    let poolFeatures: [String]?         // 채굴 풀의 특징?
    let coins: [String]?                // 채굴 가능 코인 인듯?
    let serverLocations: [String]?      // 채굴 서버 지역
    let paymentType: [String]?          // 채굴에 대한 지급 방식? (PPS = 발견한 코인블럭에 기여한 부분을 비율대로 분배, PPLNS = 코인블럭이 발견되기까지 기여한 부분을 비율대로 분배) (APPS, ASRRD, DGM, CPPSRB, POT, PPLNS, PPS, RBPPS, Prop, RSMPPS, SMPPS 등 방식이 많음)
    let mergedMiningCoins: [String]?    // 병합된 코인 리스트
    let twitter: String?                // 코인 트위터 주소
    let averageFee: String?             // 평균 금액 (채굴 수수료인듯?)
    let feeExpanded: String?
    let minimumPayout: String?          // 최소 인출 가능 금액
    let datumRating: DatumRating?       //
    let sortOrder: String?              // 정렬 순서

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case url = "Url"
        case logoURL = "LogoUrl"
        case name = "Name"
        case recommended = "Recommended"
        case sponsored = "Sponsored"
        case mergedMining = "MergedMining"
        case txFeeSharedWithMiner = "TxFeeSharedWithMiner"
        case affiliateURL = "AffiliateURL"
        case poolFeatures = "PoolFeatures"
        case coins = "Coins"
        case serverLocations = "ServerLocations"
        case paymentType = "PaymentType"
        case mergedMiningCoins = "MergedMiningCoins"
        case twitter = "Twitter"
        case averageFee = "AverageFee"
        case feeExpanded = "FeeExpanded"
        case minimumPayout = "MinimumPayout"
        case datumRating = "Rating"
        case sortOrder = "SortOrder"
    }
}

// MARK: - Rating
struct DatumRating: Codable {
    let one: Int?
    let two: Int?
    let three: Int?
    let four: Int?
    let five: Int?
    let avg: Double?
    let totalUsers: Int?

    enum CodingKeys: String, CodingKey {
        case one = "One"
        case two = "Two"
        case three = "Three"
        case four = "Four"
        case five = "Five"
        case avg = "Avg"
        case totalUsers = "TotalUsers"
    }
}
