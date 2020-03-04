//
//  CryptoCompareDetailCodable.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/04.
//  Copyright © 2020 Gilwan Ryu. All rights reserved.
//

import Foundation

// MARK: - CompareCoinDetail
struct CryptoCompareCoinDetailCodable: Codable {
    let detail: CryptoCompareCoinDetail?

    private enum CodingKeys: String, CodingKey {
        case detail = "Data"
    }
}

public struct CryptoCompareCoinDetail: Codable {
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

struct Taxonomy: Codable {
    let access: String?
    let fca: String?
    let finma: String?
    let industry: String?
    let collateralizedAsset: String?
    let collateralizedAssetType: String?
    let collateralType: String?
    let collateralInfo: String?
    
    private enum CodingKeys: String, CodingKey {
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

struct Rating: Codable {
    let weiss: Weiss
    
    private enum CodingKeys: String, CodingKey {
        case weiss = "Weiss"
    }
}

struct Weiss: Codable {
    let rating: String?
    let technologyAdoptionRating: String?
    let marketPerformanceRating: String?
    
    private enum CodingKeys: String, CodingKey {
        case rating = "Rating"
        case technologyAdoptionRating = "TechnologyAdoptionRating"
        case marketPerformanceRating = "MarketPerformanceRating"
    }
}

struct General: Codable {
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

    private enum CodingKeys: String, CodingKey {
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

struct Ico: Codable {
    let status, whitePaper: String?

    private enum CodingKeys: String, CodingKey {
        case status = "Status"
        case whitePaper = "WhitePaper"
    }
}

struct Seo: Codable {
    let pageTitle, pageDescription: String?
    let baseURL, baseImageURL: String?
    let ogImageURL, ogImageWidth, ogImageHeight: String?

    private enum CodingKeys: String, CodingKey {
        case pageTitle = "PageTitle"
        case pageDescription = "PageDescription"
        case baseURL = "BaseUrl"
        case baseImageURL = "BaseImageUrl"
        case ogImageURL = "OgImageUrl"
        case ogImageWidth = "OgImageWidth"
        case ogImageHeight = "OgImageHeight"
    }
}

