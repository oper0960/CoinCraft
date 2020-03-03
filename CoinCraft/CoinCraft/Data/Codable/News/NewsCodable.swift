//
//  NewsModel.swift
//  CoinCraft
//
//  Created by Gilwan Ryu on 2020/03/03.
//  Copyright © 2020 Buxi. All rights reserved.
//

import Foundation

// MARK: - News Codable Model
struct NewsCodable: Codable {
    let papers: [Paper]
    
    private enum CodingKeys: String, CodingKey {
        case papers = "Data"
    }
}

struct Paper: Codable {
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

    private enum CodingKeys: String, CodingKey {
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

struct SourceInfo: Codable {
    let name: String?
    let lang: String?
    let img: String?
}
