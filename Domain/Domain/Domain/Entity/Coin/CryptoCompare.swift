//
//  CryptoCompare.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/03/02.
//  Copyright © 2020 GilwanRyu. All rights reserved.
//

import Foundation

// MARK: - CompareCoin ViewModel
public protocol CompareCoinViewable {
    var symbol: String { get }
    var id: String { get }
}

public struct CompareCoinViewModel: CompareCoinViewable {
    
    private let coin: CompareCoin
    
    public init(coin: CompareCoin) {
        self.coin = coin
    }
    
    public var symbol: String {
        return coin.symbol ?? ""
    }
    
    public var id: String {
        return coin.id ?? ""
    }
}

// MARK: - CompareCoinDetail ViewModel
public protocol CompareCoinDetailViewable {
    var id: String { get }
    var imageUrl: String? { get }
    var symbol: String { get }
    var name: String { get }
    var description: String? { get }
    var features: String? { get }
    var totalCoinSupply: String { get }
    var startDate: String { get }
}

public struct CompareCoinDetailViewModel: CompareCoinDetailViewable {
    private let detail: CompareCoinDetail
    
    public init(detail: CompareCoinDetail) {
        self.detail = detail
    }
    
    public var id: String {
        return detail.general?.id ?? ""
    }
    
    public var symbol: String {
        return detail.general?.symbol ?? ""
    }
    
    public var name: String {
        return detail.general?.name ?? ""
    }
    
    public var totalCoinSupply: String {
        if let coinSupply = detail.general?.totalCoinSupply, !coinSupply.isEmpty {
            let supply: Double = Double(coinSupply.trimmingCharacters(in: .whitespacesAndNewlines))!
            return supply.addComma
        } else {
            return "0"
        }
    }
    
    public var startDate: String {
        return detail.general?.startDate ?? ""
    }
    
    public var description: String? {
        return detail.general?.generalDescription
    }
    
    public var features: String? {
        return detail.general?.features
    }
    
    public var imageUrl: String? {
        guard let base = detail.seo?.baseImageURL, let image = detail.seo?.ogImageURL else {
            return nil
        }
        return base + image
    }
}

public struct CryptoCompareResponse: Decodable {
    let coins: [CompareCoin]
    
    enum CodingKeys: String, CodingKey {
        case data = "Data"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let data = try values.decode(Dictionary<String,CompareCoin>.self, forKey: .data)
        coins = Array(data.values)
    }
}

// MARK: - CompareCoin
public struct CompareCoin: Codable {
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

// MARK: - CompareCoinDetail
public struct CryptoCompareDetailResponse: Codable {
    let detail: CompareCoinDetail?

    enum CodingKeys: String, CodingKey {
        case detail = "Data"
    }
}

public struct CompareCoinDetail: Codable {
    let seo: Seo?
    let general: General?
    let taxonomy: Taxonomy?
    let ratings: Rating?
    let ico: Ico?
    let subs, streamerDataRaw: [String]?

    enum CodingKeys: String, CodingKey {
        case seo = "SEO"
        case general = "General"
        case taxonomy = "Taxonomy"
        case ratings = "Ratings"
        case ico = "ICO"
        case subs = "Subs"
        case streamerDataRaw = "StreamerDataRaw"
    }
}

public struct Taxonomy: Codable {
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

public struct Rating: Codable {
    let weiss: Weiss
    
    enum CodingKeys: String, CodingKey {
        case weiss = "Weiss"
    }
}

public struct Weiss: Codable {
    let rating: String?
    let technologyAdoptionRating: String?
    let marketPerformanceRating: String?
    
    enum CodingKeys: String, CodingKey {
        case rating = "Rating"
        case technologyAdoptionRating = "TechnologyAdoptionRating"
        case marketPerformanceRating = "MarketPerformanceRating"
    }
}

public struct General: Codable {
    let id, documentType, h1Text, dangerTop: String?
    let warningTop, infoTop, symbol, url: String?
    let baseAngularURL, name, imageURL, generalDescription: String?
    let features, technology, totalCoinSupply, difficultyAdjustment: String?
    let blockRewardReduction, algorithm, builtOn, proofType: String?
    let startDate, twitter: String?
    let websiteURL: String?
    let website: String?
    let lastBlockExplorerUpdateTS, blockNumber, blockTime: Int?
    let netHashesPerSecond, totalCoinsMined: Double?
    let previousTotalCoinsMined: Double?
    let blockReward: Double?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case documentType = "DocumentType"
        case h1Text = "H1Text"
        case dangerTop = "DangerTop"
        case warningTop = "WarningTop"
        case infoTop = "InfoTop"
        case symbol = "Symbol"
        case url = "Url"
        case baseAngularURL = "BaseAngularUrl"
        case name = "Name"
        case imageURL = "ImageUrl"
        case generalDescription = "Description"
        case features = "Features"
        case technology = "Technology"
        case totalCoinSupply = "TotalCoinSupply"
        case difficultyAdjustment = "DifficultyAdjustment"
        case blockRewardReduction = "BlockRewardReduction"
        case algorithm = "Algorithm"
        case builtOn = "BuiltOn"
        case proofType = "ProofType"
        case startDate = "StartDate"
        case twitter = "Twitter"
        case websiteURL = "WebsiteUrl"
        case website = "Website"
        case lastBlockExplorerUpdateTS = "LastBlockExplorerUpdateTS"
        case blockNumber = "BlockNumber"
        case blockTime = "BlockTime"
        case netHashesPerSecond = "NetHashesPerSecond"
        case totalCoinsMined = "TotalCoinsMined"
        case previousTotalCoinsMined = "PreviousTotalCoinsMined"
        case blockReward = "BlockReward"
    }
}

public struct Ico: Codable {
    let status, whitePaper: String?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case whitePaper = "WhitePaper"
    }
}

public struct Seo: Codable {
    let pageTitle, pageDescription: String?
    let baseURL, baseImageURL: String?
    let ogImageURL, ogImageWidth, ogImageHeight: String?

    enum CodingKeys: String, CodingKey {
        case pageTitle = "PageTitle"
        case pageDescription = "PageDescription"
        case baseURL = "BaseUrl"
        case baseImageURL = "BaseImageUrl"
        case ogImageURL = "OgImageUrl"
        case ogImageWidth = "OgImageWidth"
        case ogImageHeight = "OgImageHeight"
    }
}


