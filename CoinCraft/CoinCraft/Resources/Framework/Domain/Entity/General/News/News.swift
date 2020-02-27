//
//  News.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/02/26.
//  Copyright © 2020 GilwanRyu. All rights reserved.
//

import Foundation

// MARK: - News
public struct News: Codable {
    public let papers: [Paper]
    
    private enum CodingKeys: String, CodingKey {
        case papers = "Data"
    }
}

public struct Paper: Codable {
    public let id: String?
    public let guid: String?
    public let publishedOn: Int?
    public let imageurl: String?
    public let title: String?
    public let url: String?
    public let source: String?
    public let body: String?
    public let tags: String?
    public let categories: String?
    public let upvotes: String?
    public let downvotes: String?
    public let lang: String?
    public let sourceInfo: SourceInfo?

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

public struct SourceInfo: Codable {
    public let name: String?
    public let lang: String?
    public let img: String?
}


