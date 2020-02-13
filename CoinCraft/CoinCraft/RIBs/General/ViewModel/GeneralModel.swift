//
//  GeneralModel.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/11.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit

struct NewsResponse: Codable {
    let newsCollection: [News]
    
    enum CodingKeys: String, CodingKey {
        case newsCollection = "Data"
    }
}

struct News: Codable {
    let id: String?
    let guid: String?
    let publishedOn: Int?
    let imageurl: String?
    let title: String?
    let url: String?
    let source: String?
    let body: String?
    let tags: String?
    let categories: String?
    let upvotes: String?
    let downvotes: String?
    let lang: String?
    let sourceInfo: SourceInfo?

    enum CodingKeys: String, CodingKey {
        case id
        case guid
        case publishedOn = "published_on"
        case imageurl
        case title
        case url
        case source
        case body
        case tags
        case categories
        case upvotes
        case downvotes
        case lang
        case sourceInfo = "source_info"
    }
}

// MARK: - SourceInfo
struct SourceInfo: Codable {
    let name: String?
    let lang: String?
    let img: String?
}
